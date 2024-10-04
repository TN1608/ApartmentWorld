package java5.asm.model.province;

import lombok.Data;

import java.util.List;

@Data
public class District {
    private String name;
    private int code;
    private String codename;
    private String divisionType;
    private int provinceCode;
    private List<Ward> wards;
}
