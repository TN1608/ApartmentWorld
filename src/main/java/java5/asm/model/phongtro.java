package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.hibernate.annotations.Nationalized;

import java.util.LinkedHashSet;
import java.util.Set;

@Data
@Entity
@Table(name="phongtro")
public class phongtro {

    @Id
    @Size(max = 20)
    @Column(name = "maphong", nullable = false, length = 20)
    private String maphong;

    @Size(max = 200)
    @NotNull
    @Nationalized
    @Column(name = "tenphong", nullable = false, length = 200)
    private String tenphong;

    @Size(max = 250)
    @NotNull
    @Nationalized
    @Column(name = "diachi", nullable = false, length = 250)
    private String diachi;

    @Size(max = 100)
    @NotNull
    @Nationalized
    @Column(name = "anh", nullable = false, length = 100)
    private String anh;

    @NotNull
    @Column(name = "giaphong", nullable = false)
    private Double giaphong;

    @Size(max = 2000)
    @NotNull
    @Nationalized
    @Column(name = "mota", nullable = false, length = 2000)
    private String mota;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "matinhtrang", nullable = false)
    private tinhtrang matinhtrang;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "tentaikhoan", nullable = false)
    private taikhoan tentaikhoan;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "matrangthai", nullable = false)
    private trangthaisudung matrangthai;

    @OneToMany(mappedBy = "maphong")
    private Set<chitietphongtro> chitietphongtros = new LinkedHashSet<>();

}
