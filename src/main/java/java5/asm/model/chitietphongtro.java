package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "chitietphongtro")
public class chitietphongtro {
    @Id
    @Size(max = 20)
    @Column(name = "maCT", nullable = false, length = 20)
    private String maCT;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maphong")
    private phongtro maphong;

}