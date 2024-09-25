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
@Table(name="trangthaisudung")
public class trangthaisudung {
    @Id
    @Column(name = "matrangthai")
    private String matrangthai;
    @Column(name = "trangthai")
    private String trangthai;
}
