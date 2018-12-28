package com.oneday.place;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.oneday.common.MyBatisFactory;

public class PlaceMainDAO {
	public ArrayList<PlaceVO> mainSelect() {
		ArrayList<PlaceVO> mainList = new ArrayList<PlaceVO>(); 
		SqlSession conn =null;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			mainList = (ArrayList)conn.selectList("placeNameSpace.mainSelect");
		} finally {
			conn.close();
		}
		return mainList;
	}
	
	
	public ArrayList<PlaceVO> mainpurpose(String purpose) {
		ArrayList<PlaceVO> mainList = new ArrayList<PlaceVO>(); 
		SqlSession conn =null;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			mainList = (ArrayList)conn.selectList("placeNameSpace.mainPurpose", purpose);
		} finally {
			conn.close();
		}
		return mainList;
	}
	
	public ArrayList<PlaceVO> mainpurpose() {
		ArrayList<PlaceVO> mainList = new ArrayList<PlaceVO>(); 
		SqlSession conn =null;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			mainList = (ArrayList)conn.selectList("placeNameSpace.mainSelect");
		} finally {
			conn.close();
		}
		return mainList;
	}
	
	
	
	
}
