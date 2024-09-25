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
@Table(name="lichsuthanhtoan")
public class lichsuthanhtoan {
    @Id
    @Column(name="mathanhtoan")
    String mathanhtoan;
    @Column(name="maHD")
    String maHD;
    @Column(name="ngaythanhtoan")
    Date ngaythanhtoan;
    @Column(name="hinhthucthanhtoan")
    String hinhthucthanhtoan;
}
