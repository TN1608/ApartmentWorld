package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.hibernate.annotations.Nationalized;

import java.io.Serializable;
import java.time.Instant;
import java.time.LocalDate;
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tentaikhoan")
    private taikhoan tentaikhoan;

    @Size(max = 250)
    @Nationalized
    @Column(name = "tenCCCD", length = 250)
    private String tenCCCD;

    @Column(name = "ngaysinhCCCD")
    private Instant ngaysinhCCCD;

    @Size(max = 250)
    @Column(name = "anhTruocCCCD", length = 250)
    private String anhTruocCCCD;

    @Size(max = 50)
    @Column(name = "anhSauCCCD", length = 50)
    private String anhSauCCCD;

}
