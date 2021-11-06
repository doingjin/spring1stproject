package model.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MapService")
public class MapServiceImpl implements MapService {
	
	@Autowired
	private MapDAO dao;

	@Override
	public void insertMAP(MapVO vo) {
		dao.insertMAP(vo);
	}

	@Override
	public void deleteMAP(MapVO vo) {
		dao.deleteMAP(vo);
	}

	@Override
	public void updateMAP(MapVO vo) {
		dao.updateMAP(vo);
	}

	@Override
	public MapVO getMap(MapVO vo) {
		return dao.getMap(vo);
	}

	@Override
	public List<MapVO> getMapList(MapVO vo) {
		return dao.getMapList(vo);
	}
	
	
	
}
