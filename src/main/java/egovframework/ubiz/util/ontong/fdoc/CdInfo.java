
package egovframework.ubiz.util.ontong.fdoc;

import java.util.ArrayList;
import java.util.List;

import org.jdom2.Element;

import egovframework.ubiz.util.ontong.EDocUtil;
import egovframework.cbiz.util.XMLUtil;


public class CdInfo {

	String cdGbn = "";
	org.jdom2.Document xdoc = null;
	String xmlFilePath = "";
	String cdNo = "";
	int fileCnt = 0;
	
	public ArrayList<KindInfo> alKindInfo = new ArrayList<KindInfo>();
	
	public CdInfo(String xmlPath, String cdGbn, String cdNo, String fileCnt, List<org.jdom2.Element> kindList) throws Exception {
		this.xmlFilePath = xmlPath;
		this.cdNo = cdNo;
		this.cdGbn = cdGbn;
		if(!fileCnt.equals("")) {
			this.fileCnt = Integer.parseInt(fileCnt);
		}
		for(int i=0; i < kindList.size(); i++) {
			org.jdom2.Element kelem = kindList.get(i);
			alKindInfo.add(new KindInfo(kelem.getChildText(cdGbn + "_kind_nm"), kelem.getChildText(cdGbn + "_kind_cnt")));
		}
		xdoc = XMLUtil.getXmlDocEUC_UTF8(xmlPath);
		
		List<org.jdom2.Element> idxKindList = XMLUtil.getMultiElements("/index/kind_info", xdoc);
		for(int i=0; i < idxKindList.size(); i++) {
			KindInfo kInfo = getKindInfo(idxKindList.get(i).getChildText("kind_nm"));
			if(kInfo != null) { // CD가 맞지 않을경우 null일수 있음
				List<org.jdom2.Element> titleList = idxKindList.get(i).getChildren("title_info");
				for(org.jdom2.Element elm : titleList) {
					if(kInfo.titleList.size() > 0) {
						String fFrom = elm.getChildText("file_from");
						String fTo = (Integer.parseInt(fFrom)-1) + "";
						fTo = String.format("%4s", fTo).replace(" ", "0");
						kInfo.titleList.get(kInfo.titleList.size()-1).fileTo = fTo;
					}
					
					kInfo.titleList.add(new TitleInfo(elm.getChildText("level"), 
							elm.getChildText("title"), 
							elm.getChildText("file_from")) );
				}
				kInfo.titleList.get(kInfo.titleList.size()-1).fileTo = String.format("%4s", kInfo.kindCnt+"").replace(" ", "0");
			}
		}
	}
	
	public KindInfo getKindInfo(String kindNm) {
		KindInfo kInfo = null;
		for(int i=0; i < alKindInfo.size(); i++) {
			if(alKindInfo.get(i).kindNm.equals(kindNm.trim())) {
				kInfo = alKindInfo.get(i);
			}
		}
		return kInfo;
	}
	
	public String getKindInfoDebug() {
		String rtn = "";
		for(int i=0; i < alKindInfo.size(); i++) {
			rtn += alKindInfo.get(i).kindNm + ":" + alKindInfo.get(i).kindCnt + " [ " + alKindInfo.get(i).getTitleInfoDebug() + "] , ";
		}
		return rtn;
	}
	
	public String getCdId() {
		return cdGbn.toUpperCase() + "CD" + cdNo;
	}
	
	public String getPathName() {
		return cdGbn.toUpperCase() + "CD" + cdNo;
 	}
}
