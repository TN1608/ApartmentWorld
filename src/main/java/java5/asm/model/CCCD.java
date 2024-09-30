package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.hibernate.annotations.Nationalized;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

@Data
@Entity
@Table(name = "CCCD")
public class CCCD implements Serializable {

    @Id
    @Size(max = 12)
    @Column(name = "maCCCD", nullable = false, length = 12)
    private String maCCCD;

    @Column(name = "ngaycap")
    private LocalDate ngaycap;

    @Size(max = 450)
    @Nationalized
    @Column(name = "noicap", length = 450)
    private String noicap;

    @Size(max = 250)
    @Column(name = "anhCCCD", length = 250)
    private String anhCCCD;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tentaikhoan")
    private taikhoan tentaikhoan;

}
