package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "hopdongthue")
public class hopdongthue {
    @Id
    @Size(max = 20)
    @Column(name = "maHD", nullable = false, length = 20)
    private String maHD;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tentaikhoan")
    private taikhoan tentaikhoan;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maphong")
    private phongtro maphong;

    @Column(name = "ngaybatdau")
    private LocalDate ngaybatdau;

    @Column(name = "ngayketthuc")
    private LocalDate ngayketthuc;

    @OneToMany(mappedBy = "maHD")
    private Set<lichsuthanhtoan> lichsuthanhtoans = new LinkedHashSet<>();

}