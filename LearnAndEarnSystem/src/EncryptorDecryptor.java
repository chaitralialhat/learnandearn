

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.Random;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;




public class EncryptorDecryptor {

    /**
     * @param args the command line arguments
     */
    public EncryptorDecryptor() {
	}
    
    public static byte[] getSalt256(){
    	final byte[] cdrives = hexStringToByteArray("0xe04fd020ea3a6910a2d808002b30309d");
        return cdrives;
    }
    public static byte[] hexStringToByteArray(String s) {
        int len = s.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
                                 + Character.digit(s.charAt(i+1), 16));
        }
        return data;
    }
    
    public static String getHash256(String text, byte[] salt) throws NoSuchAlgorithmException, UnsupportedEncodingException
    {
        final int MAX_ITER = 10000;
        
        // get salt
        
        
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        
        
        byte[] msg = text.getBytes("utf-8");
        
        
        md.reset();
        md.update(salt,0,salt.length);
        md.update(msg,0,msg.length);
       
        // get the final digest
        byte[] mbytes = md.digest();
        
        // build the String representation of the hash
        StringBuilder s = new StringBuilder();
        for(byte i:mbytes)
        {
            s.append(Integer.toHexString(i&0xFF));
        }
        return s.toString();
    }
    

    
}
