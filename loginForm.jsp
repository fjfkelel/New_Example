<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@include file="/WEB-INF/views/common1.jsp"%>

<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>

   

  <script>
 // $(document).ready(function(){
   //$("[name=company_id]").val("abc");
   //$("[name=company_pwd]").val("123");
   //$("[name=CompanyloginForm] .login").click(function(){
   //   checkLoginForm();
   //})
function checkCompanyLoginForm(){
      
   var company_id = $("[name=id]").val();
   var pwd = $("[name=pwd]").val();
   
   if( company_id.split(" ").join("")==""){
       alert("아이디 입력 요망");
       $("[name=id]").val("");
       return;
   }
   
   if( pwd.split(" ").join()==""){
       $("[name=pwd]").val("");
       alert("암호 입력 요망");
       return;
   }
   
   $.ajax({
      url : "/pro/loginProc.do"
      , type : "post"
      , data : $("form").filter("[name=login_Form]").serialize()
      , dataType : "json"
      , success : function( company_idCnt ){
         if( company_idCnt=="1" ){
            location.replace("/pro/expenseList.do");
         }
         else if( company_idCnt.equals("0") ){
            alert("아이디 암호가 틀립니다");
            $(".id").val("");
            $(".id").focus();
         }
         else{
            alert("관리자에게 문의 바람");
         }           
      }
      , error : function(){
         alert("서버 접속 실패!");
      }
   });
}
        
        
        
  </script>
 </HEAD>

<style>
    
   div {
             font-size: 12pt;
         font-family: tahoma, 돋움, verdana;
    }
   </style>

   <style>
   :active { border-style: outset;}

   button {
     background: none;
     color: black;
     text-align: center;
     font-size: 9pt;
     outline: none;
     border: 0;
   }
   button:active {
     border-style: outset;
   }


     .tbcss1, .tbcss1 td, .tbcss1 th
     {   
         
         font-size: 9pt;
         font-family: tahoma, verdana;
         
      }

      .tbcss2, .tbcss2 td, .tbcss2 th
      {
         border-collapse: collapse;
         border-top: 1px solid black;
         border-bottom: 1px solid black;
         border-left: 1px solid black;
         border-right: 1px solid black;
         
         padding: 10;
         font-size: 9pt;
         font-family: tahoma, 굴림, 돋움, verdana;
         width: 300px;


      }

   </style>

 <BODY>
 <BR><BR><BR>
<center> 
<div>
[로그인]
</div><BR>

<form name="login_Form" method="post" action="/pro/loginProc.do">
   <TABLE class="tbcss2" style="margin-left: auto; margin-right: auto;">
   <TR>
      <TD align="center" bgcolor="DCDCDC">아이디</TD>
      <TD align="center"><input type="text" name="id" style="width:180px;"></TD>
   </TR>
   <TR>
      <TD align="center" bgcolor="DCDCDC">암호</TD>
      <TD align="center"><input type="password" name="pwd" style="width:180px;"></TD>
   </TR>
   </TABLE>
   <div style="height:7px"></div>
   <center><button style="cursor:pointer" onclick="checkCompanyLoginForm( )">[로그인]</button>
   <button style="cursor:pointer" onclick="location.replace('/pro/approval_id_reg_form.do')">[회원가입]</button>
   <br><br><br>
   테스트 아이디는 aaaaaaaaaaa <br>
   테스트 암호는 12345678 입니다.
</form>
 </BODY>
</HTML>
</html>