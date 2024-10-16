package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.hibernate.annotations.Nationalized;

import java.time.Instant;
import java.time.LocalDate;
import java.util.Date;

@Data
@Entity
@Table(name = "lichsuthanhtoan")
public class lichsuthanhtoan {
    @Id
    @Column(name = "mathanhtoan", nullable = false)
    private Integer id;

    @Column(name = "sotien")
    private Double sotien;

    @Size(max = 50)
    @Nationalized
    @Column(name = "hinhthucthanhtoan", length = 50)
    private String hinhthucthanhtoan;

    @Column(name = "ngaythanhtoan")
    private LocalDate ngaythanhtoan;
}
