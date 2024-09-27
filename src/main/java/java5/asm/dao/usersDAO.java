package java5.asm.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java5.asm.model.taikhoan;
import java5.asm.utils.JpaUtils;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface usersDAO extends JpaRepository<taikhoan,String> {

}
