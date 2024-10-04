package java5.asm.model.province;

import lombok.Data;

import java.util.List;

@Data
public class Province {
    private String name;
    private int code;
    private String divisionType;
    private int phoneCode;
    private String codename;
    private List<District> districts;
}
