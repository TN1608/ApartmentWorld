package java5.asm.dao;

import java5.asm.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NotificationDAO extends JpaRepository<Notification, Long> {
    @Query("SELECT n FROM Notification n " +
            "WHERE n.tentaikhoan.tentaikhoan = ?1 AND n.isRead = false " +
            "ORDER BY n.createAt DESC")
    List<Notification> findByUser(String tentaikhoan);

}
