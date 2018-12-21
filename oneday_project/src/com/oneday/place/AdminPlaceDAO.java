package com.oneday.place;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.oneday.common.MyBatisFactory;

public class AdminPlaceDAO {
	public ArrayList<PlaceVO> selectPlace() {
		ArrayList<PlaceVO> pvoList = new ArrayList<PlaceVO>(); 
		SqlSession conn =null;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			pvoList = (ArrayList)conn.selectList("placeNameSpace.selectPlaceAll");
		} finally {
			conn.close();
		}
		return pvoList;
	}
	
	
	public int adminInsert(PlaceVO pvo) {
		SqlSession conn =null;
		int res = 0;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.insert("placeNameSpace.adminInsert", pvo);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
}
