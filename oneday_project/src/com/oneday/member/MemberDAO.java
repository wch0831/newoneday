package com.oneday.member;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.oneday.common.MyBatisFactory;
import com.oneday.review.ReviewVO;

public class MemberDAO {
	
	public int memberRegister(MemberVO mvo) {
		SqlSession conn = null;
		int res = 0;
		
		try {
		conn = MyBatisFactory.getFactory().openSession();
		res = conn.insert("memberNameSpace.member_register", mvo);
		conn.commit();
		} catch(Exception e){
			e.getStackTrace();
		}finally {
			
			conn.close();
		}
		
		return res;
	}

	
	public ArrayList<MemberVO> userSelect() {
		SqlSession conn = null;
		MemberVO mvo = new MemberVO();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
			System.out.println("연결");
		conn = MyBatisFactory.getFactory().openSession();
		System.out.println("연결");
		list = (ArrayList)conn.selectList("memberNameSpace.member_info");
		System.out.println("연결");
		conn.commit();
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			conn.close();
		}
		
		return list;
	}
	
	public MemberVO loginselect(MemberVO mvo) {
		SqlSession conn = null;
		MemberVO vo = new MemberVO();

		try {
		conn = MyBatisFactory.getFactory().openSession();
		vo = conn.selectOne("memberNameSpace.member_login", mvo);
		conn.commit();
		} catch(Exception e){
			e.getStackTrace();
		}finally {
			conn.close();
		}
		return vo;
	}
	
	
}
