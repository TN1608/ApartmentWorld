package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.hibernate.annotations.Nationalized;

import java.util.LinkedHashSet;
import java.util.Set;

@Data
@Entity
@Table(name="trangthaisudung")
public class trangthaisudung {

    @Id
    @Size(max = 20)
    @Column(name = "matrangthai", nullable = false, length = 20)
    private String matrangthai;

    @Size(max = 100)
    @Nationalized
    @Column(name = "trangthai", length = 100)
    private String trangthai;

    @OneToMany(mappedBy = "matrangthai")
    private Set<phongtro> phongtros = new LinkedHashSet<>();

}
