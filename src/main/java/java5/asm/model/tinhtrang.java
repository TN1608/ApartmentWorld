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
@Table(name="tinhtrang")
public class tinhtrang {
    @Id
    @Column(name = "matinhtrang")
    String matinhtrang;
    @Column(name = "loaitinhtrang")
    String loaitinhtrang;
}
