package java5.asm.dao;

import java5.asm.model.taikhoan;
import org.springframework.data.jpa.repository.JpaRepository;

public interface usersDAO extends JpaRepository<taikhoan,String> {

}
