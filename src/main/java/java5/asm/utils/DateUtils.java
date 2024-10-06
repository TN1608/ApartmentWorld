package java5.asm.utils;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

public class DateUtils {
    public static Date convertToDate(Instant instant) {
        return Date.from(instant);
    }
}
