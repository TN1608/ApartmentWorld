package java5.asm.dao;

import java5.asm.model.taikhoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface usersDAO extends JpaRepository<taikhoan, String> {

    @Query("SELECT u FROM taikhoan u WHERE u.email = ?1")
    List<taikhoan> findByEmail(String email);

    @Query("SELECT u FROM taikhoan u WHERE u.status = ?1")
    List<taikhoan> findByStatus(taikhoan.UserStatus status);


    @Query("SELECT u FROM taikhoan u WHERE u.seller = ?1 or u.seller = ?2")
    List<taikhoan> findBySeller(taikhoan.UserSeller seller, taikhoan.UserSeller seller2);
}
