function sendmail() {
   window.open("newpw.jsp", "", "width=800, height=550, resizable=no, scrollbars=no, status=no");
}
// "LogIn" ID & PW Check ajax ===========================================================
function login(){
	var mid = $('#mid').val();
	var mpw = $('#mpw').val();
	   console.log(mid);
	   console.log(mpw);
	   $.ajax({
	      type: 'POST',
	      url: "login.do",
	      data: "mid="+mid+"&mpw="+mpw,
	      success: function(data) {
	         console.log(data);

	         if(mid=="" || mpw==""){
	        	 alert("아이디와 비밀번호를 입력하세요!");
	        	 return false;
	         }
	         
	         //아이디 유효성검사 
	         else if (data == 'id') {
	            alert("ID를 확인하세요!");
	            $("#mid").val("");
	            $("#mpw").val("");
	            $("#mid").focus();
	         }
	         else if (data == 'password') {
	        	 alert("Password를 확인하세요!");
	            $('#mpw').val('');
	            $("#mpw").focus();
	         }
	         else {
	            window.location.href='login.do?mid='+mid+'&mpw='+mpw;
	         }
	      },
	      error: function(data){
	    	  alert(data);
	      }
	   })
	}
	


// "SignUp" ID Check ajax =================================================================
function checkID() {
   var mid = $('#mid').val();
   console.log(mid);
   $.ajax({
      type: 'GET',
      url: "checkID.do",
      data: "mid="+mid,
      success: function(data) {
         console.log(data);

         $("#impossible").hide();
         $("#possible").hide();
         $("#inputID").hide();

         var idRegExp = /^[a-zA-z0-9]{4,8}$/; //아이디 유효성 검사

         //아이디 유효성검사 
         if (!idRegExp.test($("#mid").val())) {
            //alert("ajax_아이디는 영문 대소문자와 숫자 4~8자리로 입력해야합니다!");
            $("#mid").val("");
            $("#mid").focus();
            $("#impossible").text("Available 4~8 characters including a number and a letter.").show();
         }
         else if (data == 'fail') {
            $('#mid').val('');
            $("#mid").focus();
            $("#impossible").show();
            $("#possible").hide();
         }
         else {
            if ($('#mid').val() == "") {
               $("#impossible").text("ID를 입력하세요.").hide();
               $("#possible").hide();
            }
            else {
               $("#impossible").hide();
               $("#possible").show();
            }
         }
      },
      error: function(data){
    	  alert(data);
      }
   })
}

// "SignUP" PW Check ===========================================================
function checkPW(){
	var mpw = $('#mpw').val();
	 console.log(mpw);
	 
	 $("#i").hide();
     $("#p").hide();
	 
	 //var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,10}$/;
	 var pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,10}$/;

     if (!pwdCheck.test(mpw)) { // 비밀번호 유효성 검사
        //alert("비밀번호는 영문자+숫자+특수문자 조합으로 6~10자리 사용해야합니다.");
    	$("#mpw").focus();
        $("#i").show();
        $("#p").hide();
     } else {
    	 //$("#mpw2").focus();
    	 $("#i").hide();
         $("#p").show();
     }
	 
}

// "SignUP" PW Double Check ===========================================================
function comparePW(){
	 var mpw = $('#mpw').val();
	 var mpw2 = $('#mpw2').val();
	 console.log(mpw+", "+mpw2);
	 
	 $("#imposs").hide();
     $("#poss").hide();
	 
	 if(mpw==""){
		 $('#mpw2').val('');
         $("#mpw").focus();
         $("#imposs").text("password를 먼저 입력하세요.").show();
         $("#poss").hide();
	 } else if(mpw!=mpw2){
		 $('#mpw2').val('');
		 $("#mpw2").focus();
		 $("#imposs").show();
         $("#poss").hide();
	 } else if(mpw==mpw2) {
		 $("#imposs").hide();
         $("#poss").show();
	 }
	 
}
// "SignUP" EMAIL Check ajax ===========================================================
function checkEmail(){
	var email = $('#email').val();
	console.log(email);
	$.ajax({
		type: 'GET',
		url: "checkEmail.do",
		data: "email="+email,
		success: function(data) {
			console.log(data);

			$("#iEmail").hide();
			$("#pEmail").hide();

			var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							// /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/
			if (!emailRegExp.test(email)) {
				//alert("올바른 Email 형식이 아닙니다.");
				$("#email").focus();
				$("#iEmail").text('이메일 형식에 맞게 입력하세요.').show();
				$("#pEmail").hide();
			} else if(data=='fail') {
				$("#email").focus();
				$("#iEmail").show();
				$("#pEmail").hide();
			} else{
				$("#iEmail").hide();
				$("#pEmail").show();
			}
		}
	})
}

//"newPW" EMAIL Check ajax ===========================================================
function getemail(){
	var mid = $('#mid').val();
	var email = $('#email').val();
	   console.log(mid);
	   console.log(email);
	   $.ajax({
	      type: 'POST',
	      url: "sendmail.do",
	      data: "mid="+mid+"&email="+email,
	      success: function(data) {
	         console.log(data);

	         if(email=="" || mid==""){
	        	 alert("아이디와 이메일을 입력하세요!");
	        	 return false;
	         }
	         
	         //아이디 유효성검사 
	         else if (data == 'id') {
	            alert("존재하는 아이디가 없습니다!");
	            $("#mid").val("");
	            $("#email").val("");
	            $("#mid").focus();
	         }
	         else if (data == 'email') {
	        	 alert("등록되어 있는 이메일이 아닙니다!");
	            $('#email').val('');
	            $("#email").focus();
	         }
	         else {
	            window.location.href='sendmail.do?mid='+mid+'&email='+email;
	            //window.close('newpw.jsp');
	         }
	      }
	   })
}

/*
//회원가입 유효성 검사==========================================================================================================================
var btn = document.querySelector('#confirm');
if (btn != null)
   btn.onclick = function() {
      console.log("2");
      var uid = document.getElementById("uid");
      //var idDuplication = document.getElementById("idDuplication");
      var pwd = document.getElementById("pwd");
      var repwd = document.getElementById("repwd");
      var str_email01 = document.getElementById("str_email01");
      var mname = document.getElementById("mname");
      var agree = $("input:checkbox[name='agree']").is(":checked");


      var address_kakao = document.getElementById("address_kakao");
      var address_detail = document.getElementById("address_detail");



      if (uid.value == "") {
         alert("아이디를 입력하세요.");
         uid.focus();
         return false;
      }

      var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사

      if (!idRegExp.test(uid.value)) {
         alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
         uid.focus();
         return false;
      }



      if (!$(".passId").is(":visible")) {
         alert("아이디 중복확인하시기 바랍니다.");
         document.getElementById("uid").focus();
         return false;
      }

      if (pwd.value == "") {
         alert("비밀번호를 입력하세요.");
         pwd.focus();
         return false;
      }

      var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

      if (!pwdCheck.test(pwd.value)) { // 비밀번호 유효성 검사
         alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야합니다.");
         pwd.focus();
         return false;
      }

      if (repwd.value !== pwd.value) { // 비밀번호 재확인 검사
         alert("비밀번호가 일치하지 않습니다.");
         repwd.focus();
         return false;
      }

      if (mname.value == "") {
         alert("닉네임을 입력하세요.");
         mname.focus();
         return false;
      }

      if (str_email01.value == "") {
         alert("이메일을 입력하세요.");
         str_email01.focus();
         return false;
      }

      var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      // ->  / / 안에 있는 내용은 정규표현식 검증에 사용되는 패턴이 이 안에 위치함
      // ->  / /i 정규표현식에 사용된 패턴이 대소문자를 구분하지 않도록 i를 사용함
      // ->  ^ 표시는 처음시작하는 부분부터 일치한다는 표시임
      // ->  [0-9a-zA-Z] 하나의 문자가 []안에 위치한 규칙을 따른다는 것으로 숫자와 알파벳 소문지 대문자인 경우를 뜻 함
      // ->  * 이 기호는 0또는 그 이상의 문자가 연속될 수 있음을 말함
      if (!emailRegExp.test(str_email01.value)) {
         alert("이메일 주소 확인 후 다시 작성하시기 바랍니다.");
         str_email01.focus();
         return false;
      }

      if (address_kakao.value == "") {
         alert("주소를 입력하세요.");
         address_kakao.focus();
         return false;
      }

      if (address_detail.value == "") {
         alert("상세주소를 입력하세요.");
         address_detail.focus();
         return false;
      }


      if (!agree) {
         alert("약관 동의를 체크하세요.");
         $('#demo-human').focus();  // 해당 체크박스로 포커스 이동.
         return false;
      }

      else {
         alert("회원가입이 완료되었습니다.");
         return true;
      }
   };
//우편번호 주소 등록==========================================================================================================================
   function searchPostCode(){new daum.Postcode({
		oncomplete: function(data){
	        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	       // roadAddress = data.roadAddress; // 도로명 주소 변수
	        var extraRoadAddr = ''; // 참고 항목 변수

	        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	            extraRoadAddr += data.bname;
	        }
	        // 건물명이 있고, 공동주택일 경우 추가한다.
	        if(data.buildingName !== '' && data.apartment === 'Y'){
	           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	        }
	        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	        if(extraRoadAddr !== ''){
	            extraRoadAddr = ' (' + extraRoadAddr + ')';
	        }
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        postcode.value = data.zonecode;
	        roadAddress.value = data.roadAddress;
	       // jibunAddress.value = data.jibunAddress;
	          
	        autoClose: true; // 선택하면 팝업창이 자동으로 닫힌다.     
	         
	        var detailAddress = document.getElementById("detailAddress");
	        detailAddress.focus(); // 팝업창이 닫히면 상세주소 란으로 포커싱 
		}
	}).open();}*/