package model.post;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class PostRowMapper implements RowMapper<PostVO>{
	@Override
	public PostVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		PostVO data=new PostVO();
		data.setPno(rs.getInt("pno"));
		data.setMid(rs.getString("mid"));
		data.setTitle(rs.getString("title"));
		data.setContent(rs.getString("content"));
		data.setImgname(rs.getString("imgname"));
		data.setLocation(rs.getString("location"));
		data.setPdate(rs.getDate("pdate"));
		return data;
	}
}

@Repository
public class PostDAO {

	private String INSERTP="INSERT INTO POST VALUES ((SELECT (NVL(MAX(PNO),0)+1) FROM POST),?,?,?,?,?,SYSDATE)";
	private String UPDATEP="UPDATE POST SET TITLE=?, CONTENT=? WHERE PNO=?";
	private String DELETEP="DELETE FROM POST WHERE PNO=?";
	private String GETP="SELECT * FROM POST WHERE PNO=?";
	private String GETPLIST="SELECT * FROM POST WHERE MID=?";
	
	@Autowired
	private JdbcTemplate jt;
	
	// mid / title / content / imgname / location
	public void insertP(PostVO vo) {
		jt.update(INSERTP,vo.getMid(),vo.getTitle(),vo.getContent(),vo.getImgname(),vo.getLocation());
	}
	
	// title / content / pno
	public void updateP(PostVO vo) {
		jt.update(UPDATEP, vo.getTitle(),vo.getContent(),vo.getPno());
	}
	
	// pno
	public void deleteP(PostVO vo) {
		jt.update(DELETEP, vo.getPno());
	}
	
	// pno
	public PostVO getP(PostVO vo) {
		Object[] args= {vo.getPno()};
		return jt.queryForObject(GETP, args, new PostRowMapper());
	}
	
	// mid
	public List<PostVO> getPlist(PostVO vo) {
		Object[] args= {vo.getMid()};
		return jt.query(GETPLIST, args, new PostRowMapper());
	}
	
	// get COUNT for pagination
	public int getTotalCount(PostVO vo) {
		String SQL="SELECT COUNT(*) FROM POST WHERE MID=?";
		Object[] args= {vo.getMid()};
		return jt.queryForObject(SQL, args, Integer.class);
	}
	
	// getPList with PAGENATION
	public List<PostVO> getPList(PostVO vo, int startRow, int endRow) {
		String SQL ="SELECT * FROM (SELECT ROWNUM AS RNUM, A.PNO,A.MID,A.TITLE,A.CONTENT,A.IMGNAME,A.LOCATION,A.PDATE FROM (SELECT * FROM POST WHERE MID=? ORDER BY PNO DESC ) A) WHERE RNUM BETWEEN ? AND ?";
		Object[] args= {vo.getMid(), startRow, endRow};
		return jt.query(SQL, args, new PostRowMapper());
	}
}
