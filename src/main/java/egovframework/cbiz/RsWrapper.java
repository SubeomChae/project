package egovframework.cbiz;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import egovframework.cbiz.util.StringUtil;

public class RsWrapper implements java.io.Serializable, java.lang.Iterable<Box>, java.util.Collection<Box> {

	private List<Box> alRsBox;

	private int rowCount;

	private String pageCount = "1";
	private String unitCount = "10";

	public RsWrapper() {
		alRsBox = new ArrayList(10);
	}

	public RsWrapper(List lst) {

		if (alRsBox == null) {
			alRsBox = new ArrayList(10);
		}
		if (lst != null && lst.size() > 0) {
			for (Object map : lst) {
				alRsBox.add(Box.makeBox((Map) map));
			}
			if (getRsBoxAt(0).get("xcnt").equals("")) {
				rowCount = this.alRsBox.size();
			} else {
				rowCount = getRsBoxAt(0).getInt("xcnt");
			}
		}
	}

    public void setRowCount(int cnt) {
        this.rowCount = cnt;
    }

	public int getLength() {
		return alRsBox.size();
	}

	public Box getRsBoxAt(int idx) {
		return (Box) alRsBox.get(idx);
	}

	public int getRowCount() {
		return this.rowCount;
	}

	public String getSno(int i, int unit, HttpServletRequest request) {
		int page = Integer.parseInt(CD.rgetNvl("page_count", "1", request));

		return (getRowCount() - (((page - 1) * unit) + i)) + "";
	}

	public String get(String key, int i) {
		return getRsBoxAt(i).get(key);
	}

	public String getNvl(String key, int i, String target) {
		return getRsBoxAt(i).getNvl(key, target);
	}

	public String get(String key, int i, int fmt) {
		return getRsBoxAt(i).get(key, fmt);
	}

	public String get(String key, int i, int fmt, String target) {
		return getRsBoxAt(i).get(key, fmt, target);
	}

	public String getCutStr(String key, int i, int len) {
		return StringUtil.fixLength(getRsBoxAt(i).get(key), len);
	}

	public int getInt(String key, int i) {
		return getRsBoxAt(i).getInt(key);
	}

	public double getDouble(String key, int i) {
		return getRsBoxAt(i).getDouble(key);
	}

	// public boolean getBoolean(String key, int i) {
	// return getRsBoxAt(i).getBoolean(key);
	// }

	public float getFloat(String key, int i) {
		return getRsBoxAt(i).getFloat(key);
	}

	public long getLong(String key, int i) {
		return getRsBoxAt(i).getLong(key);
	}

	@Override
	public Iterator<egovframework.cbiz.Box> iterator() {
		Iterator<Box> iter = alRsBox.iterator();
		return alRsBox.iterator();
	}

	@Override
	public int size() {
		return alRsBox.size();
	}

	@Override
	public boolean isEmpty() {
		return alRsBox.size() == 0 ? true : false;
	}

	@Override
	public boolean contains(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object[] toArray() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T[] toArray(T[] a) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean add(Box e) {
		if (alRsBox == null) {
			alRsBox = new ArrayList(10);
		}
		alRsBox.add(e);
		return true;
	}
	
	public boolean appendRs(Box e) {
		return add(e);
	}

	public void appendRs(String jsonString, String keyString) {
		JsonElement jsonElment = new JsonParser().parse(jsonString);
		JsonArray jsonArray = jsonElment.getAsJsonArray();
		String keys[] = StringUtil.split(keyString, ",", true);
		for(int i=0; i < jsonArray.size(); i++) {
			JsonObject jsonObject = jsonArray.get(i).getAsJsonObject();
			Box ibox = new Box("");
			for(int j=0; j < keys.length; j++) {
				String key = StringUtil.replace(keys[j]," ", "");
				ibox.put(key, jsonObject.get(key).getAsString());
			}
			add(ibox);
		}
	}

	public void remove(int index) {
		alRsBox.remove(index);
	}

	@Override
	public boolean remove(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean containsAll(Collection<?> c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addAll(Collection<? extends Box> c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeAll(Collection<?> c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean retainAll(Collection<?> c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub

	}

	public void sortAsc(String sortKey) {
		Collections.sort(alRsBox, new NameAscCompare(sortKey));
	}

	public class NameAscCompare implements Comparator<Box> {

		String sortKey = "";

		public NameAscCompare(String sortKey) {
			this.sortKey = sortKey;
		}

		@Override
		public int compare(Box arg0, Box arg1) {
			return arg0.get(sortKey).compareTo(arg1.get(sortKey));
		}
	}
	
	public String toString() {
	    StringBuffer sb = new StringBuffer();
	    for(int i=0; i < getLength(); i++) {
	        Box rb = getRsBoxAt(i);
	        Enumeration keys = rb.keys();
	        while(keys.hasMoreElements()) {
	            String key = (String)keys.nextElement();
	            sb.append(key).append("=").append(rb.get(key)).append(", ");
	        }
	        sb.append("\n");
	    }
	    
	    return sb.toString();
	}

}
