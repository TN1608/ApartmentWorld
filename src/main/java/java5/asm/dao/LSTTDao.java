package java5.asm.dao;

import java5.asm.model.lichsuthanhtoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface LSTTDao extends JpaRepository<lichsuthanhtoan, Integer> {
//    @Query("SELECT l FROM lichsuthanhtoan l JOIN hopdongthue h ON l.maHD = h.maHD WHERE h.tentaikhoan = :tentaikhoan")
//    List<lichsuthanhtoan> findByTentaikhoan(@Param("tentaikhoan") String tentaikhoan);
}
