package Util;

public class extractKorean {
	public static String extract(String str) {
		return str.replaceAll("[^\uAC00-\uD7AF\\u1100-\u11FF\u3130-\u318F]", " ").trim();
	}
}
