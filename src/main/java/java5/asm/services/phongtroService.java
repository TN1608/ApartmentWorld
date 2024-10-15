package java5.asm.services;

import java5.asm.dao.phongtroDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class phongtroService {
    @Autowired
    private phongtroDAO dao;

    public String getMaPhong(){
        List<String> existedMa = dao.findAllMaphong();
        int max = 0;
        for (String maphong : existedMa) {
            try{
                int num = Integer.parseInt(maphong.substring(1));
                if(num > max){
                    max = num;
                }
            }catch(NumberFormatException e){
            }
        }
        return "P" + (max+1);
    }
}
