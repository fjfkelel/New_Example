<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@include file="/WEB-INF/views/common2.jsp"%>
<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
 </HEAD>

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



      .tbcss1, .tbcss1 td, .tbcss1 th{
      border-collapse: collapse; 
      border: 1px solid black;
      padding: 10;
      font-size: 9pt;
      font-family: tahoma, 굴림, 돋움, verdana;
         
      }
      
      .tbcss2, .tbcss2 td, .tbcss2 th
      {
         
         font-size: 9pt;
         font-family: tahoma, 굴림, 돋움, verdana;

      }

   </style>

   <script src="jquery-1.11.0.min.js" type="text/javascript"></script>

   <script>
   
   function getWeek (num) {

      var week = ["일","월","화","수","목","금","토"]
      return week[num];

   };

   </script>

   



   <script>

      $(document).ready(function(){


      // [오늘로] 글씨를 클릭하면 실행할 구문 설정
          var expense_report_FormObj = $("[name=expense_report_registry]");


         expense_report_FormObj.find(".to_today").click(function(){
               
               // 현재 날짜를 관리하는 Date 객체 생성해서 객체의 메위주를 today라는 변수에 저장.
               // 월을 세팅할 땐 1을 빼고, 월을 얻을 땐 1을 더하자. ex) 2월을 세팅할 땐, 1월로 집어넣기
               // n월의 마지막날을 얻고 싶으면 n월 0일을 세팅
               var today = new Date(  );
               // 현재 날짜의 년도 얻기
               var year = today.getFullYear();
               // 현재 날짜의 월 얻기. 주의> 월을 얻고 나서 1을 더할 것
               var month = today.getMonth()+1;
               var date = today.getDate();
               var day = getWeek( today.getDay() );
               //if(month<10){month="0"+month}
            // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
               expense_report_FormObj.find("[name=expense_year]").val(year);
               // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
               expense_report_FormObj.find("[name=expense_month]").val(month);
               expense_report_FormObj.find("[name=expense_date]").val(date);
               expense_report_FormObj.find("[name=to_today_day]").val(day);
            });

         


            //name=expense_price를 가진 입력 양식에서 keyup 이벤트가 발생하면 익명함수 안의 코딩을 실행
            $("[name=expense_price]").bind("keyup",function(){
               //입력양식에서 입력한 데이터를 자바스크립트 영역으로 가져와 변수에 저장
               var expense_price = $(this).val();
               
               //숫자문자를 변수에 저장
               var num ="0123456789";
               //숫자만 골라서 저장할 변수 선언
               var result = "";
               //expense_price 변수 안의 데이터 중 숫자만 골라 result에 축적 시킴
               for ( var i=0 ; i<expense_price.length ; i++ ){
                  //expense_price 안에 데이터 중 i번째 데이터가 숫자문자면 result 변수 축적

                  if(isNaN(expense_price.charAt(i))==false){//isNaN->문자일때 true, 숫자나 숫자문자일때 false
                     result = result + expense_price.charAt(i);
                  }

               }
               //result 변수 안의 맨 앞의 데이터가 0이면 0을 제거
               while (result.charAt(0)=="0"){
                  result = result.substring(1);
               }
               $(this).val(result);
               var arr = result.split("");
               var cnt = 0;

               //Array 객체에 접근해서 배열변수 맨 뒤에서부터 세어 3의 배수에 해당하는 배열변수 안의 데이터 앞에 삽입

               for ( var i=arr.length-1 ; i>0 ; i-- ){
                  if (++cnt%3==0){
                     arr[i] = "," + arr[i];
                  }
               }
               
               //Array 객체의 배열변수 안에 모든 데이터를 붙여서 name=expense_name를 가진 입력양식에 삽입
               $(this).val(arr.join(""));
            });
         });
            


            
    


      //---
      function expence_report_FormCheck( ){
    	  
      //---
         //지출 제목 유효성 검사
         var expense_report_FormObj = $("[name=expense_report_registry]");
         var expense_name = expense_report_FormObj.find("[name=expense_name]").val( );  

              if ( expense_name=="" )
             {
                    alert("지출 제목을 입력해주세요.");
                    return;
             }
         
         //지출 분야 유효성 검사
         var expense_field = expense_report_FormObj.find("[name=expense_field]").val();
            if (expense_field==""){
               alert("지출분야를 입력해주세요."); return;
            }


         //비용 유효성 검사
         var expense_price = expense_report_FormObj.find("[name=expense_price]").val( ); 
            if (expense_price=="")
            {
                    alert("비용을 입력해주세요.");
                    return;
             }
         

      

         //지출 수단 유효성 검사
         var expense_method = expense_report_FormObj.find("[name=expense_method]").val();
            if (expense_method==""){
               alert("지출수단을 입력해주세요."); 
               return;
            }

         //지출일 유효성 검사
          var check_year = expense_report_FormObj.find("[name=expense_year]").val( ); 
          var check_month = expense_report_FormObj.find("[name=expense_month]").val( );
          var check_date = expense_report_FormObj.find("[name=expense_date]").val( );
        
         if(check_year=="" || check_month=="" || check_date==""){
          alert("지출일을 입력해주세요");
          return;
         }

         
         //결재하기 체크박스 체크여부
         if($('input:checkbox[name="expense_check"]').is(":checked")){
            if (confirm("정말 등록하시겠습니까?")==false ){
               return;
            }

         }else{
            alert('체크박스에 체크가 되어있지 않습니다.');
            return;
         }
         

         $.ajax({
             url : "/pro/expense_report_reg_proc.do"
             , type : "post"
             , data : $("form").filter("[name=expense_report_registry]").serialize()
             , dataType : "json"
             , success : function( expensiveRegCnt ){
                if( expensiveRegCnt==2 ){
                	alert("지출 보고서 등록 성공");
                   location.replace("/pro/expenseList.do");
                }
                else{
                	alert("지출 보고서 등록 실패! 관리자에게 문의 바람");
                    location.replace("/pro/expenseList.do");
                }           
             }
             , error : function(){
                alert("서버 접속 실패!");
             }
          });
         
       //---
      }
      //---




      //************************************************************************
      //존재하는 년,월,일 인지의 여부를 리턴하는 함수
      //존재하는 년,월,일이면 true를 리턴
      //************************************************************************
      function is_valid_date(year, month, date){   
   
            year = parseInt( year, 10);  
            month = parseInt( month, 10);
            date = parseInt( date, 10);

         //------------------------------------------------------------------------
         //매개변수로 들어온 년,월,일을 관리하는 Date 객체 생성
         //------------------------------------------------------------------------
         var xxx = new Date(year, month-1, date);
         var flag = false;

         //------------------------------------------------------------------------
         //매개변수로 들어온 년,월,일과 Date 객체가 관리하는 년,월,일이 동일하면 
         //flag 변수에 true 저장
         //------------------------------------------------------------------------
         if ( year==xxx.getFullYear() &&  month==xxx.getMonth()+1 &&  date==xxx.getDate() ){
                     flag = true;
         }
         //------------------------------------------------------------------------
         //존재하는 년,월,일 인지의 여부를 리턴
         //------------------------------------------------------------------------
         return flag;

      }


      //************************************************************************
      //생일의 년,월,일 선택하면 호출되는 함수 
      //선택한 생일 날짜가 존재여부를 판단하여 존재하지 않는 생일이면 경고하기
      //************************************************************************
      function checkAvailableDay(){

         var expense_report_FormObj = $("[name=expense_report_registry]");
       
         //------------------------------------------------------------------------
         //선택한 생일의 년,월,일을 변수에 저장
         //------------------------------------------------------------------------
         var check_year = expense_report_FormObj.find("[name=expense_year]").val( ); 
         var check_month = expense_report_FormObj.find("[name=expense_month]").val( );
         var check_date = expense_report_FormObj.find("[name=expense_date]").val( );
   

          //---------------------------------------------------------------------
          //년도 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_year==""&&check_month !="")
               {
                  alert("년도를 먼저 선택해주세요");
              expense_report_FormObj.find("[name=expense_month]").val("");
                  return;
               }
               if (check_year==""&&check_date !="")
               {
                  alert("년도를 먼저 선택해주세요");
              expense_report_FormObj.find("[name=expense_date]").val("");
                  return;
               }
          //---------------------------------------------------------------------
          //월 먼저 설정하도록 함
          //---------------------------------------------------------------------
               if (check_month==""&&check_date !="")
               {
                  alert("월을 먼저 선택해주세요");
                  expense_report_FormObj.find("[name=expense_date]").val("");
                  return;
               }

   
         //------------------------------------------------------------------------
         //선택한 생일의 년,월,일 중에 하나라도 비어있으면 함수 중단
         //------------------------------------------------------------------------
         if( check_year=="" || check_month=="" || check_date=="" ){return;}
      

         //------------------------------------------------------------------------
         //is_valid_date 함수 호출하여 선택한 생일의 년,월,일의 실존 여부를 판단하여
         //존재하지 않는 생일이면 경고하고
         //------------------------------------------------------------------------
         if( is_valid_date(check_year, check_month, check_date)==false){
            alert("날짜가 존재하지 않습니다");
            expense_report_FormObj.find("[name=expense_year]").val("");
            expense_report_FormObj.find("[name=expense_month]").val("");
            expense_report_FormObj.find("[name=expense_date]").val("");
            expense_report_FormObj.find("[name=to_today_day]").val("");
            return;
         }
         else {
            var select_day = new Date( check_year, check_month-1, check_date );
            var month = select_day.getMonth()+1;
            var date = select_day.getDate();
            var day = getWeek( select_day.getDay() );
            expense_report_FormObj.find("[name=to_today_day]").val(day);
         }


      }



      
   


   </script>



 <BODY>
  
   <center> <caption align="top">[지출 보고서 등록]</caption><BR><BR>
    <form name="expense_report_registry" action="/pro/expensive_report_reg_proc.do">
   <TABLE class="tbcss1" >
   <TR>
      <TD align="center" bgcolor="DCDCDC">1.지출 제목</TD>
      <TD><input type="text" name="expense_name" style="width:550px;">
               &nbsp;<button onClick="sa();">[비움]</button>
   </TR>
   <TR>
      <TD align="center" bgcolor="DCDCDC" >2.지출 내역</TD>
      <TD><table class="tbcss1">
         <TR><TD align="center" bgcolor="DCDCDC" style="width:90px;">지출분야</TD>
            <TD align="center" bgcolor="DCDCDC" style="width:90px;">비용</TD>
            <TD align="center" bgcolor="DCDCDC" style="width:90px;">지출수단
            <TD align="center" bgcolor="DCDCDC">영수증번호
            <TD align="center" bgcolor="DCDCDC">지출일
            <TD align="center" bgcolor="DCDCDC">비고
         </TR>
         <TR><TD>*
            <select name="expense_field">
               <option value="">선택요망</option>
               <option value="1">식대</option>
               <option value="2">회식비</option>
               <option value="3">접대비</option>
               <option value="4">비품</option>
               <option value="5">기자재</option>
               <option value="6">사무가구</option>
               <option value="7">교통비</option>
               <option value="8">경조사비</option>
               <option value="9">숙박비</option>
               <option value="10">의류비</option>
               <option value="11">도서비</option>
               <option value="12">홍보비</option>
               <option value="13">기타</option>
            </select></TD>
            <TD>* <input type="text" name="expense_price" style="width:100px;">원</td>
            <TD>*
            <select name="expense_method">
               <option value="">선택요망</option>
               <option value="1">회사카드</option>
               <option value="2">회사현금</option>
               <option value="3">개인카드</option>
               <option value="4">개인현금</option>
            </select></TD>
            <td><input type="text" name="receipt_no" style="width:150px;"></td>
            <td>* 
            <select name="expense_year" onChange="checkAvailableDay()">
                  <option value="">
                     <option value="1999">1999
                       <option value="2000">2000
                       <option value="2001">2001
                       <option value="2002">2002
                       <option value="2003">2003
                       <option value="2004">2004
                       <option value="2005">2005
                       <option value="2006">2006
                       <option value="2007">2007
                       <option value="2008">2008
                       <option value="2009">2009
                       <option value="2010">2010
                       <option value="2011">2011
                       <option value="2012">2012
                       <option value="2013">2013
                       <option value="2014">2014
                       <option value="2015">2015
                       <option value="2016">2016
                       <option value="2017">2017
                       <option value="2018">2018
                       <option value="2019">2019
                  </select>&nbsp;&nbsp;년&nbsp;
                  <select name="expense_month" onChange="checkAvailableDay()">
                       <option value="">
                       <option value="01">01
                       <option value="02">02
                       <option value="03">03
                       <option value="04">04
                       <option value="05">05
                       <option value="06">06
                       <option value="07">07
                       <option value="08">08
                       <option value="09">09
                       <option value="10">10
                       <option value="11">11
                       <option value="12">12
                  </select>&nbsp;&nbsp;월&nbsp;
               <select name="expense_date" onChange="checkAvailableDay()">
              <option value="">
                  <option value="01">01
                  <option value="02">02
                  <option value="03">03
                  <option value="04">04
                  <option value="05">05
                  <option value="06">06
                  <option value="07">07
                  <option value="08">08
                  <option value="09">09
                  <option value="10">10
                  <option value="11">11
                  <option value="12">12
                  <option value="13">13
                  <option value="14">14
                  <option value="15">15
                  <option value="16">16
                  <option value="17">17
                  <option value="18">18
                  <option value="19">19
                  <option value="20">20
                  <option value="21">21
                  <option value="22">22
                  <option value="23">23
                  <option value="24">24
                  <option value="25">25
                  <option value="26">26
                  <option value="27">27
                  <option value="28">28
                  <option value="29">29
                  <option value="30">30
                  <option value="31">31

               </select>&nbsp;&nbsp;일&nbsp;
                     <input type="text"  name="to_today_day" style="width:25px;" readonly>
               <span style="cursor:pointer" class="to_today">[오늘로]</span>
            <td><input type="text" name="remarks" style="width:100px;"></td>
            </select></TD>
         </TR>
      </table>
   </TR>
   <TR>
      <TD align="center" bgcolor="DCDCDC">3.결재 내역</TD>
      <TD><table class="tbcss1">
         <TR><TD align="center" bgcolor="DCDCDC" style="width:90px;">결재 차수</TD>
            <TD align="center" bgcolor="DCDCDC" style="width:150px;">결재자명</TD>
            <TD align="center" bgcolor="DCDCDC" style="width:150px;">결재 여부</TD>
         </TR>
         </TR><TD align="center">1차 <td align="right"><input type="button" value="사진"> <td> <input type="checkbox" name="expense_check">결재하기</td>
         <!--<TR><TD align="center">2차 <td align="right"><input type="button" value="사진"> <td> 결재예정
         <TR><TD align="center">3차 <td align="right"><input type="button" value="사진"> <td> 결재예정
         <TR><TD align="center">4차 <td align="right"><input type="button" value="사진"> <td> 결재예정-->
         </table>
   </TR>
   </TABLE>
   <div style="height:5px"></div>
   
   
   </center>
   <div style="height:20px"></div>  
      <center><input type="button" style="cursor:pointer" style="width:100px" onclick="expence_report_FormCheck( )" value="등록" >&nbsp;&nbsp;
   <input type="button" value="화면닫기" style="width:100px;">&nbsp;&nbsp;
  <input type="reset" value="초기화"></input>&nbsp;&nbsp;</center>
  <input type="hidden" name="report_field" value="1">
  <c:if test="${!empty sessionScope.emp_no}">
    <input type="hidden" name="emp_no" value="${sessionScope.emp_no}">	
  </c:if>
   </form>



 </BODY>

   <script>
         

            var expense_report_FormObj = $("[name=expense_report_registry]");
            function sa() { 
               if ( expense_report_FormObj.find("[name=expense_name]").val() != ""){ 
                  expense_report_FormObj.find("[name=expense_name]").val(""); 
                  return;
            }
         }
   </script>         

   </HTML>


 