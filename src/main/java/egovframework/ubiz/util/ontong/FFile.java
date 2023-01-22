package egovframework.ubiz.util.ontong;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import egovframework.cbiz.util.FileUtil;

public class FFile   {
	HashMap<String, ArrayList> hFile = new HashMap<String, ArrayList>();
	HashMap<String, String> hFileDir = new HashMap<String, String>();
	public int fileCnt = 0;
	
	public FFile(String fileInfo) {
		initFile(fileInfo);
	}
	
	private void initFile(String fileInfo) {
		hFile.clear();
		hFileDir.clear();
		String[] fileList = fileInfo.split("\n");
		
		for(int i=0; i < fileList.length; i++) {
			if (!fileList[i].trim().equals("")) {
				String[] fInfo = fileList[i].split("@");
				if (fInfo.length == 4) { 
					String dirId = fInfo[0];
					String dirPath = fInfo[1];
					String fileNm = fInfo[2];
					String sysNm = fInfo[3];
					
					ArrayList alFile = hFile.get(dirId);
					if (alFile == null) {
						alFile = new ArrayList<String>();
						hFile.put(dirId, alFile);
					}
					alFile.add(fileList[i]);
					hFileDir.put(dirPath + "/" + sysNm , dirId);
					fileCnt++;
				}
			}
		}
	}
	
	public ArrayList<String> getFileList(String dirId) {
		ArrayList alFile = hFile.get(dirId);
		if (alFile == null) {
			alFile = new ArrayList<String>();
			hFile.put(dirId, alFile);
		}
		return alFile;
	}
	
	public void deleteFileInDir(String dirId) {
		if (hFile.get(dirId) != null) {
			hFile.remove(dirId);
		}
	}
	
	public void deleteFile(String filePath) {
		String dirId = hFileDir.get(filePath);
		if (dirId != null && hFile.get(dirId) != null) {
			ArrayList alFile = hFile.get(dirId);
			for(int i=0; alFile != null && i < alFile.size(); i++) {
				String[] fInfo = ((String)alFile.get(i)).split("@");
				if ((fInfo[1] + "/" + fInfo[3]).equals(filePath)) {
					alFile.remove(i);
				}
			}
		}
	}
	
	public void saveFile(String filePath) throws Exception {
		StringBuffer sb = new StringBuffer();
		Iterator it = hFile.keySet().iterator();
		while (it.hasNext()) {
			String dirId = (String)it.next();
			System.out.println(dirId);
			//String dirId = (String)pair.getKey();
			ArrayList fList = hFile.get(dirId);
			System.out.println("len:" + fList.size());
			for(int i=0; fList != null && i < fList.size(); i++) {
				sb.append((String)fList.get(i)+"\n");
			}
		}
		FileUtil.writeToTextFile(filePath, sb.toString(), false);
	}
	
 }