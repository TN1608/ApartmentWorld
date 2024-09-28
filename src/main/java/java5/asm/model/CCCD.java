package java5.asm.model;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "CCCD")
public class CCCD implements Serializable {
    @Id
    String maCCCD;
    Date ngaycap;
    String noicap;
    String anhCCCD;
    @OneToOne @JoinColumn(name = "tentaikhoan", referencedColumnName = "tentaikhoan")
    taikhoan taikhoan;
}
