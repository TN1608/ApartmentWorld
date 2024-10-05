package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.hibernate.annotations.Nationalized;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "lichsuthanhtoan")
public class lichsuthanhtoan {
    @Id
    @Column(name = "mathanhtoan", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maHD")
    private hopdongthue maHD;

    @Column(name = "sotien")
    private Double sotien;

    @Column(name = "ngaythanhtoan")
    private LocalDate ngaythanhtoan;

    @Size(max = 50)
    @Nationalized
    @Column(name = "hinhthucthanhtoan", length = 50)
    private String hinhthucthanhtoan;

}
