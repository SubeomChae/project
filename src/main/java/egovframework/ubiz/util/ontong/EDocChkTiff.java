package egovframework.ubiz.util.ontong;

import java.io.File;
import java.util.Arrays;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.metadata.IIOMetadata;
import javax.imageio.stream.FileImageInputStream;
import javax.imageio.stream.ImageInputStream;

import com.sun.media.imageio.plugins.tiff.BaselineTIFFTagSet;
import com.sun.media.imageio.plugins.tiff.TIFFDirectory;
import com.sun.media.imageio.plugins.tiff.TIFFField;
import com.sun.media.jai.codec.FileSeekableStream;
import com.sun.media.jai.codec.ImageCodec;
import com.sun.media.jai.codec.ImageDecoder;
import com.sun.media.jai.codec.TIFFEncodeParam;

public class EDocChkTiff  {
	private String unzipRootPath = "";
	private StringBuffer errSb = new StringBuffer();
	
	public EDocChkTiff(String unzipRootPath) {
		this.unzipRootPath = unzipRootPath;
	}
	
	public String chkTiff() throws Exception {
		recursiveFileChk(unzipRootPath);
		return errSb.toString();
	}
	/**
	 * 하위 디렉토리 전체의 tiff 파일을 체크 
	 */
	public void recursiveFileChk(String dirPath) throws Exception {
		File[] files = (new File(dirPath)).listFiles();
		Arrays.sort(files);
		for(File file : files) {
			if (file.isDirectory()) {
				recursiveFileChk(file.getAbsolutePath());
			} else if (file.getName().toLowerCase().endsWith(".tif") || file.getName().toLowerCase().endsWith(".tiff")) { 
				int rtn = -1;
				try { 
					rtn = getCompression(file.getAbsolutePath());
				} catch (Exception ex) {
					ex.printStackTrace();
					errSb.append(file.getAbsolutePath().replaceAll(unzipRootPath, "") + " : 파일정보 조회 오류 \n");
				}
				if (rtn == -9999) {
					errSb.append(file.getAbsolutePath().replaceAll(unzipRootPath, "") + " : 멀티페이지 파일 \n");
				} else if (rtn == -8888) {
					errSb.append(file.getAbsolutePath().replaceAll(unzipRootPath, "") + " : 해상도 오류(가로, 세로 300이상)\n");
				} else if (rtn != TIFFEncodeParam.COMPRESSION_GROUP4) {
					errSb.append(file.getAbsolutePath().replaceAll(unzipRootPath, "") + " : CCITT형식이 아님\n");
				}
			}
		}
	}
	
	public static int getCompression(String tifFilePath) throws Exception {
		Iterator readersIterator = ImageIO.getImageReadersByFormatName("tif");
		ImageReader imageReader = (ImageReader)readersIterator.next();
		ImageInputStream imageInputStream = null;
		FileSeekableStream fileSeekableStream = null;
		int valueOfField = -1;
		try {
			imageInputStream = new FileImageInputStream(new File(tifFilePath));
			imageReader.setInput(imageInputStream,false, true);
	 
			fileSeekableStream = new FileSeekableStream(new File(tifFilePath));
	 
			ImageDecoder iDecoder = ImageCodec.createImageDecoder("tiff", fileSeekableStream, null);

			// 멀티페이지 체크
			int pageCount = iDecoder.getNumPages(); 
			if (pageCount != 1) {
				valueOfField = -9999;
			} else {
				IIOMetadata imageMetadata = imageReader.getImageMetadata(0);
				
				TIFFDirectory ifd = TIFFDirectory.createFromMetadata(imageMetadata);
		
				TIFFField fieldXRes = ifd.getTIFFField(BaselineTIFFTagSet.TAG_X_RESOLUTION);
				TIFFField fieldYRes = ifd.getTIFFField(BaselineTIFFTagSet.TAG_Y_RESOLUTION);

				// 해상도 체크 
				int xRes = fieldXRes.getAsInt(0);
				int yRes = fieldYRes.getAsInt(0);
				if (xRes < 300 || yRes < 300) {
					valueOfField = -8888;
				} else {
					// 압축방식 체크
					TIFFField compField = ifd.getTIFFField(259);
					valueOfField = compField.getAsInt(0);
				} 
			}
			/* Value of Property*/
			return valueOfField;
		} catch (Exception ex) {
			System.out.println(tifFilePath);
			ex.printStackTrace();
		} finally {
			if (fileSeekableStream != null) { try { fileSeekableStream.close(); } catch (Exception ex) {ex.printStackTrace();}}
			if (imageInputStream != null) { try { imageInputStream.close(); } catch (Exception ex) {ex.printStackTrace();}}

		}
		return valueOfField;
	}
}

