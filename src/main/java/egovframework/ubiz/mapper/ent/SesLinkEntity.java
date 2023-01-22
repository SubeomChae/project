/*********************************************************************************
* 파  일  명   : SesLinkEntity.java
* 작  성  일   : 2013.10.02
* 작  성  자   : 정진수
*---------------------------------------------------------------------------------
* 프로그램명   : CurSesEntity 
* 기능 및 설명 : 로그인한 사용자의 Session 정보 저장 Entity
*---------------------------------------------------------------------------------
* 기       타  :
*********************************************************************************/
package egovframework.ubiz.mapper.ent;

import java.io.Serializable;

/**
 * 로그인한 사용자의 Session 정보 저장 Entity
 * @author GreenDay
 *
 * TODO 
 */
public class SesLinkEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public String user_id	= "";
	public String user_nm	= "";
	public String system_cd	= "";

    public SesLinkEntity() {}
	
}
