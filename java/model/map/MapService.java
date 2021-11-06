package model.map;

import java.util.List;

public interface MapService {
	void insertMAP(MapVO vo);
	void deleteMAP(MapVO vo);
	void updateMAP(MapVO vo);
	MapVO getMap(MapVO vo);
	List<MapVO> getMapList(MapVO vo);
}
