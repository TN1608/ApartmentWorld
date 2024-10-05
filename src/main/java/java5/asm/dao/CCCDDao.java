package java5.asm.dao;

import java5.asm.model.CCCD;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CCCDDao extends JpaRepository<CCCD,String> {
        @Query("Select c from CCCD c where c.taikhoan.tentaikhoan = ?1")
        CCCD findByTentaikhoan(String tentaikhoan);
}
