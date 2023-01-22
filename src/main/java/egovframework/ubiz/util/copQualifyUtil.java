/*******************************************************************/
/* Class Name  : copQualifyUtil		  					  	   */
/* Description : 관련업체 요건심사  관련 Class						   */
/*******************************************************************/

package egovframework.ubiz.util;

import java.util.Hashtable;
import java.util.Vector;
import egovframework.cbiz.util.StringUtil;

public class copQualifyUtil
{
	// 안전진단기관 기술인력 요건심사
    public static Hashtable coeMember(egovframework.cbiz.RsWrapper rsWp, String biz_class) {
		Hashtable ht = new Hashtable();
		int cnt[][] = new int[6][];
		for(int i=0; i < cnt.length; i++) { cnt[i] = new int[] {0,0,0,0,0,0,0,0,0,0,0,0,0}; }
		for(int k=0; k < rsWp.getLength(); k++) { 
			if(rsWp.get("member_gbn",k).equals("1") || rsWp.get("member_gbn",k).equals("2")) {
				cnt[0][0]  += rsWp.getInt("cnt_all",k);
				cnt[0][1]  += rsWp.getInt("br_cnt1",k); cnt[0][2]  += rsWp.getInt("br_cnt2",k); cnt[0][3]  += rsWp.getInt("br_cnt3",k);
				cnt[0][4]  += rsWp.getInt("ar_cnt1",k); cnt[0][5]  += rsWp.getInt("ar_cnt2",k); cnt[0][6]  += rsWp.getInt("ar_cnt3",k);
				cnt[0][7]  += rsWp.getInt("hm_cnt1",k); cnt[0][8]  += rsWp.getInt("hm_cnt2",k); cnt[0][9]  += rsWp.getInt("hm_cnt3",k);
				cnt[0][10] += rsWp.getInt("su_cnt1",k); cnt[0][11] += rsWp.getInt("su_cnt2",k); cnt[0][12] += rsWp.getInt("su_cnt3",k);
			}	
			cnt[k+1][0]  += rsWp.getInt("cnt_all",k);
			cnt[k+1][1]  += rsWp.getInt("br_cnt1",k); cnt[k+1][2]  += rsWp.getInt("br_cnt2",k); cnt[k+1][3]  += rsWp.getInt("br_cnt3",k);
			cnt[k+1][4]  += rsWp.getInt("ar_cnt1",k); cnt[k+1][5]  += rsWp.getInt("ar_cnt2",k); cnt[k+1][6]  += rsWp.getInt("ar_cnt3",k);
			cnt[k+1][7]  += rsWp.getInt("hm_cnt1",k); cnt[k+1][8]  += rsWp.getInt("hm_cnt2",k); cnt[k+1][9]  += rsWp.getInt("hm_cnt3",k);
			cnt[k+1][10] += rsWp.getInt("su_cnt1",k); cnt[k+1][11] += rsWp.getInt("su_cnt2",k); cnt[k+1][12] += rsWp.getInt("su_cnt3",k);

			cnt[5][0]  += rsWp.getInt("cnt_all",k);
			cnt[5][1]  += rsWp.getInt("br_cnt1",k); cnt[5][2]  += rsWp.getInt("br_cnt2",k); cnt[5][3]  += rsWp.getInt("br_cnt3",k);
			cnt[5][4]  += rsWp.getInt("ar_cnt1",k); cnt[5][5]  += rsWp.getInt("ar_cnt2",k); cnt[5][6]  += rsWp.getInt("ar_cnt3",k);
			cnt[5][7]  += rsWp.getInt("hm_cnt1",k); cnt[5][8]  += rsWp.getInt("hm_cnt2",k); cnt[5][9]  += rsWp.getInt("hm_cnt3",k);
			cnt[5][10] += rsWp.getInt("su_cnt1",k); cnt[5][11] += rsWp.getInt("su_cnt2",k); cnt[5][12] += rsWp.getInt("su_cnt3",k);
		}
	
		Vector vt1 = new Vector();
		Vector vt2 = new Vector();
		Vector vt3 = new Vector();
		Vector vt4 = new Vector();
	
		int br_ga01  = cnt[0][1] + cnt[0][2] + cnt[0][3]; // 교량 가목(토목/건축/안전 total)	
		int br_na01  = cnt[3][1] + cnt[3][2] + cnt[3][3] + (br_ga01 > 2 ? br_ga01-2 : 0); // 교량 나목(토목/건축/안전 total)
		int br_da01  = cnt[4][1] + cnt[4][2] + cnt[4][3] + (br_na01 > 3 ? br_na01-3 : 0); // 교량 다목(토목/건축/안전 total)
		int ar_ga01  = cnt[0][4] + cnt[0][5] + cnt[0][6]; // 건축 가목(토목/건축/안전 total)	
		int ar_na01  = cnt[3][4] + cnt[3][5] + cnt[3][6] + (ar_ga01 > 2 ? ar_ga01-2 : 0); // 건축 나목(토목/건축/안전 total)
		int ar_da01  = cnt[4][4] + cnt[4][5] + cnt[4][6] + (ar_na01 > 3 ? ar_na01-3 : 0); // 건축 다목(토목/건축/안전 total)
		int hm_ga01  = cnt[0][7] + cnt[0][8] + cnt[0][9]; // 항만 가목(토목/건축/안전 total)	
		int hm_na01  = cnt[3][7] + cnt[3][8] + cnt[3][9] + (hm_ga01 > 2 ? hm_ga01-2 : 0); // 항만 나목(토목/건축/안전 total)
		int hm_da01  = cnt[4][7] + cnt[4][8] + cnt[4][9] + (hm_na01 > 3 ? hm_na01-3 : 0); // 항만 다목(토목/건축/안전 total)
		int su_ga01  = cnt[0][10] + cnt[0][11] + cnt[0][12]; // 수리 가목(토목/건축/안전 total)	
		int su_na01  = cnt[3][10] + cnt[3][11] + cnt[3][12] + (su_ga01 > 2 ? su_ga01-2 : 0); // 수리 나목(토목/건축/안전 total)
		int su_da01  = cnt[4][10] + cnt[4][11] + cnt[4][12] + (su_na01 > 3 ? su_na01-3 : 0); // 수리 다목(토목/건축/안전 total)
	
		int br_ga02  = cnt[0][1] + cnt[0][2]; // 교량 가목(토목/건축 total)	
		int br_na02  = cnt[3][1] + cnt[3][2] + (br_ga02 > 2 ? br_ga02-2 : 0); // 교량 나목(토목/건축 total)
		int ar_ga02  = cnt[0][4] + cnt[0][5]; // 건축 가목(토목/건축 total)	
		int ar_na02  = cnt[3][4] + cnt[3][5] + (ar_ga02 > 2 ? ar_ga02-2 : 0); // 건축 나목(토목/건축 total)
		int hm_ga02  = cnt[0][7] + cnt[0][8]; // 항만 가목(토목/건축 total)	
		int hm_na02  = cnt[3][7] + cnt[3][8] + (hm_ga02 > 2 ? hm_ga02-2 : 0); // 항만 나목(토목/건축 total)
		int su_ga02  = cnt[0][10] + cnt[0][11]; // 수리 가목(토목/건축 total)	
		int su_na02  = cnt[3][10] + cnt[3][11] + (su_ga02 > 2 ? su_ga02-2 : 0); // 수리 나목(토목/건축 total)
	
		int field_cnt = 0; // 분야갯수
		if(StringUtil.substr(biz_class,0,1).equals("1")) { field_cnt++; }
		if(StringUtil.substr(biz_class,1,2).equals("1")) { field_cnt++; }
		if(StringUtil.substr(biz_class,2,3).equals("1")) { field_cnt++; }
		if(StringUtil.substr(biz_class,3,4).equals("1")) { field_cnt++; }
	
		// 가,나,다 군
		if(field_cnt >= 2) { // 분야 2개 이상
			if(StringUtil.substr(biz_class,0,1).equals("1") && br_ga01 < 2) { // 교량 가 2명 이하 실패
				int v0101 = 2 - br_ga01;
				if(br_ga01 < 2) vt1.add("- 가)군 : 토목/건축/건설안전분야의 기술인력 합이 "+ v0101+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,0,1).equals("1") && br_ga02 < 1) {
				int v0102 = 1 - br_ga02;
				vt1.add(" * 가)군의 토목/건축분야의 기술인력이 "+v0102+"명 부족합니다.");
			}	
			if(StringUtil.substr(biz_class,1,2).equals("1") && ar_ga01 < 2) { // 건축 가 2명 이하 실패
				int v0101 = 2 - ar_ga01;
				if(ar_ga01 < 2) vt2.add("- 가)군 : 토목/건축/건설안전분야의 기술인력 합이 "+ v0101+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,1,2).equals("1") && ar_ga02 < 1) {
				int v0102 = 1 - ar_ga02;
				vt2.add(" * 가)군의 토목/건축분야의 기술인력이 "+v0102+"명 부족합니다.");
			}	
			if(StringUtil.substr(biz_class,2,3).equals("1") && hm_ga01 <2) {// 항만 가 2명 이하 실패
				int v0101 = 2 - hm_ga01;
				if(hm_ga01 < 2) vt3.add("- 가)군 : 토목/건축/건설안전분야의 기술인력 합이 "+ v0101+"명 부족합니다.");				
			}
			if(StringUtil.substr(biz_class,2,3).equals("1") && hm_ga02 < 1) {
				int v0102 = 1 - hm_ga02;
				vt3.add(" * 가)군의 토목/건축분야의 기술인력이 "+v0102+"명 부족합니다.");
			}	
			if(StringUtil.substr(biz_class,3,4).equals("1") && su_ga01 <2) {// 수리 가 2명 이하 실패
				int v0101 = 2 - su_ga01;
				if(su_ga01 < 2) vt4.add("- 가)군 : 토목/건축/건설안전분야의 기술인력 합이 "+ v0101+"명 부족합니다."); 
			}
			if(StringUtil.substr(biz_class,3,4).equals("1") && su_ga02 < 1) {
				int v0102 = 1 - su_ga02;
				vt4.add(" * 가)군의 토목/건축분야의 기술인력이 "+v0102+"명 부족합니다.");
			}
			
			int cntUnder2_na = 0;
			int cntUnder2_da = 0;
			boolean cntUnder2NaErr = false;
			boolean cntUnder2DaErr = false;
			if(StringUtil.substr(biz_class,0,1).equals("1") && br_na01 <=2) { cntUnder2_na++; }
			if(StringUtil.substr(biz_class,1,2).equals("1") && ar_na01 <=2) { cntUnder2_na++; }
			if(StringUtil.substr(biz_class,2,3).equals("1") && hm_na01 <=2) { cntUnder2_na++; }
			if(StringUtil.substr(biz_class,3,4).equals("1") && su_na01 <=2) { cntUnder2_na++; }
			if(StringUtil.substr(biz_class,0,1).equals("1") && br_da01 <=2) { cntUnder2_da++; }
			if(StringUtil.substr(biz_class,1,2).equals("1") && ar_da01 <=2) { cntUnder2_da++; }
			if(StringUtil.substr(biz_class,2,3).equals("1") && hm_da01 <=2) { cntUnder2_da++; }
			if(StringUtil.substr(biz_class,3,4).equals("1") && su_da01 <=2) { cntUnder2_da++; }
	
			if(cntUnder2_na > 1) { // 교량/건축/항만/수리 나 2명 이하가 하나 초과 실패
				cntUnder2NaErr = true;
			}
			if(cntUnder2_da > 1) { // 교량/건축/항만/수리 다 2명 이하가 하나 초과 실패
				cntUnder2DaErr = true;
			}
			if(StringUtil.substr(biz_class,0,1).equals("1") && (br_na01 == 1 || (br_na01 < 3 && cntUnder2NaErr == true))) { // 교량 나 3명 이하 이고 인정인력 부족이 2명이상일 때 실패
				int v0103 = 3 - br_na01; 
				vt1.add("- 나)군 : 토목/건축/건설안전분야의 기술인력이 "+ v0103+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,0,1).equals("1") && br_na02 < 2 ) {
				int v0104 = 2 - br_na02;
				vt1.add(" * 나)군의 토목/건축분야의 중급기술자 자격을 가진자 "+v0104 +"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,0,1).equals("1") && (br_da01 == 1 || (br_da01 < 3 && cntUnder2DaErr == true))) { // 교량 다 3명 이하 실패
				int v0105 = 3 - br_da01; 
				vt1.add("- 다)군 : 토목/건축/건설안전분야의 기술인력이 "+v0105+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,1,2).equals("1") && (ar_na01 == 1 || (ar_na01 < 3 && cntUnder2NaErr == true))) { // 건축 나 3명 이하 실패
				int v0103 = 3 - ar_na01; 
				vt2.add("- 나)군 : 토목/건축/건설안전분야의 기술인력이 "+ v0103+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,1,2).equals("1") && ar_na02 < 2 ) {
				int v0104 = 2 - ar_na02;
				vt2.add(" * 나)군의 토목/건축분야의 중급기술자 자격을 가진자 "+v0104 +"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,1,2).equals("1") && (ar_da01 == 1 || (ar_da01 < 3 && cntUnder2DaErr == true))) { // 건축 다 3명 이하 실패
				int v0105 = 3 - ar_da01; 
				vt2.add("- 다)군 : 토목/건축/건설안전분야의 기술인력이 "+v0105+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,2,3).equals("1") && (hm_na01 == 1 || (hm_na01 < 3 && cntUnder2NaErr == true))) { // 항만 나 3명 이하 실패
				int v0103 = 3 - hm_na01; 
				vt3.add("- 나)군 : 토목/건축/건설안전분야의 기술인력이 "+ v0103+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,2,3).equals("1") && hm_na02 < 2 ) {
				int v0104 = 2 - hm_na02;
				vt3.add(" * 나)군의 토목/건축분야의 중급기술자 자격을 가진자 "+v0104 +"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,2,3).equals("1") && (hm_da01 == 1 || (hm_da01 < 3 && cntUnder2DaErr == true))) { // 항만 다 3명 이하 실패  
				int v0105 = 3 - hm_da01; 
				vt3.add("- 다)군 : 토목/건축/건설안전분야의 기술인력이 "+v0105+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,3,4).equals("1") && (su_na01 == 1 || (su_na01 < 3 && cntUnder2NaErr == true))) { // 수리 나 3명 이하 실패
				int v0103 = 3 - su_na01; 
				vt4.add("- 나)군 : 토목/건축/건설안전분야의 기술인력이 "+ v0103+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,3,4).equals("1") && su_na02 < 2 ) {
				int v0104 = 2 - su_na02;
				vt4.add(" * 나)군의 토목/건축분야의 중급기술자 자격을 가진자 "+v0104 +"명 부족합니다.");	
			}
			if(StringUtil.substr(biz_class,3,4).equals("1") && (su_da01 == 1 || (su_da01 < 3 && cntUnder2DaErr == true))) { // 수리 다 3명 이하 실패
				int v0105 = 3 - su_da01; 
				vt4.add("- 다)군 : 토목/건축/건설안전분야의 기술인력이 "+v0105+"명 부족합니다.");
			}
		}else { // 분야 1개
			// 교량 및 터널 분야
			if(StringUtil.substr(biz_class,0,1).equals("1") && br_ga01 < 2) { // 교량 가 2명 이하 실패
				int v0101 = 2 - br_ga01;
				if(br_ga01 < 2) vt1.add("- 가)군 : 토목/건축/건설안전분야의 기술인력 합이 "+ v0101+"명 부족합니다."); 
			}
			if(StringUtil.substr(biz_class,0,1).equals("1") && br_ga02 < 1 ) { // 토목/건축 기술인력  50%(1인)이상 포함 체크
				int v0102 = 1 - br_ga02;
				vt1.add(" * 가)군의 토목/건축분야의 기술인력이 "+v0102+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,0,1).equals("1") && br_na01 < 3) { // 교량 나 3명 이하 실패
				int v0103 = 3 - br_na01;
				vt1.add("- 나)군 : 토목/건축/건설안전분야의 기술인력이 "+ v0103+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,0,1).equals("1") && br_na02 < 2 ) { //토목/건축  60%(2인)이상 포함 체크
				int v0104 = 2 - br_na02;
				vt1.add(" * 나)군의 토목/건축분야의 중급기술자 자격을 가진자 "+v0104 +"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,0,1).equals("1") && br_da01 < 3) { // 교량 다 3명 이하 실패
				int v0105 = 3 - br_da01; 
				vt1.add("- 다)군 : 토목/건축/건설안전분야의 기술인력이 "+v0105+"명 부족합니다.");
			}
			// 건축분야
			if(StringUtil.substr(biz_class,1,2).equals("1") && ar_ga01 < 2) { // 건축 가 2명 이하 실패
				int v0101 = 2 - ar_ga01;
				if(ar_ga01 < 2) vt2.add("- 가)군 : 토목/건축/건설안전분야의 기술인력 합이 "+ v0101+"명 부족합니다."); 
			}
			if(StringUtil.substr(biz_class,1,2).equals("1") && ar_ga02 < 1) { // 토목/건축 기술인력 50%(1인)이상 포함 체크
				int v0102 = 1 - ar_ga02;
				vt2.add(" * 가)군의 토목/건축분야의 기술인력이 "+v0102+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,1,2).equals("1") && ar_na01 < 3) { // 건축 나 3명 이하 실패
				int v0103 = 3 - ar_na01; 
				vt2.add("- 나)군 : 토목/건축/건설안전분야의 기술인력이 "+ v0103+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,1,2).equals("1") && ar_na02 < 2 ) { //토목/건축  60%(2인)이상 포함 체크
				int v0104 = 2 - ar_na02;
				vt2.add(" * 나)군의 토목/건축분야의 중급기술자 자격을 가진자 "+v0104 +"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,1,2).equals("1") && ar_da01 < 3) { // 건축 다 3명 이하 실패
				int v0105 = 3 - ar_da01;
				vt2.add("- 다)군 : 토목/건축/건설안전분야의 기술인력이 "+v0105+"명 부족합니다.");
			}
			// 항만분야
			if(StringUtil.substr(biz_class,2,3).equals("1") && hm_ga01 < 2) { // 항만 가 2명 이하 실패
				int v0101 = 2 - hm_ga01;
				if(hm_ga01 <2 ) vt2.add("- 가)군 : 토목/건축/건설안전분야의 기술인력 합이 "+ v0101+"명 부족합니다."); 
			}
			if(StringUtil.substr(biz_class,2,3).equals("1") && hm_ga02 < 1) { //토목/건축 기술인력  50%(1인)이상 포함 체크
				int v0102 = 1 - hm_ga02;
				vt3.add(" * 가)군의 토목/건축분야의 기술인력이 "+v0102+"명 부족합니다.");
			}	
			if(StringUtil.substr(biz_class,2,3).equals("1") && hm_na01 < 3) { // 항만 나 3명 이하 실패
				int v0103 = 3 - hm_na01; 
				vt3.add("- 나)군 : 토목/건축/건설안전분야의 기술인력이 "+ v0103+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,2,3).equals("1") && hm_na02 < 2 ) { //토목/건축  60%(2인)이상 포함 체크
				int v0104 = 2 - hm_na02;
				vt3.add(" * 나)군의 토목/건축분야의 중급기술자 자격을 가진자 "+v0104 +"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,2,3).equals("1") && hm_da01 < 3) { // 항만 다 3명 이하 실패  
				int v0105 = 3 - hm_da01;
				vt3.add("- 다)군 : 토목/건축/건설안전분야의 기술인력이 "+v0105+"명 부족합니다.");
			}
			// 수리분야
			if(StringUtil.substr(biz_class,3,4).equals("1") && su_ga01 < 2) { // 수리 가 2명 이하 실패
				int v0101 = 2 - su_ga01;
				if(su_ga01 < 2) vt4.add("- 가)군 : 토목/건축/건설안전분야의 기술인력 합이 "+ v0101+"명 부족합니다."); 
			}
			if(StringUtil.substr(biz_class,3,4).equals("1") && su_ga02 < 1 ) { //토목/건축 기술인력  50%(1인)이상 포함 체크
				int v0102 = 1 - su_ga02;
				vt4.add(" * 가)군의 토목/건축분야의 기술인력이 "+v0102+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,3,4).equals("1") && su_na01 < 3) { // 수리 나 3명 이하 실패
				int v0103 = 3 - su_na01;
				vt4.add("- 나)군 : 토목/건축/건설안전분야의 기술인력이 "+ v0103+"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,3,4).equals("1") && su_na02 < 2 ) { //토목/건축  60%(2인)이상 포함 체크
				int v0104 = 2 - su_na02;
				vt4.add(" * 나)군의 토목/건축분야의 중급기술자 자격을 가진자 "+v0104 +"명 부족합니다.");
			}
			if(StringUtil.substr(biz_class,3,4).equals("1") && su_da01 < 3) { // 수리 다 3명 이하 실패
				int v0105 = 3 - su_da01; 
				vt4.add("- 다)군 : 토목/건축/건설안전분야의 기술인력이 "+v0105+"명 부족합니다.");
			} 
		}
		
		ht.put("vt1", vt1);
		ht.put("vt2", vt2);
		ht.put("vt3", vt3);
		ht.put("vt4", vt4);
		ht.put("cnt", cnt);
		return ht;
    }

	// 안전진단기관 보유장비 요건심사
    public static Hashtable coeEquip(egovframework.cbiz.RsWrapper rsWp, String biz_class) {
		Hashtable ht = new Hashtable();
		Vector vt0 = new Vector();
		for(int i=0; i < rsWp.getLength(); i++) { 
			if(!rsWp.get("equip_class",i).equals("10")) { continue; } 
			if(rsWp.get("required_yn",i).equals("Y") && rsWp.getInt("cnt",i) == 0) { vt0.add("<font color=red>" + rsWp.get("equip_nm",i) + "</font> 장비가 부족합니다."); }
		}
		Vector vt1 = new Vector();
		for(int i=0; i < rsWp.getLength(); i++) { 
			if(!rsWp.get("equip_class",i).equals("20")) { continue; } 
			if(rsWp.get("required_yn",i).equals("Y") && rsWp.getInt("cnt",i) == 0) { vt1.add("<font color=red>" + rsWp.get("equip_nm",i) + "</font> 장비가 부족합니다."); }
		}
		Vector vt2 = new Vector();
		for(int i=0; i < rsWp.getLength(); i++) { 
			if(!rsWp.get("equip_class",i).equals("40")) { continue; } 
			if(rsWp.get("required_yn",i).equals("Y") && rsWp.getInt("cnt",i) == 0) { vt2.add("<font color=red>" + rsWp.get("equip_nm",i) + "</font> 장비가 부족합니다."); }
		}
		Vector vt3 = new Vector();
		for(int i=0; i < rsWp.getLength(); i++) { 
			if(!rsWp.get("equip_class",i).equals("30")) { continue; } 
			if(rsWp.get("required_yn",i).equals("Y") && rsWp.getInt("cnt",i) == 0) { vt3.add("<font color=red>" + rsWp.get("equip_nm",i) + "</font> 장비가 부족합니다."); }
		}
		Vector vt4 = new Vector();
		for(int i=0; i < rsWp.getLength(); i++) { 
			if(!rsWp.get("equip_class",i).equals("50")) { continue; } 
			if(rsWp.get("required_yn",i).equals("Y") && rsWp.getInt("cnt",i) == 0) { vt4.add("<font color=red>" + rsWp.get("equip_nm",i) + "</font> 장비가 부족합니다."); }
		}
		
		ht.put("vt0", vt0);
		ht.put("vt1", vt1);
		ht.put("vt2", vt2);
		ht.put("vt3", vt3);
		ht.put("vt4", vt4);
		return ht;
    }

}
