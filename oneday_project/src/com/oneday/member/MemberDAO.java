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
	
	//닉네임뽑기
	public MemberVO selectNick(int mseq){
		SqlSession conn = null;
		MemberVO mvo = new MemberVO();	
		try {
			conn = MyBatisFactory.getFactory().openSession();
			String nick = conn.selectList("memberNameSpace.checkNick").toString();
			mvo.setmNick(nick);
			} catch(Exception e){
				e.getStackTrace();
			}finally {
				conn.close();
			}
			return mvo;
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
	public int updateMyinfo(MemberVO mvo) {
		
		SqlSession conn = null;
		MemberVO vo = new MemberVO();
		int res = 0;
		System.out.println(mvo);
		
		try {
		conn = MyBatisFactory.getFactory().openSession();
		res = conn.update("memberNameSpace.member_update", mvo);
		conn.commit();
		System.out.println(res);
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			conn.close();
		}
		return res;
	}
	
	
	//마이페이지 > 정보수정 > 패스워드확인
	public String pwCheck(int seq) {
		SqlSession conn = null;
		String res = "";
		
		System.out.println(seq+"5번");
		
		try {
		conn = MyBatisFactory.getFactory().openSession();
		res = conn.selectOne("memberNameSpace.pwCheck", seq);
		System.out.println(res);
		} catch(Exception e){
			e.getStackTrace();
		}finally {
			conn.close();
		}
		return res;
	}
	
	
	
	//마이페이지 > 탈퇴
	public int memberDel(int seq) {
		SqlSession conn = null;
		MemberVO mvo = new MemberVO();
		int res = 0;
		System.out.println(seq+"------");
		
		try {
		conn = MyBatisFactory.getFactory().openSession();
		res = conn.update("memberNameSpace.member_del", seq);
		conn.commit();
		System.out.println(res+"//////");
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
		conn.commit();
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
	
	//아이디체크
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
	
	//로그인 > 비밀번호비교
	public String pwChack(String email) {
		SqlSession conn = null;
		String pw = "";

		try {
		conn = MyBatisFactory.getFactory().openSession();
		pw = conn.selectOne("memberNameSpace.email_check", email);
		
		System.out.println(pw);
		
		} catch(Exception e){
			e.getStackTrace();
		}finally {
			conn.close();
		}
		return pw;
		
	}
	
	//비밀번호 변경 > 분실 시 --------------------------------------------------
	public int changePw(MemberVO mvo) {
		SqlSession conn = null;
		int res = 0;
		
		System.out.println(mvo.getmEmail()+mvo.getmPw()+"/////");
		
		try {
		conn = MyBatisFactory.getFactory().openSession();
		res = conn.update("memberNameSpace.changePassword", mvo);
		conn.commit();
		System.out.println(res+"건 업데이트");
		} catch(Exception e){
			e.getStackTrace();
		}finally {
			conn.close();
		}
		return res;
	}
	
	//비밀번호 변경 > MYPAGE --------------------------------------------------
		public int changePw2(MemberVO mvo) {
			SqlSession conn = null;
			int res = 0;
			
			System.out.println(mvo.getmSeq()+","+mvo.getmPw()+"/////");
			
			try {
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.update("memberNameSpace.changePassword2", mvo);
			conn.commit();
			System.out.println(res+"건 업데이트");
			} catch(Exception e){
				e.getStackTrace();
			}finally {
				conn.close();
			}
			return res;
		}
	
	
}
