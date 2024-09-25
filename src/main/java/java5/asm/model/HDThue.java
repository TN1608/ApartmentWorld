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
@Table(name="Hopdongthue")
public class HDThue {
    @Id
    @Column(name="maHD")
    String maHD;
    @Column(name="mataikhoanthue")
    String mataikhoan;
    @Column(name="maphong")
    String maphong;
    @Column(name="ngaybatdau")
    Date ngaythue;
    @Column(name="ngayketthuc")
    Date ngayhethan;
}
