package com.oneday.faq;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.oneday.common.MyBatisFactory;




public class FaqDAO {
	
	public ArrayList<FaqVO> questionSelect() {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		SqlSession conn =null;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("qnaNameSpace.questionSelect");
		} finally {
			conn.close();
		}
		return list;
	}
	
	public ArrayList<FaqVO> adminQuestionSelect() {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		SqlSession conn =null;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("qnaNameSpace.adminQuestionSelect");
		} finally {
			conn.close();
		}
		return list;
	}
	
	public ArrayList<FaqVO> myQuestionSelect(String id) {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		SqlSession conn =null;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			System.out.println(id);
			list = (ArrayList)conn.selectList("qnaNameSpace.myQuestionSelect",id);
		} finally {
			conn.close();
		}
		return list;
	}
	
	
}
