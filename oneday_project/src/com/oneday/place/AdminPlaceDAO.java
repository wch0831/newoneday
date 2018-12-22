package com.oneday.place;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.oneday.common.MyBatisFactory;


  //관리자 장소리스트 뽑기

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
	
  // 관리자 입력값	
	
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
	
	
  // 관리자 수정페이지에 적혀져있는 값	
	
	public PlaceVO adminSelectUpdate(int pSeq) {
		SqlSession conn =null;
		PlaceVO pvo = null;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			pvo = conn.selectOne("placeNameSpace.adminSelectUpdate", pSeq); //where p_seq = #{value}
			conn.commit();
		} finally {
			conn.close();
		}
		return pvo;
	}
	
	
  //	관리자 수정
	
	public int adminUpdate(PlaceVO pvo) {
		SqlSession conn =null;
		int res = 0;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.update("placeNameSpace.adminUpdate", pvo); //where p_seq = #{value}
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	
	//검색결과 리슽트
	public ArrayList<PlaceVO> selectSearch(String search) {
		ArrayList<PlaceVO> pvoList = new ArrayList<PlaceVO>(); 
		SqlSession conn =null;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			pvoList = (ArrayList)conn.selectList("placeNameSpace.adminSearchSelect", search);
		} finally {
			conn.close();
		}
		return pvoList;
	}
	
	
	public ArrayList<PlaceVO> selectPlacearea(String search) {
		ArrayList<PlaceVO> pvoList = new ArrayList<PlaceVO>(); 
		SqlSession conn =null;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			pvoList = (ArrayList)conn.selectList("placeNameSpace.selectPlacearea", search);
		} finally {
			conn.close();
		}
		return pvoList;
	}
	
	
}
