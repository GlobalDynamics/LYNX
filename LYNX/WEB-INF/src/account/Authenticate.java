package account;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import org.apache.commons.codec.binary.Base64;

public class Authenticate {
	public static String finalpass;
	public static byte[] encodedPass;
	public static int iterations = 1500;
	public static String salt;
	private static SecureRandom random = new SecureRandom();

	public static String[] auth(String pass1, String pass2, String username)
			throws UnsupportedEncodingException, NoSuchAlgorithmException {
		if (pass1.equals(pass2)) {
			finalpass = null;
			salt = saltGen();
			encodedPass = getEncoding(pass1 + salt, "UTF-8");
			finalpass = hash(encodedPass);
		}
		String[] createStore = {finalpass,salt};
		return createStore;
	}

	public static String login(String pass, String salt)
			throws UnsupportedEncodingException, NoSuchAlgorithmException {
		finalpass = null;
		encodedPass = getEncoding(pass + salt, "UTF-8");
		finalpass = hash(encodedPass);
		return finalpass;
	}

	private static byte[] getEncoding(String input, String encode)
			throws UnsupportedEncodingException {
		byte[] b = input.getBytes(encode);
		return b;
	}

	private static String hash(byte[] pass) throws NoSuchAlgorithmException,
			UnsupportedEncodingException {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.reset();
		for (int i = 0; i <= iterations; i++) {
			md.reset();
			pass = md.digest(pass);
		}
		pass = Base64.encodeBase64(pass);
		return new String(pass, "US-ASCII");
	}

	public static String saltGen() {
		return new BigInteger(130, random).toString(32);
	}
}