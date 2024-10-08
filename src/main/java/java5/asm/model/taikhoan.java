package java5.asm.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.Nationalized;

import java.io.Serializable;
import java.time.Instant;
import java.time.LocalDate;
import java.util.List;

@Data
@Entity
@Table(name = "taikhoan")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class taikhoan implements Serializable {

    @Id
    @Size(max = 150)
    @Column(name = "tentaikhoan", nullable = false, length = 150)
    private String tentaikhoan;

    @Size(max = 100)
    @Nationalized
    @Column(name = "firstname", length = 100)
    private String firstname;

    @Size(max = 100)
    @Nationalized
    @Column(name = "lastname", length = 100)
    private String lastname;

    @Size(max = 200)
    @NotNull
    @Column(name = "matkhau", nullable = false, length = 200)
    private String matkhau;

    @Size(max = 15)
    @Column(name = "sodienthoai", length = 15)
    private String sodienthoai;

    @Size(max = 200)
    @Nationalized
    @Column(name = "mota", length = 200)
    private String mota;

    @Column(name = "gioitinh")
    private Boolean gioitinh;

    @Column(name = "ngaysinh")
    private LocalDate ngaysinh;

    @Size(max = 200)
    @Column(name = "anhtaikhoan", length = 200)
    private String anhtaikhoan;

    @Column(name = "vaitro")
    private boolean vaitro;

    @Size(max = 150)
    @Nationalized
    @Column(name = "email", length = 150)
    private String email;

    @OneToOne(mappedBy = "taikhoan", cascade = CascadeType.ALL)
    @JsonIgnore
    private CCCD cccd;

    @JsonIgnore
    @OneToMany(mappedBy = "tentaikhoan")
    private List<phongtro> phongtro;

    @ColumnDefault("false")
    @Column(name = "email_verified", nullable = false)
    private Boolean emailVerified = false;

    @ColumnDefault("false")
    @Column(name = "phone_verified", nullable = false)
    private Boolean phoneVerified = false;

    @ColumnDefault("getdate()")
    @Column(name = "ngaytao")
    private Instant ngaytao = Instant.now();

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private UserStatus status = UserStatus.NONE;

    public enum UserStatus {
        NONE,
        WAITING,
        APPROVED,
        FREE,
        PREMIUM,
    }
}
