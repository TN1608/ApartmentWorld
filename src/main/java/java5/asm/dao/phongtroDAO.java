package java5.asm.dao;

import java5.asm.model.phongtro;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface phongtroDAO extends JpaRepository<phongtro, String> {
    @Query("SELECT p FROM phongtro p WHERE p.tenphong like ?1")
    Page<phongtro> findByKeywords(String keywords, Pageable pageable);

    //    //Price
//    @Query("SELECT p FROM phongtro p WHERE p.giaphong BETWEEN ?1 AND ?2")
//    Page<phongtro>findByPrice(int min, int max);
//    //PriceBetween
//    @Query("SELECT p FROM phongtro p WHERE p.giaphong BETWEEN ?1 AND ?2")
//    Page<phongtro>findByPriceBetween(int min, int max);
    @Query("Select p.maphong from phongtro p order by length(p.maphong) desc,p.maphong desc")
    String findTopByMaphong();

    @Query("SELECT p FROM phongtro p WHERE p.trangthai = ?1")
    List<phongtro> findByTrangThai(phongtro.trangthai trangthai);

    @Query("SELECT p FROM phongtro p WHERE p.tentaikhoan.tentaikhoan like ?1")
    List<phongtro> findByTentaikhoan(String tentaikhoan);
}
