package java5.asm.dao;

import java5.asm.model.CCCD;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CCCDDao extends JpaRepository<CCCD,String> {
//    <Optional> CCCD findByTentaikhoan(String tentaikhoan);
}
