package model.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("PostService")
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDAO dao;
	
	@Override
	public void insertP(PostVO vo) {
		dao.insertP(vo);
	}

	@Override
	public void updateP(PostVO vo) {
		dao.updateP(vo);
	}

	@Override
	public void deleteP(PostVO vo) {
		dao.deleteP(vo);
	}

	@Override
	public PostVO getP(PostVO vo) {
		return dao.getP(vo);
	}

	@Override
	public List<PostVO> getPlist(PostVO vo) {
		return dao.getPlist(vo);
	}

	@Override
	public int getTotalCount(PostVO vo) {
		return dao.getTotalCount(vo);
	}

	@Override
	public List<PostVO> getPList(PostVO vo, int startRow, int endRow) {
		return dao.getPList(vo, startRow, endRow);
	}

}
