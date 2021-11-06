package model.member;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class MemberRowMapper implements RowMapper<MemberVO> {
	@Override
	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberVO data=new MemberVO();
		data.setMid(rs.getString("mid"));
		data.setMpw(rs.getString("mpw"));
		data.setMname(rs.getString("mname"));
		data.setEmail(rs.getString("email"));
		data.setProfile(rs.getString("profile"));
		return data;
	}
}

@Repository
public class MemberDAO {

	/*MID VARCHAR(10) PRIMARY KEY,
	MPW VARCHAR(12),
	MNAME VARCHAR(20),
	EMAIL VARCHAR(20),
	-- PHONE VARCHAR(20), -- 고민
	PROFILE VARCHAR(100) DEFAULT '\img\gj.jpg'
	-- BG VARCHAR(100) DEFAULT 'BG.JPG'*/
	
	private String INSERTM="INSERT INTO MEMBER VALUES (?,?,?,?,DEFAULT)";
	private String UPDATEM="UPDATE MEMBER SET MPW=?, MNAME=?, PROFILE=? WHERE MID=?";
	private String UPDATEPW="UPDATE MEMBER SET MPW=? WHERE MID=?";
	private String DELETEM="DELETE FROM MEMBER WHERE MID=?";
	private String GETM="SELECT * FROM MEMBER WHERE MID=?";
	// private String GETPLIST="SELECT * FROM MEMBER";
	
	@Autowired
	private JdbcTemplate jt;
	
	public void insertM(MemberVO vo) {
		jt.update(INSERTM, vo.getMid(), vo.getMpw(), vo.getMname(), vo.getEmail());
	}
	
	public void updateM(MemberVO vo) {
		jt.update(UPDATEM, vo.getMpw(), vo.getMname(), vo.getProfile(), vo.getMid());
	}
	
	public void updatePW(MemberVO vo) {
		jt.update(UPDATEPW, vo.getMpw(), vo.getMid());
	}
	
	public void deleteM(MemberVO vo) {
		jt.update(DELETEM, vo.getMid());
	}
	
	public MemberVO getM(MemberVO vo) {
		Object[] args= { vo.getMid() };
		return jt.queryForObject(GETM, args, new MemberRowMapper());
	}
	
}
