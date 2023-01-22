package egovframework.ubiz.util.ontong;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.xml.sax.InputSource;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.XMLUtil;

import egovframework.ubiz.util.OntongUtil;
import egovframework.ubiz.util.ontong.batch.*;
import egovframework.ubiz.util.ontong.fdoc.*;

public class EDocUtil {

	private static EDocSql edocSql = null;

	public static synchronized EDocSql getEdocSql() throws Exception {
		if(edocSql == null) {
			edocSql = new EDocSql();
		}
		return edocSql;
	}

	public static FmsDoc getDocXml(String rcvNo, String masterXmlPath, String docXmlPath, String dwgXmlPath) {
		FmsDoc fDoc = new FmsDoc();
		fDoc.rcvNo = rcvNo;
		fDoc.rootDirPath = "";
		fDoc.masterXmlPath = masterXmlPath;
		fDoc.alDocList.add(docXmlPath);
		if(!dwgXmlPath.isEmpty() && FileUtil.isExistFile(dwgXmlPath)) {
			fDoc.alDwgList.add(dwgXmlPath);
		}
		fDoc.isFmsDocFld = true;
		return fDoc;
	}

	public static FmsDoc getDocXml(String rcvNo, String path) {
		FmsDoc fDoc = new FmsDoc();

		boolean isFmsDocFld = false;
		File f = new File(path);
		// doc , dwg 폴더 아래에 있는 index check
		for(int i=0; i < f.listFiles().length; i++) {
			if(f.listFiles()[i].getName().startsWith("DOCCD")) {
				if(FileUtil.isExistFile(f.listFiles()[i].getAbsolutePath() + "/master.xml")) {
					(new File(f.listFiles()[i].getAbsolutePath() + "/master.xml")).renameTo(new File(f.listFiles()[i].getParent() + "/master.xml"));
				}
				if(FileUtil.isExistFile(f.listFiles()[i].getAbsolutePath() + "/docindex.xml")) {
					(new File(f.listFiles()[i].getAbsolutePath() + "/docindex.xml")).renameTo(new File(f.listFiles()[i].getParent() + "/docindex.xml"));
				}
			}else if(f.listFiles()[i].getName().startsWith("DWGCD")) {
				if(FileUtil.isExistFile(f.listFiles()[i].getAbsolutePath() + "/master.xml")) {
					(new File(f.listFiles()[i].getAbsolutePath() + "/master.xml")).renameTo(new File(f.listFiles()[i].getParent() + "/master.xml"));
				}
				if(FileUtil.isExistFile(f.listFiles()[i].getAbsolutePath() + "/dwgindex.xml")) {
					(new File(f.listFiles()[i].getAbsolutePath() + "/dwgindex.xml")).renameTo(new File(f.listFiles()[i].getParent() + "/dwgindex.xml"));
				}
			}
		}
		for(int i=0; i < f.listFiles().length; i++) {
			if(f.listFiles()[i].isFile() && f.listFiles()[i].getName().endsWith("master.xml")) {
				fDoc.masterXmlPath = f.listFiles()[i].getAbsolutePath();
			}else if(f.listFiles()[i].isFile() && f.listFiles()[i].getName().endsWith("docindex.xml")) {
				fDoc.alDocList.add(f.listFiles()[i].getAbsolutePath());
			}else if(f.listFiles()[i].isFile() && f.listFiles()[i].getName().endsWith("dwgindex.xml")) {
				fDoc.alDwgList.add(f.listFiles()[i].getAbsolutePath());
			}

			if(fDoc.masterXmlPath.isEmpty() == false && (fDoc.alDocList.size() > 0 || fDoc.alDwgList.size() > 0)) {
				isFmsDocFld = true;
			}
		}

		if(isFmsDocFld) {
			fDoc.rcvNo = rcvNo;
			fDoc.rootDirPath = path;
		}

		if(!isFmsDocFld && f.listFiles().length > 0) {
			f = f.listFiles()[0];
			if(f.isDirectory()) {
				for(int i=0; i < f.listFiles().length; i++) {
					if(f.listFiles()[i].getName().startsWith("DOCCD")) {
						fDoc.masterXmlPath = f.listFiles()[i].getAbsolutePath() + "/master.xml";
						fDoc.alDocList.add(f.listFiles()[i].getAbsolutePath() + "/docindex.xml");
						isFmsDocFld = true;
					}else if(f.listFiles()[i].getName().startsWith("DWGCD")) {
						fDoc.masterXmlPath = f.listFiles()[i].getAbsolutePath() + "/master.xml";
						fDoc.alDwgList.add(f.listFiles()[i].getAbsolutePath() + "/dwgindex.xml");
						isFmsDocFld = true;
					}
				}

				if(isFmsDocFld) {
					fDoc.rcvNo = f.getName();
					fDoc.rootDirPath = f.getAbsolutePath();
				}
			}
		}
		fDoc.isFmsDocFld = isFmsDocFld;
		return fDoc;
	}

	public static void sendResultToUser(HttpServletResponse response, String result) {
		try {
			response.setCharacterEncoding("EUC-KR");
			response.setContentType("text/html; charset=EUC-KR");
			response.getWriter().write(result);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void writeEdocXml(String fileName, String content, boolean isAppend) {
		OutputStreamWriter writer = null;
		FileOutputStream outFile = null;
		try {
			content = content.replaceAll("<\\?xml version=\"1.0\" encoding=\"UTF-8\"\\?>", "<?xml version=\"1.0\" encoding=\"ks_c_5601\" ?>");
			outFile = new FileOutputStream(fileName, isAppend);
			writer = new OutputStreamWriter(new FileOutputStream(fileName, isAppend), "euc-kr");
			writer.append(content);

			if(outFile != null) { outFile.close(); }
			if(writer != null) { writer.close(); }
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(outFile != null) {
				try {
					outFile.close();
				} catch (Exception ex2) {
				}
			}
			if(writer != null) {
				try {
					writer.close();
				} catch (Exception ex2) {
				}
			}
		}
	}

	public static int getFilesCount(File file) {
		File[] files = file.listFiles();
		int count = 0;
		for(File f : files) {
			if(f.isDirectory()) {
				count += getFilesCount(f);
			}else {
				count++;
			}	
		}		
		return count;
	}

	public static long getFilesSize(File file) {
		File[] files = file.listFiles();
		long size = 0;
		for(File f : files) {
			if(f.isDirectory()) {
				size += getFilesSize(f);
			}else {
				size += f.length();
			}
		}
		return size;
	}

	public static void listf(String directoryName, ArrayList<File> files) {
		File directory = new File(directoryName);
		File[] fList = directory.listFiles();
		Arrays.sort(fList);
		for(File file : fList) {
			if(file.isFile()) {
				files.add(file);
			}else if(file.isDirectory()) {
				listf(file.getAbsolutePath(), files);
			}
		}
	}

	public static String getMasterXml(String typeNm, String constNm, String reqNm, String constYmdFrom, String constYmdTo, String cplYmd, RsWrapper facilWp, RsWrapper docWp, RsWrapper dwgWp) throws Exception {
		Document xdoc = new Document();
		Element mElm = new Element("master");
		Element typeElm = new Element("type").setText(typeNm);
		Element virElm = new Element("version").setText("1.0");
		xdoc.setRootElement(mElm);

		Element constElm = new Element("const_info");
		constElm.addContent(new Element("const_nm").setText(constNm));
		constElm.addContent(new Element("req_nm").setText(reqNm));
		constElm.addContent(new Element("const_ymd_from").setText(constYmdFrom));
		constElm.addContent(new Element("const_ymd_to").setText(constYmdTo));
		constElm.addContent(new Element("cpl_ymd").setText(cplYmd));

		mElm.addContent(typeElm);
		mElm.addContent(virElm);
		mElm.addContent(constElm);

		// 시설물
		for(int i=0; i < facilWp.getLength(); i++) {
			Element facilElm = new Element("facil_info");
			facilElm.addContent(new Element("facil_no").setText(facilWp.get("facil_no", i)));
			facilElm.addContent(new Element("facil_nm").setText(facilWp.get("facil_nm", i)));
			mElm.addContent(facilElm);
		}

		// 보고서
		Element cdElm = new Element("cd_info");
		Element dwgCdElm = new Element("dwg_cd_info");
		Element docCdElm = new Element("doc_cd_info");

		if(docWp.getLength() > 0) {
			int totFileCnt = 0;
			for(int i=0; i < docWp.getLength(); i++) {
				totFileCnt += docWp.getInt("kind_cnt", i);
			}
			cdElm.addContent(new Element("doc_cd_cnt").setText("1"));
			docCdElm.addContent(new Element("doc_cd_no").setText("01"));
			docCdElm.addContent(new Element("doc_cd_file_cnt").setText(totFileCnt + ""));

			for(int i=0; i < docWp.getLength(); i++) {
				Element kindElm = new Element("doc_kind_info");
				kindElm.addContent(new Element("doc_kind_nm").setText(docWp.get("kind_nm", i)));
				kindElm.addContent(new Element("doc_kind_cnt").setText(docWp.get("kind_cnt", i).isEmpty() ? "0" : docWp.get("kind_cnt", i).replaceAll(",", "")));
				docCdElm.addContent(kindElm);
			}
		}else {
			cdElm.addContent(new Element("doc_cd_cnt").setText("0"));
			docCdElm.addContent(new Element("doc_cd_no").setText("01"));
			docCdElm.addContent(new Element("doc_cd_file_cnt").setText("0"));
		}
		if(dwgWp.getLength() > 0) {
			int totFileCnt = 0;
			for(int i=0; i < dwgWp.getLength(); i++) {
				totFileCnt += dwgWp.getInt("kind_cnt", i);
			}

			cdElm.addContent(new Element("dwg_cd_cnt").setText("1"));
			dwgCdElm.addContent(new Element("dwg_cd_no").setText("01"));
			dwgCdElm.addContent(new Element("dwg_cd_file_cnt").setText(totFileCnt + ""));

			for(int i=0; i < dwgWp.getLength(); i++) {
				Element kindElm = new Element("dwg_kind_info");
				kindElm.addContent(new Element("dwg_kind_nm").setText(dwgWp.get("kind_nm", i)));
				kindElm.addContent(new Element("dwg_kind_cnt").setText(dwgWp.get("kind_cnt", i).isEmpty() ? "0" : dwgWp.get("kind_cnt", i).replaceAll(",", "")));
				dwgCdElm.addContent(kindElm);
			}
		}

		mElm.addContent(cdElm);
		mElm.addContent(dwgCdElm);
		mElm.addContent(docCdElm);

		String masterXml = XMLUtil.getXmlString(xdoc);
		masterXml = masterXml.replaceAll("UTF-8", "ks_c_5601");
		return masterXml;
	}

	public static String getIndexXml(String type, RsWrapper rsWp) throws Exception {
		Document xdoc = new Document();
		Element mElm = new Element("index");
		Element typeElm = new Element("type").setText(type);
		Element virElm = new Element("version").setText("1.0");
		xdoc.setRootElement(mElm);

		mElm.addContent(typeElm);
		mElm.addContent(virElm);

		for(int i=0; i < rsWp.getLength(); i++) {
			Element kindElm = new Element("kind_info");
			String kindNm = rsWp.get("kind_nm", i);
			kindElm.addContent(new Element("kind_nm").setText(kindNm));
			for(int j=i; j < rsWp.getLength(); j++) {
				String kindNm2 = rsWp.get("kind_nm", j);
				if(kindNm.equals(kindNm2)) {
					Element titleElm = new Element("title_info");
					titleElm.addContent(new Element("level").setText(rsWp.get("level", j)));
					titleElm.addContent(new Element("title").setText(rsWp.get("title", j)));
					titleElm.addContent(new Element("file_from").setText(StringUtil.lpad(rsWp.get("file_from", j), "0", 4)));
					kindElm.addContent(titleElm);
					i = j;
				}
			}
			mElm.addContent(kindElm);
		}
		String indexXml = XMLUtil.getXmlString(xdoc);
		indexXml = indexXml.replaceAll("UTF-8", "ks_c_5601");
		return indexXml;
	}
}