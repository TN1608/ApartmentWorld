package java5.asm.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name="chitietphongtro")
public class chitietPT {
    @Id
    @Column(name="maCT")
    String maCT;
    @Column(name = "anhchitiet")
    String anhchitiet;
    @Column(name = "noidungchitiet")
    String noidungchitiet;
    @Column(name = "maphong")
    String maphong;
}
