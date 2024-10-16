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
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

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

    @Enumerated(EnumType.STRING)
    @Column(name = "seller", nullable = false)
    private UserSeller seller = UserSeller.NONE;

    @OneToMany(mappedBy = "tentaikhoan")
    private Set<danhgia> danhgias = new LinkedHashSet<>();

    @OneToMany(mappedBy = "tentaikhoan")
    private Set<hopdongthue> hopdongthues = new LinkedHashSet<>();

    @OneToMany(mappedBy = "tentaikhoan")
    private Set<Notification> notifications = new LinkedHashSet<>();

    public enum UserStatus {
        NONE("Không"),
        WAITING("Chờ duyệt"),
        APPROVED("Đã duyệt");

        private final String description;

        UserStatus(String description) {
            this.description = description;
        }

        public String getDescription() {
            return description;
        }
    }

    public enum UserSeller {
        NONE("Không"),
        WAITING_FREE("Chờ duyệt tài khoản miễn phí"),
        WAITING_PREMIUM("Chờ duyệt tài khoản cao cấp"),
        FREE("Tài khoản miễn phí"),
        PREMIUM("Tài khoản cao cấp");

        private final String description;

        UserSeller(String description) {
            this.description = description;
        }

        public String getDescription() {
            return description;
        }
    }
}
