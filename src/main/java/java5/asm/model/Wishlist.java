package java5.asm.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "wishlist")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Wishlist {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tentaikhoan")
    private taikhoan tentaikhoan;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maphong")
    private phongtro maphong;

    @Column(name = "ngaythem")
    private Instant ngaythem = Instant.now();


    public Date convert(Instant instant) {
        return Date.from(instant);
    }

}