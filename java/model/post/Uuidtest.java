package model.post;

import java.util.UUID;

import model.member.MemberVO;

public class Uuidtest {

	public static void main(String[] args) {
		UUID uuid=UUID.randomUUID();
		System.out.println(uuid);
		String rand=uuid.toString().replace("-", "").substring(24);
		String rr="hello.jpg";
		String e=rand+"_"+rr;
		System.out.println(e);
		//System.out.println(rand.substring(24));
		
		
		String t="하이";
		if(1>0) {
			t="바이";
		}
		System.out.println(t);
		
		MemberVO vo=new MemberVO();
		vo.setMid("ff");
		
		
		System.out.println(vo);
		
		if(vo.getMpw()!=null) {
			
			System.out.println("null 아님!");
		} else {
			
		}
		
		
	}
	
}
