package java5.asm.utils;

import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import java5.asm.dao.usersDAO;
import java5.asm.model.taikhoan;
import java5.asm.services.CookieService;
import java5.asm.services.SessionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;

@Component
public class AuthUtils {

    private static final Logger log = LoggerFactory.getLogger(AuthUtils.class);
    @Autowired
    private SessionService sessionService;

    @Autowired
    private CookieService cookieService;

    @Autowired
    private usersDAO usersDAO;

    protected static final String SIGNER_KEY = "b+53ZSqBpFM+Bo7M7AbY4/BihW3GklWJbFg5upCR8Zjm1Z4JWcrsi+u9UtWaSrcT";


    public taikhoan getCurrentUser() {
        taikhoan user = null;
        var token = cookieService.getValue("token");
        if (token != null) {
            if (checkToken(token)) {
                String username = getIdFormToken(token);
                user = usersDAO.findById(username).orElse(null);
                if (user != null) {
                    sessionService.set("token", token);
                } else {
                    cookieService.remove("token");
                    sessionService.remove("token");
                }
            } else {
                cookieService.remove("token");
                sessionService.remove("token");
            }
        } else {
            token = sessionService.get("token");
            if (token != null && checkToken(token)) {
                String username = getIdFormToken(token);
                user = usersDAO.findById(username).orElse(null);
                if (user == null) {
                    sessionService.remove("token");
                }
            }
        }
        return user;
    }

    public boolean isAdmin(taikhoan user) {
        return user != null && user.isVaitro();
    }

    public boolean isEmailVerified(taikhoan user) {
        if (user != null) {
            Boolean isVerified = user.getEmailVerified();
            return isVerified != null && isVerified;
        }
        return false;
    }

    public boolean isPhoneVerified(taikhoan user) {
        if (user != null) {
            Boolean isVerified = user.getPhoneVerified();
            return isVerified != null && isVerified;
        }
        return false;
    }

    public boolean checkPass(String username, String password) {
        taikhoan user = usersDAO.findById(username).orElse(null);
        if (user != null) {
            PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
            return passwordEncoder.matches(password, user.getMatkhau());
        }
        return false;
    }

    public String generateToken(String username) {
//        header của json web token gồm thuật toán mã hóa là h512
        JWSHeader header = new JWSHeader(JWSAlgorithm.HS512);
//        body của json web token gồm thông tin về người dùng
        JWTClaimsSet claimsSet = new JWTClaimsSet.Builder()
                .subject(username)
                .issuer("team-none-idea-demo")
                .claim("customClain", "more info")
                .issueTime(new Date())
                .expirationTime(new Date(
                        Instant.now().plus(1, ChronoUnit.DAYS).toEpochMilli()
                ))
                .build();

        Payload payload = new Payload(claimsSet.toJSONObject());

        JWSObject jwsObject = new JWSObject(header, payload);

        try {
            jwsObject.sign(new MACSigner(SIGNER_KEY.getBytes()));
            return jwsObject.serialize();
        } catch (JOSEException e) {
            log.error("Error signing JWT token", e);
            throw new RuntimeException(e);
        }
    }

    private boolean checkToken(String token) {
        try {
            JWSVerifier verifier = new MACVerifier(SIGNER_KEY.getBytes());
            SignedJWT signedJWT = SignedJWT.parse(token);
            Date expirationTime = signedJWT.getJWTClaimsSet().getExpirationTime();

            var verify = signedJWT.verify(verifier);
//            if (verify && expirationTime.after(new Date())) {
//                return true;
//            }
            return verify && expirationTime.after(new Date());
        } catch (Exception e) {
            log.error("Error parsing JWT token", e);
            throw new RuntimeException(e);
        }
    }

    public String getIdFormToken(String token) {
        try {
            JWSVerifier verifier = new MACVerifier(SIGNER_KEY.getBytes());
            SignedJWT signedJWT = SignedJWT.parse(token);

            if (signedJWT.verify(verifier)) {
                JWTClaimsSet claimsSet = signedJWT.getJWTClaimsSet();
                return claimsSet.getSubject(); // lấy thông tin về người dùng
            } else {
                throw new RuntimeException("JWT token verification failed");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error parsing JWT token", e);
        }
    }
}
