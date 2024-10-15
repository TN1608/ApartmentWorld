package java5.asm.dao;

import java5.asm.model.phongtro;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface phongtroDAO extends JpaRepository<phongtro, String> {
    @Query("SELECT p FROM phongtro p WHERE " +
            "CAST(p.giaphong AS string) LIKE %?1% " +
            "OR p.tenphong LIKE %?1% " +
            "OR p.maphong LIKE %?1% " +
            "OR p.diachi LIKE %?1% " +
            "OR p.tentaikhoan.tentaikhoan LIKE %?1%")
    Page<phongtro> findByKeywords(String keywords, Pageable pageable);

    //    //Price
//    @Query("SELECT p FROM phongtro p WHERE p.giaphong BETWEEN ?1 AND ?2")
//    Page<phongtro>findByPrice(int min, int max);
//    //PriceBetween
    @Query("SELECT p FROM phongtro p WHERE p.giaphong BETWEEN ?1 AND ?2")
    Page<phongtro> findByPriceBetween(int min, int max, Pageable pageable);

    @Query("Select p.maphong from phongtro p order by length(p.maphong) desc,p.maphong desc")
    String findTopByMaphong();

    @Query("SELECT p.maphong FROM phongtro p WHERE p.maphong LIKE 'P%' ORDER BY p.maphong DESC")
    List<String> findAllMaphong();


    @Query("SELECT p FROM phongtro p WHERE p.trangthai = ?1")
    List<phongtro> findByTrangThai(phongtro.trangthai trangthai);

    @Query("SELECT p FROM phongtro p WHERE p.trangthai = ?1")
    Page<phongtro> findByTrangThai(phongtro.trangthai trangthai, Pageable pageable);

    @Query("SELECT p FROM phongtro p WHERE p.tentaikhoan.tentaikhoan like ?1")
    List<phongtro> findByTentaikhoan(String tentaikhoan);

    @Query("Select p from phongtro p where p.tinhtrang = ?1")
    Page<phongtro> findByTinhtrang(phongtro.tinhtrang tinhtrang, Pageable pageable);
}
