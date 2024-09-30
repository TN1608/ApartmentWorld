package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.hibernate.annotations.Nationalized;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "taikhoan")
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

    @OneToMany(mappedBy = "tentaikhoan")
    private Set<CCCD> cccds = new LinkedHashSet<>();

    @OneToMany(mappedBy = "tentaikhoan")
    private Set<phongtro> phongtros = new LinkedHashSet<>();

}
