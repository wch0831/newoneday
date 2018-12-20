package com.oneday.place;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.oneday.common.MyBatisFactory;

public class PlaceDAO {
	
	// 목적만
	public ArrayList<PlaceVO> selectPlacep(String pp) {
		ArrayList<PlaceVO> list = null;
		SqlSession conn =null;
	
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("placeNameSpace.selectPlacep", pp);
			conn.commit();
		} finally {
			conn.close();
		}
		return list;
	}
	
	//목적과 지역만
	/*public ArrayList<PlaceVO> selectPlacepa(String pp, String pa) {
		ArrayList<PlaceVO> list = null;
		SqlSession conn =null;
	
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("placeNameSpace.selectPlacepa", pp,pa);
			conn.commit();
		} finally {
			conn.close();
		}
		return list;
	}*/
	
	
}
