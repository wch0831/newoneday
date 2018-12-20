package com.oneday.path;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.oneday.common.MyBatisFactory;
import com.oneday.member.MemberVO;

public class OnePathDAO {

	public ArrayList<OnePathVO> popSelect() {
		SqlSession conn = null;
		OnePathVO ovo = new OnePathVO();
		ArrayList<OnePathVO> list = new ArrayList<OnePathVO>();
		try {
			System.out.println("연결");
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("pathNameSpace.popThemeSelect");
			conn.commit();
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			conn.close();
		}
		return list;
	}
}
