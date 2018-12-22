package com.oneday.member;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.oneday.common.MyBatisFactory;
import com.oneday.review.ReviewVO;

public class MemberDAO {
	
	//회원가입 관련 ---------------------------------------------------------
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

	public ArrayList<MemberVO> checkEmail(){
		SqlSession conn = null;
		MemberVO mvo = new MemberVO();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();	
		try {
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("memberNameSpace.checkEmail");
			} catch(Exception e){
				e.getStackTrace();
			}finally {
				conn.close();
			}
			return list;
	}
	
	
	public ArrayList<MemberVO> checkNick(){
		SqlSession conn = null;
		MemberVO mvo = new MemberVO();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();	
		try {
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("memberNameSpace.checkNick");
			conn.commit();
			} catch(Exception e){
				e.getStackTrace();
			}finally {
				conn.close();
			}
			return list;
	}
	
	public ArrayList<MemberVO> userSelect() {
		SqlSession conn = null;
		MemberVO mvo = new MemberVO();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
		conn = MyBatisFactory.getFactory().openSession();
		list = (ArrayList)conn.selectList("memberNameSpace.member_info");
		conn.commit();
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			conn.close();
		}
		
		return list;
	}
	
	
	//로그인 관련-------------------------------------------------------------
	
	public MemberVO loginselect(MemberVO mvo) {
		SqlSession conn = null;
		MemberVO vo = new MemberVO();
		
		System.out.println(mvo.getmEmail()+mvo.getmPw()+"5번");
		
		try {
		conn = MyBatisFactory.getFactory().openSession();
		vo = conn.selectOne("memberNameSpace.member_login", mvo);
		System.out.println(vo.getmEmail()+vo.getmPw()+"6번");
		} catch(Exception e){
			e.getStackTrace();
		}finally {
			conn.close();
		}
		return vo;
	}
	
	public ArrayList<MemberVO> loginCheck() {
		SqlSession conn = null;
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();

		try {
		conn = MyBatisFactory.getFactory().openSession();
		list = (ArrayList)conn.selectList("memberNameSpace.member_check");
		} catch(Exception e){
			e.getStackTrace();
		}finally {
			conn.close();
		}
		return list;
	}
	
	
	
	
}
