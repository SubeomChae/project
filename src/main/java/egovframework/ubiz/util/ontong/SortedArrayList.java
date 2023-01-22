package egovframework.ubiz.util.ontong;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import egovframework.ubiz.util.ontong.batch.DoctbFileEnt;
import egovframework.ubiz.util.ontong.batch.DoctbFoldEnt;
import egovframework.ubiz.util.ontong.batch.DoctbReptEnt;
import egovframework.ubiz.util.ontong.fdoc.CdInfo;
import egovframework.ubiz.util.ontong.fdoc.KindInfo;

import org.jdom2.Document;
import org.jdom2.Element;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import egovframework.cbiz.service.CommDBService;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.Box;
import egovframework.cbiz.util.StringUtil;
import egovframework.cbiz.util.XMLUtil;

public class SortedArrayList<T> extends ArrayList<T> {

	@SuppressWarnings("unchecked")
	public void insertSorted(T value) {
		add(value);
		Comparable<T> cmp = (Comparable<T>) value;
		for (int i = size()-1; i > 0 && cmp.compareTo(get(i-1)) < 0; i--)
			Collections.swap(this, i, i-1);
	}
	
	@Override
	public boolean add(T value) {
		boolean rtn = super.add(value);
		Comparable<T> cmp = (Comparable<T>) value;
		for (int i = size()-1; i > 0 && cmp.compareTo(get(i-1)) < 0; i--)
			Collections.swap(this, i, i-1);
		return rtn;
	}
}