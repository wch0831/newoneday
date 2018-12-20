package com.oneday.review;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;


import com.oneday.common.MyBatisFactory;

public class ReviewDAO {
	public ArrayList<ReviewVO> admin_reviewList() {
		SqlSession conn = null;
		ReviewVO rvo = new ReviewVO();
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		try {
			System.out.println("in");
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("reviewNameSpace.admin_Review_List");
		}catch(Exception e) {
			System.out.println("fail");
			e.printStackTrace();
			conn.close();
		}
		return list;
	}
	
	
	
	public int admin_reviewDel(ReviewVO rvo) {
		SqlSession conn = null;
		int res = 0;
		try {
			conn = MyBatisFactory.getFactory().openSession();			
			res = conn.delete("reviewNameSpace.admin_Review_del",rvo);
			conn.commit();
		}finally {
			conn.close();
		}
		return res;
	}
	
	
	public ReviewVO my_reviewList(ReviewVO rvo) {
		SqlSession conn = null;
		
		try {
			conn = MyBatisFactory.getFactory().openSession();
			rvo = conn.selectOne("reviewNameSpace.my_Review_List",rvo);
			conn.commit();
		}finally {
			conn.close();
		}
		return rvo;
	}
	
	
	public int my_reviewDel(ReviewVO rvo) {
		SqlSession conn = null;
		int res = 0;
		try {
			conn = MyBatisFactory.getFactory().openSession();			
			res = conn.delete("reviewNameSpace.my_Review_del",rvo);
			conn.commit();
		}finally {
			conn.close();
		}
		return res;
	}
	
	public ReviewVO users_reviewList(ReviewVO rvo) {
		SqlSession conn = null;
		
		try {
			conn = MyBatisFactory.getFactory().openSession();
			rvo = conn.selectOne("reviewNameSpace.users_Review_List",rvo);
			conn.commit();
		}finally {
			conn.close();
		}
		return rvo;
	}
	
	
}
