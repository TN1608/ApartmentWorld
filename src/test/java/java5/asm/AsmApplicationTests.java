package java5.asm;

import jakarta.xml.bind.DatatypeConverter;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@SpringBootTest
class AsmApplicationTests {

    private static final Logger log = LoggerFactory.getLogger(AsmApplicationTests.class);

    @Test
    void contextLoads() throws NoSuchAlgorithmException {
        String pass = "123456";
//        java security md5
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(pass.getBytes());

        byte[] digest = md.digest();
        String md5Hash = DatatypeConverter.printHexBinary(digest);

        log.info("MD5 hash 1: {}", md5Hash);

        md.update(pass.getBytes());
        digest = md.digest();
        String md5Hash2 = DatatypeConverter.printHexBinary(digest);

        log.info("MD5 hash 2: {}", md5Hash2);

//        spring security bcrypt
        PasswordEncoder passEncoder = new BCryptPasswordEncoder(10);
        log.info("BCrypt hash 1: {}", passEncoder.encode(pass));
        log.info("BCrypt hash 2: {}", passEncoder.encode(pass));

        log.info("BCrypt matches 1: {}", passEncoder.matches(pass, passEncoder.encode(pass)));
    }

}
