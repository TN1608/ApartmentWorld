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
@Table(name="phongtro")
public class phongtro {
    @Id
    @Column(name="maphong")
    String maphong;
    @Column(name="title")
    String tenphong;
    @Column(name="diachi")
    String diachi;
    @Column(name="anh")
    String anh;
    @Column(name="giaphong")
    double giaphong;
    @Column(name="mota")
    String mota;
    @Column(name="matinhtrang")
    String matinhtrang;
    @Column(name="mataikhoan")
    String mataikhoan;
    @Column(name="matrangthai")
    String matrangthai;
}
