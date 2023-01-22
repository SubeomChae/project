/*********************************************************************************
* 파  일  명   : XMLUtil.java
* 작  성  일   : 2005.02.16
* 작  성  자   :
*---------------------------------------------------------------------------------
* 프로그램명   : XMLUtil
* 기능 및 설명 : XML유틸
*---------------------------------------------------------------------------------
* 사용 Table   :
*---------------------------------------------------------------------------------
* 기	 타  :
*********************************************************************************/
package egovframework.cbiz.util;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.nio.CharBuffer;
import java.util.List;

import org.apache.log4j.Logger;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.JDOMParseException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import org.jdom2.xpath.XPath;
import org.xml.sax.InputSource;

//import com.sun.xml.internal.ws.util.xml.XmlUtil;

/**
 * <pre>
 * XML공통 사용 추상화 클래스
 * </pre>
 *
 * @author 최군길
 */
public class XMLUtil {

	public static Document loadXmlDocument(String xmlPath) throws Exception {
		Document doc = null;
		SAXBuilder builder = new SAXBuilder();
		return builder.build(xmlPath);
	}

	public static Document loadXmlDocumentUTF8(String xmlPath) throws Exception {
		Document doc = null;
		SAXBuilder builder = new SAXBuilder();
		return getXmlDocEUC_UTF8(xmlPath);
	}

	public static Document loadXmlDocumentFromString(String xml) throws Exception {
		Document doc = null;
		SAXBuilder builder = new SAXBuilder();
		return doc = builder.build(new StringReader(xml));
	}

	/**
	 * 현재의 XML상태를 파일에 저장한다.
	 * @return
	 * @throws Exception
	 */
	public static boolean writeXml(String xml_file_path, Document doc) throws Exception {
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;
		try {
			fos = new FileOutputStream(xml_file_path,false);
			osw = new OutputStreamWriter(fos, "utf-8");
			XMLOutputter xmlout = new XMLOutputter(Format.getPrettyFormat());
			xmlout.output(doc,osw);
			return true;
		} catch(Exception e) {
			throw e;
		} finally {
			if (osw != null) try {osw.close(); } catch (Exception e) {};
			if (fos != null) try {fos.close(); } catch (Exception e) {};
		}
	}

	public static String getXmlString(Document doc) throws Exception {
		XMLOutputter xmlout = new XMLOutputter(Format.getPrettyFormat());
		return xmlout.outputString(doc);
	}

	/**
	 * xpath에 해당하는 하나의 노드를 검색하여 Object로 리턴한다.
	 * @param xpath 검색 xpath
	 * @return 하나의 검색 결과 노드
	 * @throws Exception
	 */
	public static Object getSelectSingleNode(String xpath, Document doc) throws Exception {
		//CD.liblogger.debug(xpath);
		XPath x = XPath.newInstance(xpath);
		return (Object)x.selectSingleNode(doc);
	}

	/**
	 * xpath에 해당하는 하나의 Element를 찾아 리턴한다.
	 * @param xpath 검색 xpath
	 * @return 하나의 검색 결과 Element
	 * @throws Exception
	 */
	public static Element getSingleElement(String xpath, Document doc) throws Exception {
		//CD.liblogger.debug(xpath);
		XPath x = XPath.newInstance(xpath);
		return (Element)x.selectSingleNode(doc);
	}

	/**
	 * <pre>
	 * xpath에 해당하는 결과를 String으로 리턴한다.
	 * count 함수에 의한 결과같은 것을 찾을때 사용
	 * </pre>
	 * @param xpath 검색 xpath
	 * @return 결과 문자열
	 * @throws Exception
	 */
	public static String getResultString(String xpath, Document doc) throws Exception {
		//CD.liblogger.debug(xpath);
		XPath x = XPath.newInstance(xpath);
		return x.selectSingleNode(doc).toString();
	}

	/**
	 * xpath에 해당하는 Element의 목록을 List로 리턴한다.
	 * @param xpath 검색 xpath
	 * @return 검색 결과 Eliment List
	 * @throws Exception
	 */
	public static List getMultiElements(String xpath, Document doc) throws Exception {
		//CD.liblogger.debug(xpath);
		XPath x = XPath.newInstance(xpath);
		return x.selectNodes(doc);
	}

	/**
	 * <pre>
	 * entity object와 Element 데이터 매핑
	 * entity에 있는 필드의 데이터를 같은 childText의 이름으로 되어 있는
	 * Element의 값으로 넣는다.
	 * </pre>
	 * @param el  데이터를 빼낼 xml Element
	 * @param entity 데이터를 셋팅하여 리턴할 entity
	 * @return
	 */
	public static Object getMapObjElement(Element el, Object entity) {
		Class c = entity.getClass();
		java.lang.reflect.Field[] field = c.getFields();
		try {
			for (int i = 0; i < field.length; i++) {
				Class fc = field[i].getType();
				if (el.getChild(field[i].getName()) != null)
					field[i].set(entity, el.getChildText(field[i].getName()));
			}
		} catch (Exception e) {
		}
		return entity;
	}

	/**
	 * 입력문자열중 xml 특수문자에 해당되는것을 변환하여 반환
	 * @param val
	 */
	public static String getXmlTagString(String val) {
		if (val == null || val.equals("")) { return ""; }
		CharBuffer cb = CharBuffer.wrap(val);
		String xmlString = "";
		while ( cb.hasRemaining() ) {
			char tempChar = cb.get();

			if ( tempChar == '"' ) {
				xmlString += "&quot;";
			} else if ( tempChar == '&' ) {
				xmlString += "&amp;";
			} else if ( tempChar == '\'' ) {
				xmlString += "&apos;";
			} else if ( tempChar == '<' ) {
				xmlString += "&lt;";
			} else if ( tempChar == '>' ) {
				xmlString += "&gt;";
			} else {
				xmlString += tempChar;
			}
		}
		return xmlString;
	}

  	public static Document getXmlDocEUC_UTF8(String xmlPath) throws Exception {
		Document doc = null;
		SAXBuilder builder = new SAXBuilder();
		
		try {
			doc = builder.build(new InputSource(new InputStreamReader(new FileInputStream(xmlPath),"euc-kr")));
			//System.out.println(XMLUtil.getXmlString(doc));
		} catch (JDOMParseException ex) {
			//ex.printStackTrace();
			String xml = FileUtil.readFromTextFileUtf8(xmlPath);
			xml = xml.trim().replaceFirst("^([\\W]+)<","<");
			doc = builder.build(new InputSource(new ByteArrayInputStream(xml.replaceAll("ks_c_5601", "utf-8").getBytes("utf-8"))));	 
			//System.out.println(XMLUtil.getXmlString(doc));
		}
		return doc;
	}
	
	public static void main(String[] args) {
		String xml = "<Items comment='root item'>"
				 + "  <item>"
				 + "     <att>att1 text</att>"
				 + "     <att>att2 text</att>"
				 + "     <att>att3 text</att>"
				 + "  </item>"
				 + "</Items>";

		try {
			Document xdoc = XMLUtil.loadXmlDocumentFromString(xml);
			List elims = XMLUtil.getMultiElements("/Items/item/att", xdoc);
			for(int i=0 ;i < elims.size(); i++) {
				Element elm = (Element) elims.get(i);
				System.out.println("elim text:" + elm.getText());
			}

			String cmt = xdoc.getRootElement().getAttribute("comment").getValue();
			System.out.println("cmt:" + cmt);

			Element elim = XMLUtil.getSingleElement("/Items/item", xdoc);
			List elims2 = elim.getChildren();
			for(int i=0 ;i < elims2.size(); i++) {
				Element elm = (Element) elims2.get(i);
				System.out.println("elim text:" + elm.getText());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}