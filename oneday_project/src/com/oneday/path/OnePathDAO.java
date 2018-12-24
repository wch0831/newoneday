package com.oneday.path;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.oneday.common.MyBatisFactory;
import com.oneday.member.MemberVO;

public class OnePathDAO {

	public ArrayList<OnePathVO> popThemeSelect() {
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
	public ArrayList<OnePathVO> popAreaSelect() {
		SqlSession conn = null;
		OnePathVO ovo = new OnePathVO();
		ArrayList<OnePathVO> list = new ArrayList<OnePathVO>();
		try {
			System.out.println("연결");
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("pathNameSpace.popAreaSelect");
			conn.commit();
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			conn.close();
		}
		return list;
	}
	public OnePathVO pathDetailSelect(OnePathVO vo) {
		SqlSession conn = null;
		OnePathVO ovo = new OnePathVO();
		try {
			System.out.println("연결");
			conn = MyBatisFactory.getFactory().openSession();
			ovo = conn.selectOne("pathNameSpace.pathDetailSelect", vo.getoSeq());
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			conn.close();
		}
		return ovo;
	}
	public ArrayList<OnePathVO> pathListSelect() {
		SqlSession conn = null;
		ArrayList<OnePathVO> list = null;
		try {
			System.out.println("연결");
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("pathNameSpace.SelectList");
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			conn.close();
		}
		return list;
	}
}
