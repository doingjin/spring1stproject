package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.map.MapService;
import model.map.MapVO;
import net.sf.json.JSONArray;

@Controller
public class MapController {
	
	@Autowired
	MapService ms;
	
	@RequestMapping("/mmap.do")
	public String getMapList(HttpSession session, MapVO vo, Model model) throws Exception {
		System.out.println("session: "+session.getAttribute("mid"));
		vo.setMid((String)session.getAttribute("mid"));
		List<MapVO> datas=ms.getMapList(vo);
		model.addAttribute("datas", datas);
		model.addAttribute("list", JSONArray.fromObject(datas));
		return "map.jsp";
	}
	
	@RequestMapping("/insertMap.do")
	public String insertMap(HttpServletRequest request,MapVO mvo, Model model) throws Exception {
		System.out.println("insertMap.do 안의 vo: "+mvo);
		
		//System.out.println(model);
		System.out.println(request.getAttribute("imgname"));
		//System.out.println(request.getParameter("imgname"));
		
		mvo.setImgname((String)request.getAttribute("imgname"));
		System.out.println(mvo.getImgname());
		ms.insertMAP(mvo);
		return "redirect:main.do";
	}
	
	@RequestMapping("/deleteMap.do")
	public String deleteMap(MapVO vo) throws Exception {
		// 이로직 필요 XX - pno가 foreign key여서 글 지워지면 자동 삭제!
		System.out.println("deleteMap.do안의 pno: "+vo.getPno());
		ms.deleteMAP(vo);
		return "redirect:main.do";
	}
	
	
	
}
