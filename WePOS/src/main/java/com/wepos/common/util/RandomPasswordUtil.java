package com.wepos.common.util;

public class RandomPasswordUtil {
	
	public String getRandomPassword()
	{
		char[] charSet = new char[] {'0', '1', '2', '3', '4', '5', '6', 
				'7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 
				'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
		
		int index = 0;
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i < 8; i++)
		{
			index = (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		
		return sb.toString();		
	}

}
