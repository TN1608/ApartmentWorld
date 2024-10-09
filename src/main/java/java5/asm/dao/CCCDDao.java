package java5.asm.dao;

import java5.asm.model.CCCD;
import java5.asm.model.taikhoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CCCDDao extends JpaRepository<CCCD, String> {
    @Query("Select c from CCCD c where c.taikhoan.tentaikhoan = ?1")
    CCCD findByTentaikhoan(String tentaikhoan);

    @Query("Select c " +
            "from CCCD c " +
            "where c.taikhoan.status = ?1")
    List<CCCD> findCCCDByUser(taikhoan.UserStatus status);
}
