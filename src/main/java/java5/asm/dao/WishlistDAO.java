package java5.asm.dao;


import java5.asm.model.Wishlist;
import java5.asm.model.phongtro;
import java5.asm.model.taikhoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface WishlistDAO extends JpaRepository<Wishlist, Long> {

    @Query("SELECT w FROM Wishlist w " +
            "WHERE w.tentaikhoan.tentaikhoan = ?1")
    List<Wishlist> findByUser(String tentaikhoan);

    void deleteByTentaikhoanAndMaphong(taikhoan tentaikhoan, phongtro maphong);
}