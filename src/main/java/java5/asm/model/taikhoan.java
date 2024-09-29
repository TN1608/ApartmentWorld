package java5.asm.model;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "taikhoan")
public class taikhoan implements Serializable {
    @Id
    String tentaikhoan;
    String firstname;
    String lastname;
    String matkhau;
    String sodienthoai;
    String mota;
    boolean gioitinh;
    Date ngaysinh;
    String anhtaikhoan;
    boolean vaitro;
//    email đâu vcl ????????????
}
