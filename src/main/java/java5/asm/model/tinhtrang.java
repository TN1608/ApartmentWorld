package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Data
@Table(name="tinhtrang")
public class tinhtrang {

    @Id
    @Size(max = 20)
    @Column(name = "matinhtrang", nullable = false, length = 20)
    private String matinhtrang;

    @Size(max = 100)
    @Column(name = "loaitinhtrang", length = 100)
    private String loaitinhtrang;

    @OneToMany(mappedBy = "matinhtrang")
    private Set<phongtro> phongtros = new LinkedHashSet<>();

}
