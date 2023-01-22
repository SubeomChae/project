package egovframework.cbiz.util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;

import com.sun.jimi.core.*;
import com.sun.jimi.core.util.GraphicsUtils;

import egovframework.cbiz.crypto.*;

/**
 * 이미지 또는 DWG 파일로 부터 썸네일 정보를 추출하는 클래스
 * 
 * @author 곽정산
 * 
 */
public class ThumbImage {
		
	/**
	 * 썸네일 정보를 저장할 ByteBuffer
	 */
	private ByteBuffer oByteBuffer;
	
	/**
	 * 
	 */
	public ThumbImage()
	{
		oByteBuffer = null;
	}
	
	/**
	 * 이미지 파일의 썸네일 정보를 추출하는 함수
	 * 
	 * @param srcFile 썸네일을 추출할 원본 이미지 파일경로
	 * @return 추출된 썸네일 정보 Byte Array
	 * @throws ECIException	지원하지 않는 파일포맷의 경우 예외 발생
	 */
	public byte[] getTumbFromImage(String srcFile) throws ECIException
	{
		// 썸네일 이미지의 가로, 세로 픽셀수 
		int iThumbWidth = 0;
		int iThumbHeight = 0;

		Image image = null;

		// 이미지 파일로 부터 썸네일이미지를 생성한다. 
		image = JimiUtils.getThumbnail(srcFile,150,150,Jimi.VIRTUAL_MEMORY);
		GraphicsUtils.waitForImage(image);
				
		//Jimi.putImage(image, "c:/enctest/jimitest.bmp");
		
		// 썸네일이미지를 얻어온다. 
		iThumbWidth = image.getWidth(null);
		iThumbHeight = image.getHeight(null);
		
		if(iThumbWidth == -1 || iThumbHeight == -1){
			throw new ECIException("썸네일 정보 추출과정에서 오류가 발생했습니다.");
		}
		
		// 썸네일 이미지를  그리기 위한 BufferedImage 생성 
		BufferedImage thumb = new BufferedImage(iThumbWidth, iThumbHeight,BufferedImage.TYPE_INT_RGB);
		
		// 썸네일 이미지를 그리기 위한 Graphics 객체를 얻어온다. 
		Graphics  gd = thumb.getGraphics();
		
		// Graphics 객체를 이용해서 썸네일 이미지를 그린다.
		gd.drawImage(image, 0, 0, null);
		gd.dispose();
				
		// 24 Bitmap 이미지를  생성시 1 줄의 데이터 바이트수가 4의 배수가 되어한다. 
		int iPadd = 4 - (iThumbWidth * 3) % 4;
		if (iPadd == 4)
			iPadd = 0;
		
		// BITMAP 데이터를 저장하는데  필요한 데이터 사이즈를 계산한다. 
		int dataSize= ((iThumbWidth * 3) + iPadd) * iThumbHeight ;
		
		// BITMAP 해더 사이즈를 포함한 필요한 메모리를 확보한다. 
		oByteBuffer = ByteBuffer.allocate(dataSize+40);
		
		// 비트맵 해더정보를 기록한다. 
		writeLong(40); 				// DWORD      biSize   			- 해더의 총길이
		writeLong(iThumbWidth); 	// LONG       biWidth  			- 가로픽셀수
		writeLong(iThumbHeight);	// LONG       biHeight 			- 세로픽셀수
		writeShort((short)1); 		// WORD       biPlanes;			- 무조건 1로 해야됨
		writeShort((short)24); 		// WORD       biBitCount;		- 칼라비트수 
		writeLong(0); 				// DWORD      biCompression;	- 압축방식 0 압축안함
		writeLong(dataSize); 		// DWORD      biSizeImage;		- 이미지 사이즈 
		writeLong(3780); 			// LONG       biXPelsPerMeter;	- X 축 미터당 픽셀수 (고정값) 
		writeLong(3780); 			// LONG       biYPelsPerMeter;	- Y 축 미터당 픽셀수 (고정값)
		writeLong(0); 				// DWORD      biClrUsed 		- 사용하는 칼라인덱스 모든색상인경우 0
		writeLong(0); 				// DWORD      biClrImportant 	- 필요한 칼라인덱스 모든색상인경우 0
		
		// 썸네일 이미지 픽셀 데이터를  기록한다. 
		for (int i=iThumbHeight-1; i > -1;i-- )
		{	
			for (int j=0; j < iThumbWidth;j++)
			{
				writeRGB(thumb.getRGB(j, i));
			}	
			
			// 기록한 Byte 수가 4의 배수가 되도록 채움
			for (int k=0; k < iPadd; k++)
			{
				oByteBuffer.put((byte)0x00);
			}			
		}		
		
		return oByteBuffer.array();		
	}
	
	/**
	 * 이미지 파일의 썸네일 정보를 추출하는 함수
	 * 
	 * @param srcFile 썸네일을 추출할 원본 이미지 파일
	 * @return	추출된 썸네일 정보 Byte Array
	 * @throws ECIException	지원하지 않는 파일포맷의 경우 예외 발생
	 */
	public byte[] getTumbFromImage(File srcFile) throws ECIException
	{			
		return getTumbFromImage(srcFile.getPath());
	}
	
	/**
	 * DWG 파일에서 썸네일 정보를 추출하는 함수
	 * @param srcFile 썸네일을 추출하고자하는 DWG 파일
	 * @return 추출된 썸네일 정보 Byte Array
	 * @throws ECIException DWG 파일에 썸네일 정보가 존재하지 않는경우 예외발생
	 */
	public byte[] getTumbFromDWG(File srcFile) throws ECIException
	{
		// DWG 파일을 읽기 위한 RandomAccessFile 객체
		RandomAccessFile raf = null;
		
		// 썸네일 이미지 영역의 위치
		long preview_image_add = 0;
		
		// 썸네일 이미지 영역의 크기
		long image_area_size = 0;
		
		// 썸네일 이미지 존재여부
		byte imagespresent = 0x00;
		
		// 데이터 구분코드
		byte code = 0x00;
		
		// 썸네일 이미지 해더정보의 위치
		long image_area_header_add = 0;
		
		// 썸네일 이미지 해더정보의 크기
		long image_area_header_size = 0;
		
		// 썸네일 이미지 데이터의 위치
		long bmp_area_add = 0;
		
		// 썸네일 이미지 데이터의 크기
		long bmp_area_size = 0;
		
		// DWG 버전정보 해더 문자열
		String strVer = null;
		
		// 썸네일 정보를 반환할 Byte Array
		byte[] retVal = null;
		
		// DWG 파일은 Open 한다.
		try {
			raf = new RandomAccessFile(srcFile, "rws");
		} catch (FileNotFoundException e) {
			new ECIException(e.getMessage());
		}		
		
		try {			
			// DWG 버전 정보를 가져온다.
			strVer = readString(raf, 7);
			
			// DWG 버전정보가 'AC1009' 와 'AC1012' 인경우 썸네일 정보가 없다.
			if ("AC1009".equals(strVer) || "AC1012".equals(strVer))	{
				throw new ECIException("썸네일 정보가 없습니다.");
			}
			
			raf.seek(0x0d);						// 썸네일 이미지 영역 위치 정보가 들어있는 위치로 이동한다.
			preview_image_add = readLong(raf);	// 썸네일 이미지 영역 위치 정보를 읽어온다.
			raf.seek(preview_image_add);		// 썸네일 이미지 영역으로 이동한다.
			raf.skipBytes(16);					// 불필요한 바이트를 스킵한다.
			image_area_size = readLong(raf);	// 썸네일 이미지 영역 크기 정보를 읽어온다.
			imagespresent =  raf.readByte();	// 썸네일 이미지 존재여부 정보를 읽어온다.		

			// 썸네일 정보가 없는경우 
			if (imagespresent != 0x02)
			{
				throw new ECIException("썸네일 정보가 없습니다.");
			}
			
			code = raf.readByte();
			if (code == 0x01)
			{
				image_area_header_add = readLong(raf);	// 썸네일 이미지 해더 위치정보를 읽어온다.
				image_area_header_size = readLong(raf);	// 썸네일 이미지 해더 크기정보를 읽어온다.
			}
			else
			{
				throw new ECIException("썸네일 정보 추출과정에서 오류가 발생했습니다.");
			}
			code = raf.readByte();
			if (code == 0x02)
			{
				bmp_area_add = readLong(raf);	// 썸네일 이미지 데이터 위치정보를 읽어온다.
				bmp_area_size = readLong(raf);	// 썸네일 이미지 데이터 크기정보를 읽어온다.
			}
			else
			{
				throw new ECIException("썸네일 정보 추출과정에서 오류가 발생했습니다.");
			}
			
			// 썸네일 이미지 데이터 위치까지 이동한다.
			raf.seek(bmp_area_add);	
			
			// 썸네일 이미지 데이터 크기의 Byte Array 를 생성한다.
			retVal = new byte[(int)bmp_area_size];
			
			// 썸네일 이미지 정보를 읽어온다.
			raf.read(retVal);
			
		} catch (IOException e) {
			throw new ECIException(e.getMessage());
		} finally 	{
			if (raf != null) {
				try {
					raf.close();
				} catch (IOException e) {}
			}		}		
		
		return retVal;
	}
	
	/**
	 * BYTE BUFFER 에 LONG 값을 BYTE 배열로 변환하여 기록한다. 
	 * 
	 * @param l 기록하고자 하는 LONG 값
	 */
	public void writeLong(long l) {
		for (int j = 0; j < 4; j++) {
			oByteBuffer.put((byte)((l >> (j * 8)) & 0xFF));
		}
	}
	
	/**
	 * BYTE BUFFER 에 SHORT 값을 BYTE 배열로 변환하여 기록한다. 
	 * 
	 * @param s 기록하고자 하는 SHORT 값
	 */
	public void writeShort(short s) {
		for (int j = 0; j < 2; j++) {
			oByteBuffer.put((byte)((s >> (j * 8)) & 0xFF));
		}
	}
	
	/**
	 * BYTE BUFFER 에 픽셀정보 값을 BYTE 배열로 변환하여 기록한다. 
	 * 
	 * @param pixel 기록하고자 하는 픽셀
	 */
	public void writeRGB(int pixel){		
		oByteBuffer.put((byte)(pixel & 0x000000ff ));			// Blue
		oByteBuffer.put((byte)((pixel & 0x0000ff00 ) >> 8));	// Green
		oByteBuffer.put((byte)((pixel & 0x00ff0000 ) >> 16));	// Red		
		return ;
	}		
	
	/**
	 * 파일스트림에서 부터 문자열을 읽어오는 함수
	 * 
	 * @param raf	데이터를 읽어올 입력스트림
	 * @param len	읽어올 문자열 길이 
	 * @return		읽어진 byte[len] 값을 String 으로 변환하여 반환한다.
	 * @throws IOException	
	 */
	private String readString(RandomAccessFile raf, int len) throws IOException {
		byte buffer[] = new byte[len];
		raf.read(buffer);
		return new String(buffer);
	}	
	
	/**
	 * 파일스트림에서 long 타입의 데이터를 읽어오는 함수
	 * 
	 * @param raf	데이터를 읽어올 입력스트림
	 * @return		읽어진 byte[4] 값을 long 으로 변환하여 반환한다.
	 * @throws IOException
	 */
	private long readLong(RandomAccessFile raf) throws IOException {
		long i = 0;
		byte buffer[] = new byte[4];
		raf.read(buffer);

		for (int j = buffer.length - 1; j > -1; j--) {
			i += (buffer[j] & 0xFF) << (j * 8);
		}
		return i;
	}	
}
