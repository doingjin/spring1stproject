package model.member;

public interface MemberService {
	void insertM(MemberVO vo);
	void updateM(MemberVO vo);
	void updatePW(MemberVO vo);
	void deleteM(MemberVO vo);
	MemberVO getM(MemberVO vo);
}
