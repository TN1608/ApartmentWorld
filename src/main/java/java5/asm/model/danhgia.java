package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.hibernate.annotations.Nationalized;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "danhgia")
public class danhgia {
    @Id
    @Column(name = "madanhgia", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tentaikhoan")
    private taikhoan tentaikhoan;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maphong")
    private phongtro maphong;

    @Size(max = 500)
    @Nationalized
    @Column(name = "noidung", length = 500)
    private String noidung;

    @Column(name = "sosao")
    private Integer sosao;

    @Column(name = "ngaydanhgia")
    private LocalDate ngaydanhgia;

}
