package controller;

import java.io.File;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.member.MemberService;
import model.member.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/gologin.do")
	public String gologin() {
		return "login.jsp";
	}
	
	// check for LogIn
	@ResponseBody
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String logincheck(MemberVO vo, Model model) throws Exception {
		String alert=null;
		//System.out.println("받은 아이디: "+vo.getMid());
		//System.out.println("받은 비번: "+vo.getMpw());
		if(ms.getM(vo)!=null) { // 아이디가 일치하는 경우
			if(vo.getMpw().equals(ms.getM(vo).getMpw())) { // password도 일치하는 경우
				alert="success";
			}
			else { // password 틀림
				alert="password";
			}
		} else { // ID 틀림
			alert="id";
		}
		// model.addAttribute("alert", alert);
		System.out.println("로그인 성공? "+alert);
		return alert;
	}
	
	// Real LogIn
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login(HttpSession session, MemberVO vo, Model model) throws Exception {
		session.setAttribute("mem", ms.getM(vo));
		session.setAttribute("mid", vo.getMid());
		
		return "redirect:main.do";
	}
	
	// Log Out
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:login.jsp";
	}
	
	// C
	// jt.update(INSERTM, vo.getMid(), vo.getMpw(), vo.getMname(), vo.getEmail(), DEFAULT);
	@RequestMapping("/signup.do")
	public String signup(MemberVO vo, Model model) throws Exception{
		
		ms.insertM(vo);
		
		return "redirect:login.jsp";
	}
	
	// U - 회원정보 수정
	@RequestMapping(value="/mypage.do", method=RequestMethod.POST)
	public String updateM(HttpSession session, MemberVO vo, Model model) throws Exception {
		//UPDATE MEMBER SET MPW=?, MNAME=?, PROFILE=? WHERE MID=?
		MultipartFile img=vo.getProimg();
		if(!img.isEmpty()) {
			UUID uuid=UUID.randomUUID();
			String rand=uuid.toString().replace("-", "").substring(24);
			String imgName=rand+"_"+img.getOriginalFilename();
			
			// 1. 학원  2. 집
			//img.transferTo(new File("D:\\JIN_0622\\test\\profile\\"+imgName));
			img.transferTo(new File("C:\\code_0622\\test\\profile\\"+imgName));
			vo.setProfile("\\profile\\"+imgName);
		} else { // 이미지를 올리지 않은 경우, 원래 이미지로 설정
			vo.setProfile(ms.getM(vo).getProfile());
		}
		ms.updateM(vo);
		session.setAttribute("mem",ms.getM(vo));
		return "redirect:main.do";
	}
	
	// check ID for Sign Up
	@ResponseBody
	@RequestMapping(value="/checkID.do", method=RequestMethod.GET)
	public String checkID(MemberVO vo, Model model) throws Exception {
		String res="";
		System.out.println("아이디중복체크!! : "+vo.getMid());
		if(ms.getM(vo)!=null) {
			res="fail";
		} else {
			res="success";
		}
		System.out.println(res);
		return res;
	}
	
	// check Email for Sign Up
	@ResponseBody
	@RequestMapping(value="/checkEmail.do", method=RequestMethod.GET)
	public String checkEmail(MemberVO vo, Model model) throws Exception {
		String res="";
		System.out.println("email 중복체크!! : "+vo.getEmail());
		if(ms.getM(vo)!=null) {
			res="fail";
		} else {
			res="success";
		}
		System.out.println(res);
		return res;
	}
	
	// D - 회원 탈퇴
	@RequestMapping("/quit.do")
	public String quitM(HttpSession session, MemberVO vo) throws Exception {
		
		ms.deleteM(vo);
		
		return "redirect:logout.do";
	}
	
	// ID & email 체크 for new Password
	@ResponseBody
	@RequestMapping(value="/sendmail.do", method=RequestMethod.POST)
	public String getemail(MemberVO vo) throws Exception {
		String alert=null;
		System.out.println("받은 아이디: "+vo.getMid());
		System.out.println("받은 이메일: "+vo.getEmail());
		if(ms.getM(vo)!=null) { // ID가 일치하는 경우
			if(vo.getEmail().equals(ms.getM(vo).getEmail())) { // email도 일치하는 경우
				alert="success";
			}
			else { // email 틀림
				alert="email";
			}
		} else { // ID 틀림
			alert="id";
		}
		// model.addAttribute("alert", alert);
		System.out.println("받은 정보랑 일치? "+alert);
		return alert;
	}
	
	// SMTP - 임시비밀번호 보내고 설정!
	@ResponseBody
	@RequestMapping(value = "/sendmail.do", method = RequestMethod.GET)
    public String sendMail(MemberVO vo, Model model) throws Exception{
        System.out.println("들어옴?");
        String res="fail";
        
		UUID uuid=UUID.randomUUID();
		String rand=uuid.toString().replace("-", "").substring(26);
		vo.setMpw(rand);
		System.out.println("설정한 임시 비밀번호: "+vo.getMpw());
		
        String subject = "wanderlust☁ : "+vo.getMid()+"님의 임시비밀번호입니다.";
        String content = "<div><img alt='logo' src='images/wand.png' style='width:40%;'><br>"+
        					"<p>〰〰〰〰☁WANDERLUST☁〰〰〰〰</p>"+
        					"<p>&ensp;&ensp;임시 비밀번호: "+rand+"</p>"+
        					"<p>〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰</p>";
        String from = "wanderlust <doingjinn@gmail.com>";
        String to = vo.getEmail();
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
             // 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             // MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
            
             // 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             
            mailSender.send(mail);
            ms.updatePW(vo);
            System.out.println("성공!");
            res="<script>alert('sent successfully!');window.close();</script>";
            
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("에러!");
            res="<script>alert('failed to send..');window.close();</script>";
        }
        
        return res;
    }
	
}
