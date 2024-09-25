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
@Table(name="danhgia")
public class danhgia {
    @Id
    @Column(name="madanhgia")
    String madanhgia;
    @Column(name="mataikhoan")
    String mataikhoan;
    @Column(name="maphong")
    String maphong;
    @Column(name="noidung")
    String noidung;
    @Column(name="sosao")
    int sosao;
    @Column(name="thoigian")
    Date thoigian;
}
