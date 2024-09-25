package java5.asm.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name="CCCD")
public class CCCD {
    @Id
    @Column(name="maCCCD")
    String maCCCD;
    @Column(name="ngaycap")
    Date ngaycap;
    @Column(name="noicap")
    String noicap;
    @Column(name="anhCCCD")
    String anhCCCD;
}
