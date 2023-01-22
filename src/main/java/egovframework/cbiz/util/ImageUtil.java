package egovframework.cbiz.util;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;

public class ImageUtil{

	public BufferedImage createImage(String text, int width, int height){
		 BufferedImage img = new BufferedImage(width, height, 2);
	     Graphics2D g = img.createGraphics(); //img is a BufferedImage read in from file system
	     g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
	                    RenderingHints.VALUE_ANTIALIAS_ON);
	     Font fnt=new Font("Dante",Font.ITALIC,20);
	     
	     Color fntC = new Color(4, 4, 109); 
	     
	     g.setColor(fntC);
	     g.setFont(fnt);
	     Dimension d = new Dimension(width, height);
	     drawCenteredString(text, d.width, d.height, g);
	     
	     return img;
	}
	
	public static void drawCenteredString(String s, int w, int h, Graphics g) {
	      FontMetrics fm = g.getFontMetrics();
	      int x = (w - fm.stringWidth(s)) / 2;
	      int y = (fm.getAscent() + (h - (fm.getAscent() + fm.getDescent())) / 2);
	      g.drawString(s, x, y);
	}

}  