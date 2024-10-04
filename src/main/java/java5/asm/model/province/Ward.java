package java5.asm.model.province;

import lombok.Data;

@Data
public class Ward {
    private String name;
    private int code;
    private String codename;
    private String divisionType;
    private int provinceCode;
}
