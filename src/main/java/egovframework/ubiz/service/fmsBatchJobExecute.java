package egovframework.ubiz.service;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import egovframework.cbiz.Box;
import egovframework.cbiz.CD;
import egovframework.cbiz.util.CodeUtil;
import egovframework.cbiz.util.DateUtil;
import egovframework.cbiz.util.FormatUtil;
import egovframework.cbiz.util.MailUtil;
import egovframework.cbiz.RsWrapper;
import egovframework.cbiz.service.CommDBService;
import egovframework.rte.fdl.property.EgovPropertyService;

public class fmsBatchJobExecute implements Runnable {

	protected CommDBService commDBService;

	protected EgovPropertyService propertiesService;
	
	public fmsBatchJobExecute(CommDBService commDBService, EgovPropertyService propertiesService) {
		this.commDBService = commDBService;
		this.propertiesService = propertiesService;
	}
	
	@Override
	public void run() {
		while(true) {
			try {
				//CD.logger.debug("fmsBatchJobExecute start");
				//execute();
				//CD.logger.debug("fmsBatchJobExecute end");
			}catch(Exception ex) {
				ex.printStackTrace();
			}

			try {
				Thread.sleep(1000*60*5); // 5분마다
			}catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
	
	/*********************************************************************************************
	 * BATCH JOB LIST
	 * 1) SMS, 카카오톡, 메일  발송대기 처리 : 5분 간격
	 * 2) 
	 * 	
	*********************************************************************************************/
	private String smsLastDt = "";  // SMS,카카오톡,메일 발송대기  최종처리일시
	
	private void execute() throws Exception {
		boolean isOk;
		Box ibox = new Box("");	
		Box rbox = new Box("");	
		rbox = CodeUtil.queryBox("DUAL", "to_char(sysdate,'yyyymmddhh24mi') as currentDt", "");
		String currentDt = rbox.get("currentDt");

		// SMS, 카카오톡, 메일 발송대기 생성 : 5분 간격
		isOk = smsLastDt.equals("") ? true : false;
		if(!smsLastDt.equals("")) {
			rbox = CodeUtil.queryBox("DUAL", "(to_date('"+currentDt+"','yyyymmddhh24mi') - to_date('"+smsLastDt+"','yyyymmddhh24mi')) * 24 * 60 as pass_min, to_char(sysdate,'yyyymmddhh24mi') as currentDt", "");
			if(rbox.getInt("pass_min") >= 5) { isOk = true; }
		}
		if(isOk) {
			commDBService.exec("FMSLNK.PR_COMTB_SMSG01", "", ibox);
			smsLastDt = currentDt;
		}

	}
	
	/********************************************************************************************/
	/* Method Name  : eduClosingNotify															*/
	/* Description  : 교육마감 후, 신청자에게 문자메시지 발송													*/
	/********************************************************************************************/
	// ??? 이건 배치작업이 아니라, 교육관리자가 클릭 시점에 발송되는 게 맞을 듯. .컨트롤러 처리로...
	private void eduClosingNotify() throws Exception {
		Box rbox = new Box();
		try {
			rbox = commDBService.execBox("PR_BATCH", "EDU001", new Box());
		}catch(Exception ex) {
			CD.logger.error(ExceptionUtils.getMessage(ex));
		}finally {
			CD.logger.info("executeEduBatch Excuted : " + rbox.get("insert_cnt"));
		}
	}
}
