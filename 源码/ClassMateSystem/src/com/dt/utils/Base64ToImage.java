package com.dt.utils;

import java.io.IOException;

import Decoder.BASE64Decoder;
import java.io.*;
public class Base64ToImage {

	public static boolean GenerateImageFormBase64(String base64, String imagePath){
		if(base64 == null){
			return false;
		}
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			byte[] bytes = decoder.decodeBuffer(base64);
			for(int i = 0; i < bytes.length; i++){
				if(bytes[i] < 0)
					bytes[i] += 256;
			}
		    OutputStream out = new FileOutputStream(imagePath);
		    out.write(bytes);
		    out.flush();
		    out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;
	}
	
}
