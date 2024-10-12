package java5.asm.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.time.Instant;
import java.util.Date;

@Data
@Entity
@Table(name = "notification")
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Size(max = 255)
    @Nationalized
    @Column(name = "message")
    private String message;

    @Column(name = "is_read")
    private Boolean isRead = false;

    @Column(name = "createAt")
    private Instant createAt = Instant.now();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tentaikhoan")
    private taikhoan tentaikhoan;

    public Date convertDate(Instant instant) {
        return Date.from(instant);
    }
}