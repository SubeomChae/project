package egovframework.cbiz;

import java.util.Set;

public class SetEnumeration implements java.util.Enumeration {
	private Object[] setArr;
	private int index;

	public SetEnumeration(Set set) {
		this.setArr = set.toArray();
		this.index = 0;
	}

	public boolean hasMoreElements() {
		if (index < setArr.length) {
			return true;
		} else {
			return false;
		}
	}

	public Object nextElement() {
		Object o = setArr[index];
		index++;
		return o;
	}

}