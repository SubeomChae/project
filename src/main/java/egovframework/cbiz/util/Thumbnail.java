package egovframework.cbiz.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.lang.InterruptedException;

import javax.servlet.ServletOutputStream;
import javax.swing.ImageIcon;
import com.sun.image.codec.jpeg.*;
import Acme.JPM.Encoders.GifEncoder;
 
import javax.swing.ImageIcon;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class Thumbnail {
	public static void main(String[] args) {
        long start = System.currentTimeMillis();
        long end = 0;
        try{
            createThumbnail("D:\\AV001(1).jpg", "D:\\AV001(2).jpg", 130, true);
            end = System.currentTimeMillis();
            System.out.println(end-start);
        }catch(InterruptedException e){
            System.out.println(e.toString());
        }catch(IOException e){
            System.out.println(e.toString());
        }
	}

    /** Creates a new instance of ImgUtils */
    public Thumbnail() {
    }
    
    private static void saveJPEG(BufferedImage bi, String newImg) throws InterruptedException, IOException{
        FileOutputStream fos = null;
        try{
            fos = new FileOutputStream(newImg);
            JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(fos); 
            JPEGEncodeParam jep = jpeg.getDefaultJPEGEncodeParam(bi); 
            jep.setQuality(1, false); 
            jpeg.encode(bi, jep);
       }finally{
            if(fos != null) fos.close();
       }
    }
    
    private static void saveGIF(BufferedImage bi, String newImg) throws IOException{
        FileOutputStream fos = null;
        try{
            fos = new FileOutputStream(newImg);
            GifEncoder gif = new GifEncoder(bi, fos);
            gif.encode();
        }finally{
            if(fos != null) fos.close();
        }        
    }

    private static void sendBMP(BufferedImage bi, ServletOutputStream sos) throws Exception{
        JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(sos); 
        //JPEGEncodeParam jep = jpeg.getDefaultJPEGEncodeParam(bi); 
        //jep.setQuality(1, false); 
        jpeg.encode(bi); 
        
    }
    
    private static void sendJPEG(BufferedImage bi, ServletOutputStream sos) throws Exception{
        JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(sos); 
        JPEGEncodeParam jep = jpeg.getDefaultJPEGEncodeParam(bi); 
        jep.setQuality(1, false); 
        jpeg.encode(bi, jep); 
    }
    
    private static void sendGIF(BufferedImage bi, ServletOutputStream sos) throws Exception{
        GifEncoder gif = new GifEncoder(bi, sos);
        gif.encode();
    }
    
    public static void createThumbnail(Image oldImg, String newImg, int targetW, boolean useSharpen) throws InterruptedException, IOException{
    	String imgExt = getExtension(newImg);
    	BufferedImage bi = getBufferedImage(oldImg, targetW, imgExt);
    	
        if(imgExt.equals("jpg")){
            if(useSharpen) bi = sharpen(bi);
            saveJPEG(bi, newImg);
        } else if(imgExt.equals("gif")) {
            saveGIF(bi, newImg);
        } else if(imgExt.equals("bmp")) {
        	saveJPEG(bi, newImg);
        }
    }
    
    public static void getThumbnail(Image oldImg, int targetW, boolean useSharpen, ServletOutputStream sos) throws Exception{
    	String imgExt = "jpg";
    	
        if(imgExt.equals("jpg")){
        	BufferedImage bi = getBufferedImage(oldImg, targetW, imgExt);
            if(useSharpen) bi = sharpen(bi);
            sendJPEG(bi, sos);
        } else if(imgExt.equals("gif")) {
        	BufferedImage bi = getBufferedImage(oldImg, targetW, imgExt);
            sendGIF(bi, sos);
	    } else if(imgExt.equals("bmp")) {
	    	BufferedImage bi = getThumbnailStream(oldImg, targetW);
	    	sendJPEG(bi, sos);
	    }
    }

	public static BufferedImage getThumbnailStream(Image inImage, int maxDim) throws Exception {
		// Determine the scale.
		double scale = (double)maxDim/(double)inImage.getHeight(null);
		if (inImage.getWidth(null) > inImage.getHeight(null)) {
			scale = (double)maxDim/(double)inImage.getWidth(null);
		}

		if ((double)maxDim >(double)inImage.getHeight(null) && 
			(double)maxDim >(double)inImage.getWidth(null)) {
			scale = 1.0;	
		}

		// Determine size of new image. One of them
		// should equal maxDim.
		int scaledW = (int)(scale*inImage.getWidth(null));
		int scaledH = (int)(scale*inImage.getHeight(null));
		System.out.println(scaledW);
		System.out.println(scaledH);
		// Create an image buffer in which to paint on.
		BufferedImage outImage = new BufferedImage(scaledW, scaledH,
			BufferedImage.TYPE_INT_RGB);

		// Set the scale.  
		AffineTransform tx = new AffineTransform();

		// If the image is smaller than the desired image size,
		// don't bother scaling.
		if (scale < 1.0d) {
			tx.scale(scale, scale);
		}

		// Paint image.
		Graphics2D g2d = outImage.createGraphics();
		g2d.drawImage(inImage, tx, null);
		g2d.dispose();
		return outImage;
	}    
    
    private static BufferedImage getBufferedImage(Image oldImg, int targetW, String imgExt) {
        int oldW = oldImg.getWidth(null);
        int oldH = oldImg.getHeight(null);
        
        int newW = targetW;
        int newH = (targetW * oldH) / oldW;        

        Image imgTarget = oldImg.getScaledInstance(newW, newH, Image.SCALE_FAST);
        ImageIcon imgIcon = new ImageIcon(imgTarget);

        BufferedImage bi = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_RGB); 
          //bi.setRGB(0, 0, newW, newH, pixels, 0, newW);
        bi.createGraphics().drawImage(imgTarget, 0,0, imgIcon.getImageObserver());    	
        return bi;
    } 
    
    public static void getThumbnail(String oldimg, int targetW, boolean useSharpen, ServletOutputStream sos) throws Exception {
        ImageIcon imgIcon = new ImageIcon(oldimg);
        getThumbnail(imgIcon.getImage(), targetW, useSharpen, sos);
     }    
    
    public static void createThumbnail(String oldimg, String newImg, int targetW, boolean useSharpen) throws InterruptedException, IOException{
       ImageIcon imgIcon = new ImageIcon(oldimg);
       createThumbnail(imgIcon.getImage(), newImg, targetW, useSharpen);
    }
    
    private static BufferedImage sharpen(BufferedImage srcImg){
        float[] SHARPEN3x3 = {0.f, -1.f, 0.f,
                                         -1.f, 5.0f, -1.f,
                                          0.f, -1.f, 0.f};
        BufferedImage dstbimg = new BufferedImage(srcImg.getWidth(),srcImg.getHeight(),BufferedImage.TYPE_INT_RGB);
        Kernel kernel = new Kernel(3,3,SHARPEN3x3);
        ConvolveOp cop = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
        return cop.filter(srcImg,dstbimg);
    }
    
    private static String getExtension(String filename) {
		if(filename != null) {
		    int i = filename.lastIndexOf('.');
		    if(i>0 && i<filename.length()-1) {
			return filename.substring(i+1).toLowerCase();
		    };
		}
		return null;
    }
}
