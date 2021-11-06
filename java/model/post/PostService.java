package model.post;

import java.util.List;

public interface PostService {
	void insertP(PostVO vo);
	void updateP(PostVO vo);
	void deleteP(PostVO vo);
	PostVO getP(PostVO vo);
	List<PostVO> getPlist(PostVO vo);
	int getTotalCount(PostVO vo);
	List<PostVO> getPList(PostVO vo, int startRow, int endRow);
}
