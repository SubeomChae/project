package egovframework.ubiz.util.ontong;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.io.FileUtils;
import org.jdom2.Document; 
import org.jdom2.Element;

import com.google.gson.JsonArray;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import egovframework.ubiz.util.ontong.batch.DoctbIndxEnt;
import egovframework.ubiz.util.ontong.batch.DoctbReptEnt;
import egovframework.ubiz.util.ontong.fdoc.CdInfo;
import egovframework.ubiz.util.ontong.fdoc.FmsDoc;
import egovframework.ubiz.util.ontong.fdoc.KindInfo;
import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.FileUtil;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.XMLUtil;

public class FDir  {
	String dirInfo = "";
	FFile fFile = null;

	JsonArray jArr = null;
	HashMap<String, ArrayList<JsonObject>> pDir = new HashMap<String, ArrayList<JsonObject>>();
	HashMap<String, JsonObject> hDir = new HashMap<String, JsonObject>();
	HashMap<String, String> pLevel = new HashMap<String, String>();
	ArrayList<JsonObject> allJson = new ArrayList<JsonObject>();
	ArrayList<JsonObject> alDocCd = new ArrayList<JsonObject>();
	ArrayList<JsonObject> alDwgCd = new ArrayList<JsonObject>();

	
	public FDir(String dirInfo, FFile fFile) {
		dirInfo = dirInfo.trim() + "@@@@@@";
		dirInfo = dirInfo.replaceAll(",@@@@@@", "").replaceAll("@@@@@@", "");
		this.dirInfo = "{list:[" + dirInfo + "]}";
		
		System.out.println("dirInfo:" + this.dirInfo);
		JsonObject jsonObj = new JsonParser().parse( this.dirInfo ).getAsJsonObject(); 
		jArr = (JsonArray)jsonObj.get("list");
		for(int i=0 ; i < jArr.size(); i++) {
			if (!jArr.get(i).equals(JsonNull.INSTANCE)) {
				JsonObject jobj = (JsonObject)jArr.get(i);
				String id = (String)(jobj.get("id")).getAsString();
				String name = (String)(jobj.get("name")).getAsString();
				System.out.println("id:" + id);
				
				if(name.startsWith("DOCCD")) {
					alDocCd.add(jobj);
				}else if(name.startsWith("DWGCD")) {
					alDwgCd.add(jobj);
				}
				hDir.put(id, jobj);
			}
		}
		
		// doc 보고서 목록 저장
		for(int i=0; i < alDocCd.size(); i++) {
			JsonObject jobj = (JsonObject)alDocCd.get(i);
			String id = (String)(jobj.get("id")).getAsString();
			ArrayList<JsonObject> arr = new ArrayList<JsonObject>();
			for(int j=0; j < jArr.size(); j++) {
				JsonObject jobj2 = (JsonObject)jArr.get(j);
				if(jobj2.get("pId") != null) {
					String pId = (String)(jobj2.get("pId")).getAsString();
					if(id.equals(pId)) { arr.add(jobj2); }
				}
			}
			// 보고서
			pDir.put(id + "RPT", arr);
			ArrayList<JsonObject> subArr = new ArrayList<JsonObject>();
			pDir.put(id + "SUB", getSubAll(id, subArr));
			for(int j=0; j < arr.size(); j++) {
				subArr = new ArrayList<JsonObject>();
				JsonObject jobj2 = (JsonObject)arr.get(j);
				String id2 = (String)(jobj2.get("id")).getAsString();
				pDir.put(id2 + "SUB", getSubAll(id2, subArr, 1));
			}
		}
		
		// dwg 보고서 목록 저장
		for(int i=0; i < alDwgCd.size(); i++) {
			JsonObject jobj = (JsonObject)alDwgCd.get(i);
			String id = (String)(jobj.get("id")).getAsString();
			ArrayList<JsonObject> arr = new ArrayList<JsonObject>();
			for(int j=0; j < jArr.size(); j++) {
				JsonObject jobj2 = (JsonObject)jArr.get(j);
				if(jobj2.get("pId") != null) {
					String pId = (String)(jobj2.get("pId")).getAsString();
					if(id.equals(pId)) { arr.add(jobj2); }
				}
			}
			pDir.put(id + "RPT", arr);
			ArrayList<JsonObject> subArr = new ArrayList<JsonObject>();
			pDir.put(id + "SUB", getSubAll(id, subArr));
			for(int j=0; j < arr.size(); j++) {
				subArr = new ArrayList<JsonObject>();
				JsonObject jobj2 = (JsonObject)arr.get(j);
				String id2 = (String)(jobj2.get("id")).getAsString();
				pDir.put(id2 + "SUB", getSubAll(id2, subArr, 1));
			}
		}
		this.fFile = fFile;
	}
	
	// 특정 폴더의 하위 폴더 목록 조회
	public ArrayList<JsonObject> getSubAll(String id, ArrayList<JsonObject> subArr) {
		for(int j=0; j < jArr.size(); j++) {
			JsonObject jobj2 = (JsonObject)jArr.get(j);
			if(jobj2.get("pId") != null) {
				String pId = (String)(jobj2.get("pId")).getAsString();
				if(id.equals(pId)) {
					subArr.add(jobj2);
					getSubAll((String)(jobj2.get("id")).getAsString(), subArr);
				}
			}
		}
		return subArr;
	}
	
	// 특정 폴더의 하위 폴더 목록 조회 레벨도 조회
	public ArrayList<JsonObject> getSubAll(String id, ArrayList<JsonObject> subArr, int lvl) {
		for(int j=0; j < jArr.size(); j++) {
			JsonObject jobj2 = (JsonObject)jArr.get(j);
			if(jobj2.get("pId") != null) {
				String pId = (String)(jobj2.get("pId")).getAsString();
				if(id.equals(pId)) {
					subArr.add(jobj2);
					pLevel.put((String)(jobj2.get("id")).getAsString(), lvl+"");
					getSubAll((String)(jobj2.get("id")).getAsString(), subArr, lvl+1);
				}
			}
		}
		return subArr;
	}
	
	public int getFileCnt(String dirId) {
		ArrayList<JsonObject> subArr = pDir.get(dirId+"SUB");
		int fCnt = 0;
		for(int i=0; subArr != null && i < subArr.size(); i++) {
			ArrayList fArr = fFile.getFileList((String)(subArr.get(i).get("id")).getAsString());
			if(fArr != null) { fCnt += fArr.size(); }
		}
		return fCnt;
	}
	
	public void dgInsRpt(CommDBService commDBService, String rcvNo, String sysRegId) throws Exception {
		Box ibox = new Box("");
		ibox.put("rcv_no", rcvNo);
		commDBService.exec("PR_DOCTB_REPT01", "DELETEALL", ibox);
		int no = 1;
		ArrayList<DoctbReptEnt> reptEntLst = new ArrayList<DoctbReptEnt>();
		ArrayList<DoctbIndxEnt> indxEntLst = new ArrayList<DoctbIndxEnt>();
		for(int i=0; i < alDwgCd.size(); i++) {
			JsonObject jobj = (JsonObject)alDwgCd.get(i);
			String id = (String)(jobj.get("id")).getAsString();
			ArrayList<JsonObject> kindArr = pDir.get(id+"RPT");
			for(int j=0; kindArr != null && j < kindArr.size(); j++) {
				DoctbReptEnt ent = new DoctbReptEnt();
				ent.rcvNo = rcvNo;
				ent.reportId = "DWG" + StringUtil.lpad(no+"", "0", 4);
				ent.reportNm = (String)(kindArr.get(j).get("name")).getAsString();
				ent.pageCnt = getFileCnt((String)(kindArr.get(j).get("id")).getAsString()) + "";
				ent.cdNo = StringUtil.lpad((i+1)+"", "0", 2);
				ent.sysRegId = sysRegId;
				reptEntLst.add(ent);
				
				ArrayList<JsonObject> subArr = pDir.get((String)(kindArr.get(j).get("id")).getAsString()+"SUB");

				int fileFrom = 1;
				int indexSeq = 1;
				for(int k=0; subArr != null && k < subArr.size(); k++) {
					String subId = (String)(subArr.get(k).get("id")).getAsString();
					String subNm = (String)(subArr.get(k).get("name")).getAsString();
					ArrayList fArr = fFile.getFileList(subId);
					
					DoctbIndxEnt ient = new DoctbIndxEnt();
					ient.rcvNo = rcvNo;
					ient.reportId = ent.reportId;
					ient.indexSeq = indexSeq + "";
					ient.fileFrom = StringUtil.lpad(fileFrom +"", "0", 4);
					ient.fileType = "tif";
					ient.contentLvl =  pLevel.get(subId);
					ient.contentDesc = subNm;
					ient.sysRegId = sysRegId;
					
					if(fArr != null) { fileFrom += fArr.size(); }
					indxEntLst.add(ient);
					indexSeq++;
				}
				no++;
			}
		}
		
		no = 1;
		for(int i=0; i < alDocCd.size(); i++) {
			JsonObject jobj = (JsonObject)alDocCd.get(i);
			String id = (String)(jobj.get("id")).getAsString();
			ArrayList<JsonObject> kindArr = pDir.get(id+"RPT");
			for(int j=0; kindArr != null && j < kindArr.size(); j++) {
				DoctbReptEnt ent = new DoctbReptEnt();
				ent.rcvNo = rcvNo;
				ent.reportId = "DOC" + StringUtil.lpad(no+"", "0", 4);
				ent.reportNm = (String)(kindArr.get(j).get("name")).getAsString();
				ent.pageCnt = getFileCnt((String)(kindArr.get(j).get("id")).getAsString()) + "";
				ent.cdNo = StringUtil.lpad((i+1)+"", "0", 2);
				ent.sysRegId = sysRegId;
				reptEntLst.add(ent);
				
				ArrayList<JsonObject> subArr = pDir.get((String)(kindArr.get(j).get("id")).getAsString()+"SUB");

				int fileFrom = 1;
				int indexSeq = 1;
				for(int k=0; subArr != null && k < subArr.size(); k++) {
					String subId = (String)(subArr.get(k).get("id")).getAsString();
					String subNm = (String)(subArr.get(k).get("name")).getAsString();
					ArrayList fArr = fFile.getFileList(subId);
					
					DoctbIndxEnt ient = new DoctbIndxEnt();
					ient.rcvNo = rcvNo;
					ient.reportId = ent.reportId;
					ient.indexSeq = indexSeq + "";
					ient.fileFrom = StringUtil.lpad(fileFrom +"", "0", 4);
					ient.fileType = "tif";
					ient.contentLvl =  pLevel.get(subId);
					ient.contentDesc = subNm;
					ient.sysRegId = sysRegId;
					
					if(fArr != null) { fileFrom += fArr.size(); }
					indxEntLst.add(ient);
					indexSeq++;
				}
				no++;
			}
		}
		EDocUtil.getEdocSql().batchDoctbRept(reptEntLst);
		EDocUtil.getEdocSql().batchDoctbIndx(indxEntLst);
	}
	
	// 등록된 폴더/ 파일을 기준으로 master.xml index.xml을 생성한다.
	public void makeXml(String rcvPath, String typeNm
			, String constNm
			, String reqNm
			, String constYmdFrom
			, String constYmdTo
			, String cplYmd
			, RsWrapper facilWp) throws Exception {

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
		
		for(int i=0; i < facilWp.getLength(); i++) {
			Element facilElm = new Element("facil_info");
			facilElm.addContent(new Element("facil_no").setText(facilWp.get("facil_no", i)));
			facilElm.addContent(new Element("facil_nm").setText(facilWp.get("facil_nm", i)));
			mElm.addContent(facilElm);
		}
		
		Element dwgCdElm = new Element("dwg_cd_info");
		for(int i=0; i < alDwgCd.size(); i++) {
			JsonObject jobj = (JsonObject)alDwgCd.get(i);
			String id = (String)(jobj.get("id")).getAsString();
			dwgCdElm.addContent(new Element("dwg_cd_no").setText(StringUtil.lpad((i+1)+"", "0", 2)));
			dwgCdElm.addContent(new Element("dwg_cd_file_cnt").setText(getFileCnt(id) + ""));
			ArrayList<JsonObject> subArr = pDir.get(id+"RPT");
			for(int j=0; subArr != null && j < subArr.size(); j++) {
				Element kindElm = new Element("dwg_kind_info");
				kindElm.addContent(new Element("dwg_kind_nm").setText((String)(subArr.get(j).get("name")).getAsString()));
				kindElm.addContent(new Element("dwg_kind_cnt").setText(getFileCnt((String)(subArr.get(j).get("id")).getAsString()) + ""));
				dwgCdElm.addContent(kindElm);
			}
			
			String cdIndexXml = makeIndexXml(jobj, "dwg");
			System.out.println(cdIndexXml);
			String cdPath = rcvPath + "/DWGCD" + StringUtil.lpad((i+1) +"", "0", 2);
			File cdFile = new File(cdPath);
			if(!cdFile.exists()) { cdFile.mkdirs(); }
			// rcvPath에 xml이 생성되도록 변경
			EDocUtil.writeEdocXml(rcvPath + "/dwgindex.xml" , cdIndexXml, false);
		}
		
		Element docCdElm = new Element("doc_cd_info");
		for(int i=0; i < alDocCd.size(); i++) {
			JsonObject jobj = (JsonObject)alDocCd.get(i);
			String id = (String)(jobj.get("id")).getAsString();
			docCdElm.addContent(new Element("doc_cd_no").setText(StringUtil.lpad((i+1)+"", "0", 2)));
			docCdElm.addContent(new Element("doc_cd_file_cnt").setText(getFileCnt(id) + ""));
			ArrayList<JsonObject> subArr = pDir.get(id+"RPT");
			for(int j=0; subArr != null && j < subArr.size(); j++) {
				Element kindElm = new Element("doc_kind_info");
				kindElm.addContent(new Element("doc_kind_nm").setText((String)(subArr.get(j).get("name")).getAsString()));
				kindElm.addContent(new Element("doc_kind_cnt").setText(getFileCnt((String)(subArr.get(j).get("id")).getAsString()) + ""));
				docCdElm.addContent(kindElm);
			}
			String cdIndexXml = makeIndexXml(jobj, "doc");
			System.out.println(cdIndexXml);
			String cdPath = rcvPath + "/DOCCD" + StringUtil.lpad((i+1) +"", "0", 2);
			File cdFile = new File(cdPath);
			if(!cdFile.exists()) { cdFile.mkdirs(); }
			// rcvPath에 xml이 생성되도록 변경
			EDocUtil.writeEdocXml(rcvPath + "/docindex.xml" , cdIndexXml, false);
		}

		Element cdElm = new Element("cd_info");
		cdElm.addContent(new Element("dwg_cd_cnt").setText(alDwgCd.size()+""));
		cdElm.addContent(new Element("doc_cd_cnt").setText(alDocCd.size()+""));
		
		mElm.addContent(cdElm);
		mElm.addContent(dwgCdElm);
		mElm.addContent(docCdElm);
		
		String masterXml = XMLUtil.getXmlString(xdoc);
		EDocUtil.writeEdocXml(rcvPath + "/master.xml" , masterXml, false);
		System.out.println(masterXml);
	}
	
	// 인덱스 xml 생성
	public String makeIndexXml(JsonObject jobj, String type) throws Exception {
		Document xdoc = new Document();
		Element mElm = new Element("index");
		xdoc.setRootElement(mElm);
		mElm.addContent(new Element("type").setText(type));
		mElm.addContent(new Element("version").setText("1.0"));
		
		String id = (String)(jobj.get("id")).getAsString();
		ArrayList<JsonObject> kindArr = pDir.get(id+"RPT");
		for(int i=0; kindArr != null && i < kindArr.size(); i++) {
			Element kindElm = new Element("kind_info");
			kindElm.addContent(new Element("kind_nm").setText((String)(kindArr.get(i).get("name")).getAsString()));
			
			ArrayList<JsonObject> subArr = pDir.get((String)(kindArr.get(i).get("id")).getAsString()+"SUB");

			int fileFrom = 1;
			for(int j=0; subArr != null && j < subArr.size(); j++) {
				String subId = (String)(subArr.get(j).get("id")).getAsString();
				String subNm = (String)(subArr.get(j).get("name")).getAsString();
				ArrayList fArr = fFile.getFileList(subId);
				
				Element titleElm = new Element("title_info");
				titleElm.addContent(new Element("level").setText(pLevel.get(subId)));
				titleElm.addContent(new Element("title").setText(subNm));
				titleElm.addContent(new Element("file_from").setText(StringUtil.lpad(fileFrom +"", "0", 4)));
				kindElm.addContent(titleElm);
				if(fArr != null) { fileFrom += fArr.size(); }
			}
			mElm.addContent(kindElm);
		}
		return XMLUtil.getXmlString(xdoc);
	}
	
	// cd결과물 생성
	public void makeCD(String rcvNo, String rcvPath, String rcvPathReq) throws Exception {
		File tmpRcv = new File(rcvPath);
		File rcvReq = new File(rcvPathReq);
		if(!rcvReq.exists()) { rcvReq.mkdirs(); }
		FmsDoc fmsDoc = EDocUtil.getDocXml(rcvNo, rcvPath);
		fmsDoc.debugXmlPath();
		for(CdInfo cdInfo : fmsDoc.alCdDocList) {
			String cdPath = rcvPathReq + "/" + cdInfo.getPathName();
			FileUtil.mkDir(cdPath);
			for (KindInfo kindInfo : cdInfo.alKindInfo) {
				String rptPath = cdPath + "/" + kindInfo.getPathName(); 
				FileUtil.mkDir(rptPath);
			}
		}
		for(CdInfo cdInfo : fmsDoc.alCdDwgList) {
			String cdPath = rcvPathReq + "/" + cdInfo.getPathName();
			FileUtil.mkDir(cdPath);
			for(KindInfo kindInfo : cdInfo.alKindInfo) {
				String rptPath = cdPath + "/" + kindInfo.getPathName(); 
				FileUtil.mkDir(rptPath);
			}
		}
		if(fmsDoc.alCdDocList.size() > 0) {
			FileUtil.copyfile(rcvPath + "/docindex.xml", rcvReq+"/docindex.xml");
		}
		if(fmsDoc.alCdDwgList.size() > 0) {
			FileUtil.copyfile(rcvPath + "/dwgindex.xml", rcvReq+"/dwgindex.xml");
		}
		FileUtil.copyfile(rcvPath + "/master.xml", rcvReq+"/master.xml");
		
		for(int i=0; i < alDocCd.size(); i++) {
			JsonObject jobj = (JsonObject)alDocCd.get(i);
			String id = (String)(jobj.get("id")).getAsString();
			ArrayList<JsonObject> rptArr = pDir.get(id+"RPT");
			for(int j=0; rptArr != null && j < rptArr.size(); j++) {
				String rptId = (String)(rptArr.get(j).get("id")).getAsString();
				String reportPath = rcvPathReq + "/DOCCD" + StringUtil.lpad((i+1)+"","0",2) + "/" + (String)(rptArr.get(j).get("name")).getAsString();
				ArrayList<JsonObject> subArr = pDir.get(rptId+"SUB");

				int fCnt = 1;
				for(int k=0; subArr != null && k < subArr.size(); k++) {
					ArrayList fArr = fFile.getFileList((String)(subArr.get(k).get("id")).getAsString());
					for(int f=0; fArr != null && f < fArr.size(); f++) {
						String[] fInfo = ((String)fArr.get(f)).split("@");
						String dirId = fInfo[0];
						String dirPath = fInfo[1];
						String fileNm = fInfo[2];
						String sysNm = fInfo[3];
						
						String fromFile = rcvPath + "/" + dirPath + "/" + sysNm;
						String toFile = reportPath + "/" + StringUtil.lpad(fCnt+"", "0", 4) + ".tif";
						FileUtil.fileMove(fromFile, toFile);
						fCnt++;
					}
				}
			}
		}
		
		for(int i=0; i < alDwgCd.size(); i++) {
			JsonObject jobj = (JsonObject)alDwgCd.get(i);
			String id = (String)(jobj.get("id")).getAsString();
			ArrayList<JsonObject> rptArr = pDir.get(id+"RPT");
			for(int j=0; rptArr != null && j < rptArr.size(); j++) {
				String rptId = (String)(rptArr.get(j).get("id")).getAsString();
				String reportPath = rcvPathReq + "/DWGCD" + StringUtil.lpad((i+1)+"","0",2) + "/" + (String)(rptArr.get(j).get("name")).getAsString();
				ArrayList<JsonObject> subArr = pDir.get(rptId+"SUB");

				int fCnt = 1;
				for(int k=0; subArr != null && k < subArr.size(); k++) {
					ArrayList fArr = fFile.getFileList((String)(subArr.get(k).get("id")).getAsString());
					for (int f=0; fArr != null && f < fArr.size(); f++) {
						String[] fInfo = ((String)fArr.get(f)).split("@");
						String dirId = fInfo[0];
						String dirPath = fInfo[1];
						String fileNm = fInfo[2];
						String sysNm = fInfo[3];
						
						String fromFile = rcvPath + "/" + dirPath + "/" + sysNm;
						String toFile = reportPath + "/" + StringUtil.lpad(fCnt+"", "0", 4) + ".tif";
						FileUtil.fileMove(fromFile, toFile);
						fCnt++;
					}
				}
			} 
		}
		FileUtils.deleteDirectory(tmpRcv);
		FileUtils.moveDirectory(rcvReq, tmpRcv);
	}
}