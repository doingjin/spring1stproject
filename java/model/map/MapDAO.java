package model.map;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class MapRowMapper implements RowMapper<MapVO>{
	@Override
	public MapVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MapVO data=new MapVO();
		data.setPno(rs.getInt("pno"));
		data.setLat(rs.getString("lat"));
		data.setLng(rs.getString("lng"));
		data.setLocation(rs.getString("location"));
		data.setMid(rs.getString("mid"));
		data.setImgname(rs.getString("imgname"));
		return data;
	}
}

@Repository
public class MapDAO {
	
	/*PNO INT PRIMARY KEY,
	LAT VARCHAR(20) NOT NULL,
	LNG VARCHAR(20) NOT NULL,
	LOCATION VARCHAR(50),
	MID VARCHAR(10),
	IMGNAME VARCHAR(100)
	CONSTRAINT mpno FOREIGN KEY (PNO) REFERENCES POST(PNO) ON DELETE CASCADE*/
	
	private String INSERT="INSERT INTO MAP VALUES ((SELECT (NVL(MAX(PNO),0)+1) FROM MAP),?,?,?,?,?)";
	private String UPDATE="UPDATE MAP SET LAT=?, LNG=?, LOCATION=?, IMGNAME=? WHERE PNO=?";
	private String DELETE="DELETE FROM MAP WHERE PNO=?";
	private String GETMAP="SELECT * FROM MAP WHERE PNO=?";
	private String GETMAPLIST="SELECT * FROM MAP WHERE MID=?";
	
	@Autowired
	JdbcTemplate jt;
	
	public void insertMAP(MapVO vo) {
		jt.update(INSERT, vo.getLat(), vo.getLng(),vo.getLocation(),vo.getMid(),vo.getImgname());
	}
	
	public void deleteMAP(MapVO vo) {
		jt.update(DELETE, vo.getPno());
	}
	
	public void updateMAP(MapVO vo) {
		jt.update(UPDATE, vo.getLat(), vo.getLng(), vo.getLocation(), vo.getPno());
	}
	
	public MapVO getMap(MapVO vo) {
		Object[] args= {vo.getPno()};
		return jt.queryForObject(GETMAP, args, new MapRowMapper());
	}
	
	public List<MapVO> getMapList(MapVO vo) {
		Object[] args= {vo.getMid()};
		return jt.query(GETMAPLIST, args, new MapRowMapper());
	}
}
