package egovframework.ubiz.mapper.ent;
 
import egovframework.cbiz.util.DateUtil;

import java.io.Serializable;
 
public class SesUserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public String user_id 		= "";
	public String pswd 			= "";
	public String user_nm 		= "";
	public String login_dt 		= "";
	public String login_ymd 	= "";
	public String session_id	= "";
	public String login_ip 		= "";
	public String is_login 		= "N";
	public String is_admin 		= "N";
    
//	public String group_type	= "@";
//	public String group_type_nm	= "일반사용자";
//	public String group_cd		= "";
//	public String group_nm		= "";
//	public String mng_main_cd	= "";
//	public String mng_main_nm	= "";
//	public String gather_org_cd	= "";
//	public String gather_org_nm	= "";
//	public String prst_org_cd	= "";
//	public String prst_org_nm	= "";
//	public String upper_cd		= "";
//	public String upper_nm		= "";
//	public String charge_person	= "";
//	public String rep_user_yn	= "";
//	public String ref_key		= "";
	
	public String dbo  		= "";
	public String corp_cd  		= "";
	public String corp_nm  		= "";
	public String empl_no  		= "";
	public String empl_nm  		= "";
	public String dept_cd  		= "";
	public String dept_nm  		= "";
	public String position_cd  	= "";
	public String position_nm  	= "";
	public String user_lvl  	= "";
	public String use_auth  	= "";
	public String closing_mm  	= "";

    public SesUserEntity() {
        this.login_dt   = DateUtil.toString("yyyy-MM-dd HH:mm:ss");
        this.login_ymd  = DateUtil.toString("yyyyMMdd"); 
    }

    public boolean isLogin() { return is_login.equals("Y") ? true : false; } 
    public boolean isAdmin() { return is_admin.equals("Y") ? true : false; }
//	public int nCol() {
//		return group_type.compareTo("C") > 0 ? 0 : (68-(char)group_type.charAt(0));
//	}
 
}
