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
			list = (ArrayList)conn.selectList("qnaNameSpace.myQuestionSelect",id);
		} finally {
			conn.close();
		}
		return list;
	}
	
	
	public ArrayList<FaqVO> myInfoSelect(String id) {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		SqlSession conn =null;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("qnaNameSpace.myInfoSelect",id);
		} finally {
			conn.close();
		}
		return list;
	}
	
	public int myInfoSelect2(String id) {
		int res = 0;
		SqlSession conn =null;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.selectOne("qnaNameSpace.myInfoSelect2",id);
		} finally {
			conn.close();
		}
		return res;
	}
	
	
	public int questionInsert(FaqVO fvo) {
		SqlSession conn =null;
		int res = 0;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.insert("qnaNameSpace.questionInsert",fvo);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	
	
	public ArrayList<FaqVO> searchQuestionSelect(FaqVO fvo) {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		SqlSession conn =null;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("qnaNameSpace.searchQuestionSelect",fvo);
		} finally {
			conn.close();
		}
		return list;
	}
	
	public ArrayList<FaqVO> searchMyQuestionSelect(FaqVO fvo) {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		SqlSession conn =null;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("qnaNameSpace.searchMyQuestionSelect",fvo);
		} finally {
			conn.close();
		}
		return list;
	}
	
	public int adminQuestionDelete(FaqVO fvo) {
		SqlSession conn =null;
		int res = 0;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.delete("qnaNameSpace.adminQuestionDelete",fvo);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	
	public ArrayList<FaqVO> selectBoxAnswer() {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		SqlSession conn =null;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("qnaNameSpace.selectBoxAnswer");
		} finally {
			conn.close();
		}
		return list;
	}
	
	public int adminQuestionUpdate(FaqVO fvo) {
		SqlSession conn =null;
		int res = 0;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.update("qnaNameSpace.adminQuestionUpdate",fvo);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	
	public int adminQuestionInsert(FaqVO fvo) {
		SqlSession conn =null;
		int res = 0;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.update("qnaNameSpace.adminQuestionInsert",fvo);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	
	public ArrayList<FaqVO> adminAnswerSelect() {
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		SqlSession conn =null;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("qnaNameSpace.adminAnswerSelect");
		} finally {
			conn.close();
		}
		return list;
	}
	
	public int adminAnswerDelete(FaqVO fvo) {
		SqlSession conn =null;
		int res = 0;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.delete("qnaNameSpace.adminAnswerDelete",fvo);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	
	public int adminAnswerAdd(FaqVO fvo) {
		SqlSession conn =null;
		int res = 0;
		
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.update("qnaNameSpace.adminAnswerAdd",fvo);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	
	
}
