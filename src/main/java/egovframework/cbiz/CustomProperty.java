package egovframework.cbiz;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
 
@Component
public class CustomProperty  {

	public static String ssl_domain;
	public static String upload_dir;
	public static String storage_home;
	public static String owner_nm;
	public static String owner_information;
	public static String admin_pswd;
	public static String admin_desk;
	public static String local_addr;

	public String getSsl_domain() {
		return ssl_domain;
	}

	@Value("${ssl_domain}")
	public void setSsl_domain(String ssl_domain) {
		CustomProperty.ssl_domain = ssl_domain;
	}

	public String getUpload_dir() {
		return upload_dir;
	}

	@Value("${upload_dir}")
	public void setUpload_dir(String upload_dir) {
		CustomProperty.upload_dir = upload_dir;
	}

	public String getStorage_home() {
		return storage_home;
	}

	@Value("${storage_home}")
	public void setStorage_home(String storage_home) {
		CustomProperty.storage_home = storage_home;
	}

	public String getOwner_nm() {
		return owner_nm;
	}

	@Value("${owner_nm}")
	public void setOwner_nm(String owner_nm) {
		CustomProperty.owner_nm = owner_nm;
	}

	public String getOwner_information() {
		return owner_information;
	}

	@Value("${owner_information}")
	public void setOwner_information(String owner_information) {
		CustomProperty.owner_information = owner_information;
	}

	public String getLocal_addr() {
		return local_addr;
	}

	@Value("${local_addr}")
	public void setLocal_addr(String local_addr) {
		CustomProperty.local_addr = local_addr;
	}

	public String getAdmin_desk() {
		return admin_desk;
	}

	@Value("${admin_desk}")
	public void setAdmin_desk(String admin_desk) {
		CustomProperty.admin_desk = admin_desk;
	}

	public String getAdmin_pswd() {
		return admin_pswd;
	}

	@Value("${admin_pswd}")
	public void setAdmin_pswd(String admin_pswd) {
		CustomProperty.admin_pswd = admin_pswd;
	}

}