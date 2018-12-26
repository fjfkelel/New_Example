<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@include file="/WEB-INF/views/common1.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">

    <script src="jquery-1.11.0.min.js" type="text/javascript"></script>
    
<script>
   
      //***********************************************************
      // 행 추가하는 함수 선언
      //***********************************************************
      function addTR( classN ){
         try{
            //---------------
            // checkbox 와 radio 입력 양식을 가르키는 [선택자 문자열] 저장.
            // checkbox 와 radio 입력 양식을 제외한 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
            // 모든 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
            //---------------
            var cr_selector = "[type=checkbox],[type=radio]";
            var not_cr_selector = "select,textarea,[type=text],[type=password],[type=hidden],[type=file]"
            var all_selector = cr_selector + "," +not_cr_selector;
            //---------------
            // 매개변수로 들어온 선택자가 가르키는 태그를 관리하는 JQuery 객체 생성.
            // 매개변수로 들어온 선택자가 가르키는 태그 중 마지막 놈을 관리하는 JQuery 객체 생성.
            //---------------
            var obj = $("."+classN);
            var lastObj = obj.last( );
            //---------------
            // 매개변수로 들어온 선택자가 가르키는 태그 내부의 입력 양식에 입력된 데이터 개수 누적하기
            //---------------
            var dataCnt = 0; var flag = true;
            lastObj.find( cr_selector+ ", "+not_cr_selector ).each( function(){
                  if( flag == false) { return; }
                  // i번째 입력양식을 관리하는 JQuery 객체를 생성해서 저장
                  var thisObj = $(this);
                  var nameV = thisObj.attr("name");
                  if( nameV.indexOf("[")<0 || nameV.indexOf("]")<0 ) {
                     alert( "1행의 [" + nameV+"] 라는 입력양식의 이름에는 [i]가 있어야 합니다."); flag = false;
                  }
                  else{
                     // i번째 입력양식이 checkbox 또는 radio 면
                     if( thisObj.is(":radio") || thisObj.is(":checkbox") ){
                        if( thisObj.filter(":checked").length>0){ dataCnt++;  }
                     }
                     // i번째 입력양식이 checkbox 도 아니고 radio 도 아니면
                     else{
                        // i번째 입력양식의 입력값이 있으면 dataCnt 변수안에 1증가
                        var val = thisObj.val( );
                        if( val.split(" ").join("")!="" ){ dataCnt++; }
                     }
                  }
            })
            if( flag == false) { return; }
            //---------------
            // 매개변수로 들어온 선택자가 가르키는 태그 내부의 입력 양식에 입력된 데이터 개수가 0개면 함수중단하기
            //---------------
            if(dataCnt<=3 ) { alert("마지막 행에 테이터가 비어있어 행 추가 불가능!"); return; }
            //---------------
            // 마지막 행 복사해 마지막 다음에 삽입하기
            // 삽입한 행의 입력 양식에 데이터 비우기
            //---------------
            lastObj.after( lastObj.clone() );
            var lastObj = lastObj.next( );
            lastObj.find(cr_selector).attr("checked",false)
            lastObj.find(not_cr_selector).val("")
            //---------------
            // 매개변수로 들어온 선택자가 가르키는 모든 태그 내부의 입력 양식의 name 속성값의 중간에 [i] 삽입하기
            //---------------
            obj = $("."+classN);
            obj.each( function(i){
                  var obj3 = $(this).find(all_selector);
                  obj3.each( function(){
                     var thisObj = $(this);
                     var nameV = thisObj.attr("name");
                     //-----
                     var arr1  = nameV.split("[");
                     var arr2  = arr1[1].split("]");
                     nameV = arr1[0] + "["+(i)+"]" +arr2[1];
                     thisObj.attr( "name",  nameV   );
                  })
            });
            //---------------
            // name 값 출력하기. 추후 주석 처리할 것
            //---------------
            print_nameV( classN );
         }catch(e){
            alert("addTR(~) 함수 호출 시 에러 발생!");
         }
      }
      //***********************************************************
      // 행 삭제하는 함수 선언
      //***********************************************************
      function delLastTR( classN ){
         try{
            //---------------
            // checkbox 와 radio 입력 양식을 가르키는 [선택자 문자열] 저장.
            // checkbox 와 radio 입력 양식을 제외한 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
            // 모든 입력 양식 태그를 가르키는 [선택자 문자열] 저장.
            //---------------
            var cr_selector = "[type=checkbox],[type=radio]";
            var not_cr_selector = "select,textarea,[type=text],[type=password],[type=hidden],[type=file]";
            var all_selector = cr_selector + "," +not_cr_selector;
            //---------------
            // 매개변수로 들어온 선택자가 가르키는 태그를 관리하는 JQuery 객체 생성.
            // 매개변수로 들어온 선택자가 가르키는 태그가 1개면 함수 중단.
            //---------------
            var obj = $("."+classN);
            if( obj.length==1 ) { return; }
            //---------------
            // 매개변수로 들어온 선택자가 가르키는 태그 중 마지막 놈을 관리하는 JQuery 객체 생성.
            // 매개변수로 들어온 선택자가 가르키는 태그 중 마지막 놈을 삭제하기.
            //---------------
            var lastObj = obj.last( );
            if( confirm("정말 삭제하시겠습니까?")==false ) { return; }
            lastObj.remove();
            //---------------
            // name 값 출력하기. 주석 처리할 것
            //---------------
            print_nameV( classN )
         }catch(e){
            alert("delLastTR(~) 함수 호출 시 에러 발생!");
         }
      }
      //***********************************************************
      // 행 안의 입력 양식의 name 출력하는 함수 선언
      //***********************************************************
      function print_nameV( classN ){
         try{
            $(".xxxxx").remove();
            $("body").append("<center><div class=xxxxx></div></center>");
            var xxxxxObj = $(".xxxxx");
            var cr_selector = "[type=checkbox],[type=radio]";
            var not_cr_selector = "select,textarea,[type=text],[type=password],[type=hidden],[type=file]";
            var all_selector = cr_selector + "," +not_cr_selector;
            obj = $("."+classN);
            xxxxxObj.html(" ");
            var htmls = [];
            obj.each( function(i){
                  var obj3 = $(this).find(all_selector);
                  obj3.each( function(){
                     var thisObj = $(this); var nameV = thisObj.attr("name");
                     htmls.push( nameV + " / " );
                  })
                  htmls.push("<br>");
            });
         xxxxxObj.append( htmls.join("") );
         }catch(e){
            alert("print_nameV(~) 함수 호출 시 에러 발생!");
         }
      }
      

         function regCompanyNameFormCheck( ){
        //---------------------------------------
         // 회사명 유효성 체크
         //---------------------------------------
          var regCompanyNameFormObj = $("[name=approval_id_reg_form]");
          var company_name = regCompanyNameFormObj.find("[name=company_name]").val( );  
            if ( company_name=="" )
            {
               alert("회사명을 입력해주세요.");
               return;
            }
         //---------------------------------------
         // 결재종류 유효성 체크
         //---------------------------------------
           var company_reportCnt = regCompanyNameFormObj.find("[name=report_field]").filter(":checked").length;
            if( company_reportCnt==0 ){
            //결재 개수가 0개이면 경고창 띄우기
               alert( "결재종류는 한 개 이상 선택해주세요.");
                  return;
            }
            
            for ( var i=0 ; i<$(".xxx").length ; i++ ){

               //---------------------------------------
                   //결재자명 유효성 체크
                   //---------------------------------------
                  var emp_name = $("[name='joinList["+i+"].emp_name']").val( );
                       //결재자명이 한글, 영어가 아니면 경고하고 칸 비우고 종료
                   if( new RegExp( /^[가-힣a-zA-Z]{2,20}$/).test(emp_name)==false ){
                       alert( "결재자명은 공백 없이 한글또는 영어로 입력해주세요.");
                       //regCompanyNameFormObj.find("[name='approver_name[0]']").val( "" );
                       return;
                    }



                //---------------------------------------
                   //직급 유효성 체크
                   //---------------------------------------
                  var jikup = $("[name='joinList["+i+"].jikup']").val( );
                  if (jikup==""){
                     alert("직급을 선택해주세요."); 
                     return;
                  }





                 //---------------------------------------
                   //아이디 유효성 체크
                   //---------------------------------------
                     var emp_id = $("[name='joinList["+i+"].id']").val( );
                        //------------------------------------------------------------------------
                        //RegExp 객체를 생성
                        //------------------------------------------------------------------------
                        var regExp = new RegExp(/^[가-힣a-zA-Z]{2,20}$/);
                       
                        //------------------------------------------------------------------------
                        //RegExp 객체의 test 메소드를 호출하여 아이디의 패턴을 검사한다.
                        //아이디 패턴이 틀릴 경우 경고하고 함수는 중단.
                        //------------------------------------------------------------------------
                        if (emp_id=="") {
                        alert("[아이디]입력란은 공백일 수 없습니다");
                           //함수 종료
                           return;
                        }
                         
                         if( new RegExp(/^[가-힣a-zA-Z0-9]{5,20}$/).test(emp_id)==false  ){
                           alert("[아이디]는 공백없이 한글, 영어 소대문자, 숫자로 이루어진5~20자 이내여야 합니다..");
                           //함수 종료
                           return;
                        }
                         
                           
                    //---------------------------------------
                    //암호 유효성 체크
                    //---------------------------------------
                     var emp_pwd = $("[name='joinList["+i+"].pwd']").val( );
                     var regExp = new RegExp(/^[가-힣a-zA-Z0-9]{2,20}$/);
                    
                     if (emp_pwd=="") {
                           alert("[암호]입력란은 공백일 수 없습니다");
                              //함수 종료
                              return;
                           }
                     
                     if( new RegExp(/^[가-힣a-zA-Z0-9]{7,20}$/).test(emp_pwd)==false  ){
                           alert("[암호]는 공백없이 한글, 영어 소대문자, 숫자로 이루어진 7~20자 이내여야 합니다.");
                           //함수 종료
                           return;
                        }
            
            }
                
               $.ajax({
                     url : "/pro/approval_id_reg_Proc.do"
                     ,type : "post"
                     ,data : $("form").filter("[name=approval_id_reg_form]").serialize()
                     ,success : function( company_reportCnt ){
                        if(company_reportCnt==$(".xxx").length+1+$("[type=checkbox]").filter(":checked").length){
                           alert("★회원가입 성공!★");
                            location.replace("/pro/loginForm.do");
                        }
                        else if(company_reportCnt==-2){
                        	alert("이미 존재하는 아이디 입니다.");
                        	return;
                        }
                        else{
                           alert("회원가입 실패!")
                           location.replace("/pro/loginForm.do");
                        }
                     } 
                     // ------------------
                     // 서버의 응답을 못 받았을 경우 실행할 익명함수 설정.
                     // ------------------
                     ,error : function(  ){
                        alert("서버접속 실패! 관리자에게 문의 바람!");
                     }
               });
              
                    
            
            
            
         }
            
             
             
       
   </script>
</head>
<!--==============================================================================-->


 </HEAD>

   <style>
   
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
      }


    
      div {
      font-size: 12pt;
      font-family: tahoma, 돋움, verdana;
      }

   </style>


 <body> <BR><BR><BR>
<center> 
<div>
[회원 가입]
</div><center>


    <tbody id="text_table">
 <form name="approval_id_reg_form" action="/pro/approval_id_reg_Proc.do"> <br>
  <TABLE class="tbcss2" style="margin-left: auto; margin-right: auto;">
  <TR>
   <TD bgcolor="DCDCDC"> 1. 회사명 </TD>
   <TD> <input type="text" name="company_name"> </TD>
  </TR>
  <TR>
   <TD bgcolor="DCDCDC"> 2. 결재 종류 </TD>
   <TD> 
   <input type="checkbox" name="report_field" value="1">지출 보고서&nbsp; 
      <input type="checkbox" name="report_field" value="2">영업 보고서&nbsp;
      <input type="checkbox" name="report_field" value="3">주간 업무 보고서&nbsp;
      <input type="checkbox" name="report_field" value="4">일일 업무 보고서&nbsp;

   </TD>
  </TR>
  <TR>
   <TD bgcolor="DCDCDC"> 3. 결재 라인 </TD>
   <TD><form name="myForm">
      <TABLE id="report_line" class="tbcss2">
   <TR align="center">
      <TD bgcolor="DCDCDC" >차수</TD>
      <TD bgcolor="DCDCDC">결재자명</TD>
      <TD bgcolor="DCDCDC">직급</TD>
      <TD bgcolor="DCDCDC">아이디</TD>
      <TD bgcolor="DCDCDC">암호</TD>
   </TR>
   <TR class=xxx>
      <TD> 1차 </TD>
      <TD><input type="text" name="joinList[0].emp_name"></TD>
      <TD><select name="joinList[0].jikup">
               <option value=""> 　 </option>
               <option value="1"> 사원 </option>
               <option value="2"> 주임 </option>
               <option value="3"> 대리 </option>
               <option value="4"> 과장 </option>
               <option value="5"> 팀장 </option>
               <option value="6"> 부장 </option>
               <option value="7"> 상무 </option>
               <option value="8"> 전무 </option>
               <option value="9"> 사장 </option>
               </select>
      </TD>
      <TD><input type="text" name="joinList[0].id"></TD>
      <TD><input type="password" name="joinList[0].pwd"></TD>
   </TR>
         <div style="height:20px"></div>   


</TABLE>
<div style="height:20px"></div>   
<center><input type="button" value="행추가"  onclick="addTR( 'xxx' );">
      <input type="button" value="행삭제"  onclick="delLastTR( 'xxx' );"></center>
</TABLE>
   
</body>
<div style="height:5px"></div>   
 <TABLE align="center">   
      <center>
      <input type="button" style="cursor:pointer" onclick="regCompanyNameFormCheck( )" value="등록" >&nbsp&nbsp
      <input type="reset" value="초기화">&nbsp&nbsp
     <input type="button" style="cursor:pointer" onclick="location.replace('/pro/loginForm.do')" value="로그인 화면으로" >
      </center>
      </TABLE>
</form>


   

</HTML>
