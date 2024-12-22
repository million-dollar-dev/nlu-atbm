package util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

public class DateUtil {
	public static Timestamp convertToTimestamp(String fullDateStr) {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss yyyy", Locale.ENGLISH);
			java.util.Date parsedDate = formatter.parse(fullDateStr);
			return new Timestamp(parsedDate.getTime());
		} catch (ParseException e) {
			System.err.println("Lỗi khi phân tích chuỗi timestamp: " + e.getMessage());
			return null;
		}
	}
	
	public static boolean isAfterNow(String inputTimestamp) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
            Date inputDate = formatter.parse(inputTimestamp);
            Date now = new Date();
            return inputDate.after(now);
        } catch (ParseException e) {
            System.err.println("Định dạng timestamp không hợp lệ: " + e.getMessage());
            return false;
        }
    }
	
	public static void main(String[] args) {
		Timestamp test = convertToTimestamp("9999-12-31 23:59:59.0");
		System.out.println(test.toString());
	}
}
