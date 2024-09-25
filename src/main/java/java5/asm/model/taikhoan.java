package java5.asm.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.*;
import lombok.*;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name="taikhoan")
public class taikhoan {
    @Id
    @Column(name="manguoidung")
            @NotBlank(message = "{NotBlank.taikhoan.manguoidung}")
    String manguoidung;
    @Column(name="tennguoidung")
            @NotBlank(message = "{NotBlank.taikhoan.tennguoidung}")
    String tennguoidung;
    @Column(name="matkhau")
            @NotBlank(message = "{NotBlank.taikhoan.matkhau}")
            @Min(value = 0, message = "{Min.taikhoan.matkhau}")
    String matkhau;
    @Column(name="sodienthoai")
            @NotBlank(message = "{NotBlank.taikhoan.sodienthoai}")
            @Min(value = 0, message = "{Min.taikhoan.sodienthoai}")
            @Max(value = 10, message = "{Max.taikhoan.sodienthoai}")
    String sodienthoai;
    @Column(name="mota")
    String mota;
    @Column(name="gioitinh")
            @NotNull(message = "{NotEmpty.taikhoan.gioitinh}")
    boolean gioitinh;
    @Column(name="ngaysinh")
            @NotNull(message = "{NotEmpty.taikhoan.ngaysinh}")
    Date ngaysinh;
    @Column(name="anhtaikhoan")
    String anhtaikhoan;
    @Column(name="vaitro")
    boolean vaitro;
    @Column(name="maCCCD")
            @NotBlank(message = "{NotBlank.taikhoan.maCCCD}")
    String maCCCD;
}
