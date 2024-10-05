package java5.asm.dao;

import java5.asm.model.hopdongthue;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HDTDao extends JpaRepository<hopdongthue, Integer> {
}
