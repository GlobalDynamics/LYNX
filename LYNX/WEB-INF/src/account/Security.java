package account;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Security {
	private static String complexity = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,20})";
	public static String complexityTest(String pass1, String pass2)
	{
		if(pass1 != null && pass2 != null)
		{
			if(pass1.equals(pass2))
			{
				 Pattern pattern = Pattern.compile(complexity);
				  Matcher matcher = pattern.matcher(pass1);
				  
				  if(matcher.matches())
				  {
					  return "true";
				  }
						  
			}
			return "Password is not complex enough.";
		}
		return "Invalid passwords.";
	}
}
