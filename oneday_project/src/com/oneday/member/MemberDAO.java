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
	
	//메일체크
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
	
	//닉네임체크
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
	
	//관리자 > 회원관리
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
	
	//마이페이지 > 내정보
	public MemberVO myInfo(int seq) {
		SqlSession conn = null;
		MemberVO mvo = new MemberVO();
		
		try {
		conn = MyBatisFactory.getFactory().openSession();
		mvo = conn.selectOne("memberNameSpace.my_info", seq);
		conn.commit();
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			conn.close();
		}
		
		return mvo;
	}
	
	
	//마이페이지 > 정보수정
	
	
	
	//마이페이지 > 탈퇴
	public int memberDel(int seq) {
		SqlSession conn = null;
		MemberVO mvo = new MemberVO();
		int res = 0;
		System.out.println(seq);
		
		try {
		conn = MyBatisFactory.getFactory().openSession();
		res = conn.update("memberNameSpace.member_del", seq);
		conn.commit();
		System.out.println(res);
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			conn.close();
		}
		
		return res;
	}
	
	
	//비밀번호 찾기
	public int randomPassword(MemberVO mvo) {
		SqlSession conn = null;
		int res = 0;
	
		System.out.println(mvo.getmEmail()+","+mvo.getmResnum()+","+mvo.getmPw()+"찍어봅시다");
		
		try {
		conn = MyBatisFactory.getFactory().openSession();
		res = conn.update("memberNameSpace.randomPassword", mvo);

		System.out.println(res+"건 update");
		
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			conn.close();
		}
		
		return res;
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
	
	//아이디,비번체크
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
