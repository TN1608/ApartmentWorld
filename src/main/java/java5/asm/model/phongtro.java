package java5.asm.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java5.asm.utils.StringListConverter;
import lombok.Data;
import org.hibernate.annotations.Nationalized;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Data
@Entity
@Table(name = "phongtro")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class phongtro {

    @Id
    @Size(max = 20)
    @Column(name = "maphong", nullable = false, length = 20)
    private String maphong;

    @Size(max = 200)
    @NotNull
    @Nationalized
    @Column(name = "tenphong", nullable = false, length = 200)
    private String tenphong;

    @Size(max = 250)
    @NotNull
    @Nationalized
    @Column(name = "diachi", nullable = false, length = 250)
    private String diachi;

    @Convert(converter = StringListConverter.class)
    @Column(name = "anh")
    private List<String> anh = new ArrayList<>();

    @NotNull
    @Column(name = "giaphong", nullable = false)
    private Double giaphong;

    @Size(max = 2000)
    @NotNull
    @Nationalized
    @Column(name = "mota", nullable = false, length = 2000)
    private String mota;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "tentaikhoan", nullable = false)
    private taikhoan tentaikhoan;

    @OneToMany(mappedBy = "maphong")
    private Set<chitietphongtro> chitietphongtros = new LinkedHashSet<>();

    @Enumerated(EnumType.STRING)
    @Column(name = "tinhtrang", length = 150)
    private tinhtrang tinhtrang;

    @Enumerated(EnumType.STRING)
    @Column(name = "trangthai", length = 150)
    private trangthai trangthai;

    @OneToMany(mappedBy = "maphong")
    private Set<danhgia> danhgias = new LinkedHashSet<>();

    @OneToMany(mappedBy = "maphong")
    private Set<hopdongthue> hopdongthues = new LinkedHashSet<>();

    //ENUM
    public enum trangthai {
        Renting("Đang cho thuê"),
        Rented("Đã thuê hết"),
        NoRent("Không cho thuê"),
        Waiting("Chờ duyệt"),
        Deleted("Đã xóa"),
        Hidden("Ẩn"),
        Approved("Đã duyệt");

        private final String description;

        trangthai(String description) {
            this.description = description;
        }

        public String getDescription() {
            return description;
        }
    }


    public enum tinhtrang {
        NTCC("Nội thất cao cấp"),
        NTDD("Nội thất đầy đủ"),
        NT("Nhà trống");

        private final String description;

        tinhtrang(String description) {
            this.description = description;
        }

        public String getDescription() {
            return description;
        }
    }
}
