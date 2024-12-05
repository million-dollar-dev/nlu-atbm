package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Helpers {
	public static boolean isValidPhoneNumber(String phoneNumber) {
		String patternRegex = "^(\\+?84|0[1-9])+([0-9]{8})$";
		Pattern pattern = Pattern.compile(patternRegex);
		Matcher matcher = pattern.matcher(phoneNumber);
		return matcher.matches();
	}
}
