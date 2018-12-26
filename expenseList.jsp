<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@include file="/WEB-INF/views/common2.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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

   .table2, .table2 td, .table2 th{
   border-collapse:collapse;
   border-top: 1px solid #000000;
   border-bottom: 1px solid #000000;
   border-left:1px solid #000000;
   border-right:1px solid #000000;

   padding:7;
   font-size: 8pt;
   font-family:tahoma,굴림,돋움,verdana;}

   .searchform{
      border:1px solid #000000
   }

   
   .tbcss2, .tbcss2 td, .tbcss2 th
      {
         
         font-size: 9pt;
         font-family: tahoma, 굴림, 돋움, verdana;

      }


   </style>

   <script src="jquery-1.11.0.min.js" type="text/javascript"></script>

   



   <script>

$(document).ready(function(){
      
      // 이전 화면에서 입력, 선택한 데이터를 재 입력하여 흔적 남기기 
      
      // 한 페이지에서 보여줄 게시판 목록 행의 개수를 조절하는
      // select 입력양식에 change 이벤트 발생시 실행할 코드 설정
      $("[name=rowCntPerPage]").change(function(){
         // name=boardListForm 을 가진 폼태그의 action값의 URL주소로 이동
         // 즉 /z_jsp/boardList.do로 이동
         document.expense_report.submit();
      });
      
      
      // [오늘로] 글씨를 클릭하면 실행할 구문 설정
      var expense_report_FormObj = $("[name=expense_report]");

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
         //if(month<10){month="0"+month}
         // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
         expense_report_FormObj.find("[name=min_approval_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         expense_report_FormObj.find("[name=min_approval_month]").val(month);
         expense_report_FormObj.find("[name=max_approval_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         expense_report_FormObj.find("[name=max_approval_month]").val(month);
      });

      expense_report_FormObj.find(".to_today1").click(function(){

         // 현재 날짜를 관리하는 Date 객체 생성해서 객체의 메위주를 today라는 변수에 저장.
         // 월을 세팅할 땐 1을 빼고, 월을 얻을 땐 1을 더하자. ex) 2월을 세팅할 땐, 1월로 집어넣기
         // n월의 마지막날을 얻고 싶으면 n월 0일을 세팅
         var today = new Date(  );
         // 현재 날짜의 년도 얻기
         var year = today.getFullYear();
         // 현재 날짜의 월 얻기. 주의> 월을 얻고 나서 1을 더할 것
         var month = today.getMonth()+1;
         var date = today.getDate();
         //if(month<10){month="0"+month}
         // 현재 날짜의 월을 name=min_reg_year 을 가진 입력양식에 넣어주기
         expense_report_FormObj.find("[name=min_expense_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         expense_report_FormObj.find("[name=min_expense_month]").val(month);
         expense_report_FormObj.find("[name=max_expense_year]").val(year);
         // 현재 날짜의 월을 name=min_reg_month 을 가진 입력양식에 넣어주기
         expense_report_FormObj.find("[name=max_expense_month]").val(month);
      });

      expense_report_FormObj.find("[name^=min_approval_],[name^=max_approval_]").change(function(){
         //연락처 등록일 날짜 검색 조건 입력 양식의 유효성 체크함수 호출
         check_reg_date();
      });
      
      expense_report_FormObj.find("[name^=min_expense_],[name^=max_expense_]").change(function(){
         check_reg_date1();
      });
      
      expense_report_FormObj.find("[name^=cost_]").change(function(){
         check_cost();
      });


      //*************************************************
      // [비움] 글씨를 클릭하면 실행할 구문 설정
      //*************************************************
      
      // 결재일 비움
        expense_report_FormObj.find(".empty1").click(function(){
         expense_report_FormObj.find("[name^=min_approval]").val('');
         expense_report_FormObj.find("[name^=max_approval]").val('');
        });
      
        // 지출일 비움
      expense_report_FormObj.find(".empty2").click(function(){
         expense_report_FormObj.find("[name^=min_expense]").val('');
         expense_report_FormObj.find("[name^=max_expense]").val('');
        });

      // 결재여부 비움
      expense_report_FormObj.find(".empty6").click(function(){
         expense_report_FormObj.find("[name=approval_rejection]").prop("checked",false);
        });
      
      // 지출수단 비움
      expense_report_FormObj.find(".empty7").click(function(){
         expense_report_FormObj.find("[name=expense_means]").prop("checked",false);
        });

      // 지출분야 비움
      expense_report_FormObj.find(".empty5").click(function(){
         expense_report_FormObj.find("[name=expense_area]").prop("checked",false);
        });
      
      // 비용 비움
      expense_report_FormObj.find(".empty3").click(function(){
         expense_report_FormObj.find("[name^=cost_]").val('');
        });
      
      // 키워드 비움
      expense_report_FormObj.find(".empty4").click(function(){
         expense_report_FormObj.find("[name^=keyword]").val('');
        });
      


      //************************************************* 
      // 초기화 후 모두검색 버튼에 클릭 이벤트 시 실행할 구문 (미완) 정렬과 행보기 지워지기 제외시켜야함
      //************************************************
      expense_report_FormObj.find(".searchAll").click(function(){

         // 검색 조건 관련 입력 양식의 데이터를 비우거나 체크를 풀기
         // <주의> name=selectPageNo, name=rowCntPerPage를 가진 입력 양식은 제외
         expense_report_FormObj.find("[name^=min_approval]").val('');
         expense_report_FormObj.find("[name^=max_approval]").val('');
         expense_report_FormObj.find("[name^=min_expense]").val('');
         expense_report_FormObj.find("[name^=max_expense]").val('');
         expense_report_FormObj.find("[name^=cost_]").val('');
         expense_report_FormObj.find("[name^=keyword]").val('');
		expense_report_FormObj.find("[name=sort]").val('');
		expense_report_FormObj.find("[name=sort_multi]").val('');
         expense_report_FormObj.find("[name=approval_rejection]").prop("checked",false);
         expense_report_FormObj.find("[name=expense_area]").prop("checked",false);
         expense_report_FormObj.find("[name=expense_means]").prop("checked",false);

            
          
      });


   });
//----------------------------------------------------------------------------------------------------- 

      //************************************************************************
      //존재하는 년,월,일 인지의 여부를 리턴하는 함수
      //존재하는 년,월,일이면 true를 리턴
      //************************************************************************
      function is_valid_date(year, month){   

         year = parseInt( year, 10);  
         month = parseInt( month, 10);

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
      //결재일의 년,월,일 선택하면 호출되는 함수 
      //선택한 결재일의 존재여부를 판단하여 존재하지 않는 결재일이면 경고하기
      //************************************************************************
      function checkApprovalDate(){
   
          var expense_report_FormObj = $("[name=expense_report]");
      
          //------------------------------------------------------------------------
          //선택한 결재일의 년,월,일을 변수에 저장
          //------------------------------------------------------------------------
          var check_year = expense_report_FormObj.find("[name=approval_year]").val( ); 
          var check_month = expense_report_FormObj.find("[name=approval_month]").val( );
          
         //---------------------------------------------------------------------
         //년도 먼저 설정하도록 함
         //---------------------------------------------------------------------
         if (check_year==""&&check_month !="")
         {
         alert("년도를 먼저 선택해주세요");
         expense_report_FormObj.find("[name=approval_month]").val("");
         return;
         }
   
         //------------------------------------------------------------------------
         //선택한 결재일의 년,월,일 중에 하나라도 비어있으면 함수 중단
         //------------------------------------------------------------------------
         if( check_year=="" || check_month=="" ){return;}
         
      }


      // 반전 선택 
      function reverseChecked(classV){
         var obj1 = $('.'+classV+":checked");
         var obj2 = $('.'+classV+":not(:checked)");
         obj1.prop("checked",false);
         obj2.prop("checked",true);   
      }


      //------------------------------------------------------------------------


      // 월보다 년도 먼저 선택하게함.
      function check_reg_date(){
         //alert(9);
         var expense_report_FormObj=$("[name=expense_report]");
         //----------------------------------
         var min_reg_year = expense_report_FormObj.find("[name=min_approval_year]").val( );
         var min_reg_month = expense_report_FormObj.find("[name=min_approval_month]").val( );
         var max_reg_year = expense_report_FormObj.find("[name=max_approval_year]").val( );
         var max_reg_month = expense_report_FormObj.find("[name=max_approval_month]").val( );
         //----------------------------------
         if( (min_reg_year==null || min_reg_year.length==0) && (min_reg_month!=null && min_reg_month.length>0) ){
            alert("왼쪽 년도를 먼저 선택해야 합니다.");
            expense_report_FormObj.find("[name=min_approval_month]").val( "" );
            return;
         }
         
         if( (max_reg_year==null || max_reg_year.length==0) && (max_reg_month!=null && max_reg_month.length>0) ){
             alert("왼쪽 년도를 먼저 선택해야 합니다.");
             expense_report_FormObj.find("[name=max_approval_month]").val( "" );
             return;
         }
         
         if( (min_reg_year!=null && min_reg_year.length>0) && (min_reg_month!=null && min_reg_month.length>0)
          && (max_reg_year!=null && max_reg_year.length>0) &&  (max_reg_month!=null && max_reg_month.length>0) ){

          var max_date = expense_report_FormObj.find("[name=max_approval_year]").val(  )+expense_report_FormObj.find("[name=max_approval_month]").val(  );
          var min_date = expense_report_FormObj.find("[name=min_approval_year]").val(  )+expense_report_FormObj.find("[name=min_approval_month]").val(  );
             if( parseInt(max_date,10) < parseInt(min_date,10) ) {
               alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
               expense_report_FormObj.find("[name^=min_approval_]").val("");
               expense_report_FormObj.find("[name^=max_approval_]").val("");
               return;
            }
         }
      }


      function check_reg_date1(){
         //alert(9);
         var expense_report_FormObj=$("[name=expense_report]");
         //----------------------------------
         var min_reg_year1 = expense_report_FormObj.find("[name=min_expense_year]").val( );
         var min_reg_month1 = expense_report_FormObj.find("[name=min_expense_month]").val( );
         var max_reg_year1 = expense_report_FormObj.find("[name=max_expense_year]").val( );
         var max_reg_month1 = expense_report_FormObj.find("[name=max_expense_month]").val( );
         //----------------------------------
         if( (min_reg_year1==null || min_reg_year1.length==0) && (min_reg_month1!=null && min_reg_month1.length>0) ){
          alert("왼쪽 년도를 먼저 선택해야 합니다.");
          expense_report_FormObj.find("[name=min_expense_month]").val( "" );
          return;
         }
         
         if( (max_reg_year1==null || max_reg_year1.length==0) && (max_reg_month1!=null && max_reg_month1.length>0) ){
          alert("왼쪽 년도를 먼저 선택해야 합니다.");
          expense_report_FormObj.find("[name=max_expense_month]").val( "" );
          return;
         }
         
         if( (min_reg_year1!=null && min_reg_year1.length>0) && (min_reg_month1!=null && min_reg_month1.length>0)
          && (max_reg_year1!=null && max_reg_year1.length>0) &&  (max_reg_month1!=null && max_reg_month1.length>0) ){
             var max_date1 = expense_report_FormObj.find("[name=max_expense_year]").val(  )+expense_report_FormObj.find("[name=max_expense_month]").val(  );
             var min_date1 = expense_report_FormObj.find("[name=min_expense_year]").val(  )+expense_report_FormObj.find("[name=min_expense_month]").val(  );
             if( parseInt(max_date1,10) < parseInt(min_date1,10) ) {
               alert("[최소 년월]이 [최대 년월] 보다 큽니다. 재 선택 바람!");
               expense_report_FormObj.find("[name^=min_expense_]").val("");
               expense_report_FormObj.find("[name^=max_expense_]").val("");
               return;
            }
         }
      }


      function check_cost(){
         var expense_report_FormObj=$("[name=expense_report]");
         //----------------------------------
         var cost_min = expense_report_FormObj.find("[name=cost_min]").val( );
         var cost_max = expense_report_FormObj.find("[name=cost_max]").val( );

         
         cost_min = parseInt(cost_min,10);
         cost_max = parseInt(cost_max,10);
         
         if( (cost_min==null || cost_min.length==0) && (cost_min!=null && cost_min.length>0) ){
          alert("최소값을 먼저 선택해야 합니다.");
          expense_report_FormObj.find("[name=cost_min]").val( "" );
          return;
         }      
         //----------------------------------
         if( (cost_min!=null && cost_min.length>0)
          && (cost_max!=null && cost_max.length>0)){

             //var max_date = expense_report_FormObj.find("[name=max_reg_year]").val(  );
             //var min_date = expense_report_FormObj.find("[name=min_reg_year]").val(  );
             if( cost_min > cost_max ) {
               alert("[최소 금액]이 [최대 금액] 보다 큽니다. 재 선택 바람!");
               expense_report_FormObj.find("[name=cost_min]").val("");
               expense_report_FormObj.find("[name=cost_max]").val("");
               return;
            }
         }
         
         
      }
      
      // [게시판 상세보기 화면] 으로 이동하는 함수 선언
      function goExpenseContentForm( report_no ){
         // 클릭한 게시판 글의 PK값을 name = expenseContentForm 가진 
         // form 태그 안의 name = report_no 를 가진 입력양식에 삽입하기 
         $("[name=expenseContentForm],[name=report_no]").val(report_no);
         // name = expenseContentForm 가진 form 태그 안의 action에 설정된 URL로 이동하기
         // 이동 시 form 태그 안의 모든 입력양식이 파라미터 값으로 전송된다. 
         document.expenseContentForm.submit();
      }


      //----------------------------------
      // name="expense_report"을 가진 form 태그의 action 값의 URL 주소로 이동하는 함수 선언
      //----------------------------------
      function goExpense_report(){
         document.expense_report.submit();
      }
      
      
      function goExpense_report_reg_form( ){
         //name=expenseRegForm 을 가진 form 태그 안의 action에 설정된 url로 이동하기 
         //이동 시 form 태그 안의 모든 입력양식이 파라미터값으로 전송된다.
         document.expenseRegForm.submit();
      }

      // 검색 눌렀을 때 입력 여부 확인 경고문 띄우기
      function expence_report_FormCheck( ){

         // 키워드 앞칸과 뒷칸 내용 중복 금지
         var expense_report_FormObj = $("[name=expense_report]");
         if ( expense_report_FormObj.find("[name=keyword1]").val() !="" && expense_report_FormObj.find("[name=keyword2]").val() !=""  ){
            if( expense_report_FormObj.find("[name=keyword1]").val() == expense_report_FormObj.find("[name=keyword2]").val() ){
                alert("키워드 입력란의 내용이 중복되었습니다.");
                expense_report_FormObj.find("[name=keyword1]").val("");
                expense_report_FormObj.find("[name=keyword2]").val("");
                return;
            }
         }

         // 키워드 앞 칸을 비고 뒤에 먼저 쓰지 않게 하기
         var expense_report_FormObj = $("[name=expense_report]");
         if ( expense_report_FormObj.find("[name=keyword1]").val() =="" && expense_report_FormObj.find("[name=keyword2]").val() !=""  ){
             alert("키워드 첫번째 입력란은 비워둘 수 없습니다.");
             expense_report_FormObj.find("[name=keyword2]").val("");
             return;
         }

	  	expense_report_FormObj.find("[name=sort_multi]").change(function(){
			//멀티 정렬 데이터 가져오기
			var sort_multi = expense_report_FormObj.find("[name=sort_multi]").val();
			//멀티 정렬 데이터가 있으면 name=sort을 가진 hidden 태그에 값을 저장.
			if(sort_multi!=""){
				expense_report_FormObj.find("[name=sort]").val(sort_multi);
			}
			goExpense_report();
		});

         //------------------------------------------------------------------------------------------------------
         
         goExpense_report();
         
      }


   </script>






   <body><center>
      
      <form name="expense_report" method="post" action="/pro/expenseList.do">
        <table class="tbcss1" border="1">
          <caption><B>[지출 보고서 검색]</B></caption><br>

            <td bgcolor=#DCDCDC width=80 align=center>결재일</td>
            <td align=left>&nbsp;
               <select name = "min_approval_year" onChange = "checkApprovalDate()" value="approval"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "min_approval_month" onChange = "checkApprovalDate()" value="approval">
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;&nbsp;~&nbsp;&nbsp;
          <select name = "max_approval_year" onChange = "checkApprovalDate()" value="approval"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "max_approval_month" onChange = "checkApprovalDate()" value="approval">
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty1">[비움]</span>
            <span style="cursor:pointer" class="to_today">[오늘로]</span>
            </td>
          </tr>

          <tr>
          <td bgcolor=#DCDCDC width=80 align=center>지출일</td>
            <td>&nbsp;&nbsp;<select name = "min_expense_year" onChange = "checkApprovalDate()" value="expense"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "min_expense_month" onChange = "checkApprovalDate()" value="expense">
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;&nbsp;~&nbsp;&nbsp;
          <select name = "max_expense_year" onChange = "checkApprovalDate()" value="expense"> 
          <option value="">
            <script>
               for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;년
          <select name = "max_expense_month" onChange = "checkApprovalDate()" value="expense">
          <option value="">
            <script>
               for (var i=1; i<=12 ; i++ )
               {   var m = (i<10)?"0"+i:i;
                 document.write("<option value="+m+">"+m);
               }
            </script>
          </select>&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty2">[비움]</span>
            <span style="cursor:pointer" class="to_today1">[오늘로]</span>
            </td>
          </tr>
          <tr>
          <td bgcolor=#DCDCDC align=center>결재여부</td>
            <td>&nbsp;
               <input type="checkbox"  name="approval_rejection" value=1 class="approval_rejection">결재완료
               <input type="checkbox"  name="approval_rejection" value=2 class="approval_rejection">미결재
               <input type="checkbox"  name="approval_rejection" value=3 class="approval_rejection">반려
               <input type="checkbox"  name="approval_rejection" value=4 class="approval_rejection">결재종료 &nbsp;&nbsp;
            <span class="tbcss2" style="cursor:pointer" onclick="reverseChecked('approval_rejection');">[반전선택]</span>&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty6">[비움]</span>
            </td>
          </tr>
          <tr>
          <td bgcolor=#DCDCDC align=center>지출수단</td>
            <td>&nbsp;
               <input type="checkbox" name="expense_means" value=1 class="expense_means">회사카드
               <input type="checkbox" name="expense_means" value=2 class="expense_means">회사현금
               <input type="checkbox" name="expense_means" value=3 class="expense_means">개인카드
               <input type="checkbox" name="expense_means" value=4 class="expense_means">개인현금 &nbsp;&nbsp;
            <span class="tbcss2" style="cursor:pointer" onclick="reverseChecked('expense_means');">[반전선택]</span>&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty7">[비움]</span>
            </td>
          </tr>
          <tr>
          <td bgcolor=#DCDCDC align=center>지출분야</td>
            <td width=840>&nbsp;
               <input type="checkbox" name="expense_area" value=1>식대
               <input type="checkbox" name="expense_area" value=2>회식비
               <input type="checkbox" name="expense_area" value=3>접대비
               <input type="checkbox" name="expense_area" value=4>비품
               <input type="checkbox" name="expense_area" value=5>기자재
               <input type="checkbox" name="expense_area" value=6>사무가구
               <input type="checkbox" name="expense_area" value=7>교통비
               <input type="checkbox" name="expense_area" value=8>경조사비
               <input type="checkbox" name="expense_area" value=9>숙박비
               <input type="checkbox" name="expense_area" value=10>의류비
               <input type="checkbox" name="expense_area" value=11>도서비
               <input type="checkbox" name="expense_area" value=12>홍보비
               <input type="checkbox" name="expense_area" value=13>기타 &nbsp;&nbsp;
            <span style="cursor:pointer" class="empty5">[비움]</span>&nbsp;&nbsp;
            </td>
          </tr>
          <tr>
            <td bgcolor=#DCDCDC align=center>비용</td>
            <td>&nbsp;
          <!--<select name = "cost_min" onChange = "checkCostMin()"> -->
          <select name = "cost_min" value="cost">
          <option value="">
            <script>
               for (var i=0; i<=500 ; i+=5 )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;만원&nbsp;~&nbsp;&nbsp;
          <!--<select name = "cost_max" onChange = "checkCostMin()"> -->
          <select name = "cost_max" value="cost">
          <option value="">
            <script>
               for (var i=0; i<=500 ; i+=5 )
               {   document.write("<option value="+i+">"+i);
               }
            </script> 
          </select>&nbsp;만원
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty3">[비움]</span>
            </td>
          </tr>
          <tr>
            <td bgcolor=#DCDCDC align=center>키워드</td>
            <td>&nbsp;
               <input type="text" name="keyword1" size=20 maxlength=30>&nbsp;
               <select name="or_and" class="or_and" value="keyword">
                 <option value=1>or</option>
                 <option value=2>and</option>
               </select>&nbsp;
               <input type="text" name="keyword2" size=20 maxlength=30>&nbsp;&nbsp;&nbsp;
            <span style="cursor:pointer" class="empty4">[비움]</span>
            </td>
          </tr>
          
        </table>
   <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" style="cursor:pointer" style="width:100px" onclick="expence_report_FormCheck( )" value="검색">&nbsp;&nbsp;
        <input type="button" value="초기화 후 모두검색" class="searchAll" onclick="goExpense_report();">&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="tbcss2" style="cursor:pointer" onclick="goExpense_report_reg_form()">[지출보고서 등록]</span>
        <p>
        <span class="tbcss2">[다중 정렬] : 
        <select name="sort_multi" >
         <option value=""></option>              
         <option value="approval_defer_date desc, expense_date asc">결재/보류일내림>지출일오름</option>
         <option value="approval_defer_date desc, expense_date desc">결재/보류일내림>지출일내림</option>
         <option value="approval_defer_date asc, expense_date asc">결재/보류일오름>지출일오름</option>
         <option value="approval_defer_date asc, expense_date desc">결재/보류일오름>지출일내림</option>
        </select>  

        &nbsp;&nbsp;&nbsp;&nbsp;

        <!-- name은 spring에서 가져온대로 했습니다.  -->
         <th><select name ="rowCntPerPage">
                  <option value="10">10행보기
                  <option value="20">20행보기
                  <option value="30">30행보기
                  <option value="40">40행보기
                  <option value="50">50행보기
             </select>

         
      </form>
      <br><br>
    

   <td width=500 align=center>
			<!----------------------------------->
			<!-- 검색 결과물의 개수가 1개 이상일 경우 페이징 처리 관련 html 출력-->
			<!----------------------------------->
			<c:if test="${expenseboardListAllCnt>0}">
				<!-- 만약 [시작페이지 번호]가 [화면당 보이는 페이지 번호 개수]보다 크면-->
				<!-- [처음], [이전] 글씨 보이게 하고, 클릭하면 원하는 페이지번호를 hidden 입력 양식에 담고-->
				<!-- 현재 페이지로 다시 이동하기-->
				<c:if test="${pageingData.beginPageNo>pageingData.pageNoCntPerPage}">
					<a href="javascript:$('[name=selectPageNo]').val('1');goExpense_report( );">[처음] </a>
					<a href="javascript:$('[name=selectPageNo]').val('${beginPageNo-1}');goExpense_report( );">[이전]  </a>
				</c:if>
				<!-- [시작페이지 번호]부터 [마지막 페이지 번호]까지 페이지번호를 출력하기-->
				<!-- 선택된 페이지 번호는 번호만 출력하고 클릭하지 못하게 하고-->
				<!-- 선택 안된 페이지 번호는 대괄호로 감싸 출력하고 클릭하면 원하는 -->
				<!-- 원하는 페이지번호를 hidden 입력 양식에 담고 현재 페이지로 다시 이동하기-->
				<c:forEach var="pageNo" begin="${pageingData.beginPageNo}" end="${pageingData.endPageNo}">
					<c:if test="${pageingData.selectPageNo!=pageNo}">
						<a href="javascript:$('[name=selectPageNo]').val('${pageNo}');goExpense_report()">[${pageNo}]</a>
					</c:if>
					<c:if test="${pageingData.selectPageNo==pageNo}">
						${pageNo}
					</c:if>
				</c:forEach>
				<!-- 만약면 현재 화면에서 보이는 [끝 페이지 번호]가 [맨 마지막 페이지 번호]보다 작으면-->
				<!-- [다음], [마지막] 글씨 보이게 하고, 클릭하면 원하는 페이지번호를 hidden 입력 양식에 담고-->
				<!-- 현재 페이지로 다시 이동하기-->
				<c:if test="${pageingData.endPageNo<pageingData.lastPageNo}">
					<a href="javascript:$('[name=selectPageNo]').val('${pageingData.endPageNo+1}');goExpense_report();">  [다음] </a>
					<a href="javascript:$('[name=selectPageNo]').val('${pageingData.lastPageNo}');goExpense_report();">[마지막] </a>
				</c:if>
			</c:if>
         
      <c:set  value="${selectPageNo}" var = "selectPageNo"/> 
     
      
      <!-- -------------------------------------- -->
      <!-- 페이징 번호 출력 -->
      <!-- -------------------------------------- -->
      <table class="tacss2 expenseList" border="1">
	  <th>번호
		<c:choose>
			<c:when test="${param.sort=='report_name desc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val( 'report_name asc' );goExpense_report();">▼지출제목
			</c:when>
			<c:when test="${param.sort=='report_name asc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('report_name desc');goExpense_report();">▲지출제목
			</c:when>
			<c:otherwise>
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('report_name asc');goExpense_report();">지출제목
			</c:otherwise>
		</c:choose>
		<!------------------------------------->
		<c:choose>
			<c:when test="${param.sort=='expense_field desc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_field asc');goExpense_report();">▼지출분야
			</c:when>
			<c:when test="${param.sort=='expense_field asc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_field desc');goExpense_report();">▲지출분야
			</c:when>
			<c:otherwise>
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_field asc');goExpense_report();">지출분야
			</c:otherwise>
		</c:choose>
		<!------------------------------------->
		<c:choose>
			<c:when test="${param.sort=='sign_name desc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('sign_name asc');goExpense_report();">▼결제여부
			</c:when>
			<c:when test="${param.sort=='sign_name asc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('sign_name desc');goExpense_report();">▲결제여부
					</c:when>
			<c:otherwise>
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('sign_name asc');goExpense_report();">결제여부
			</c:otherwise>
		</c:choose>
		<!------------------------------------->
		<c:choose>
			<c:when test="${param.sort=='sign_date desc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('sign_date asc');goExpense_report();">▼결재/보류일
			</c:when>
			<c:when test="${param.sort=='reg_date asc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('sign_date desc');goExpense_report();">▲결재/보류일
			</c:when>
			<c:otherwise>
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('sign_date asc');goExpense_report();">결재/보류일
			</c:otherwise>
		</c:choose>
		<!------------------------------------->
		<c:choose>
			<c:when test="${param.sort=='expense_date desc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_date asc');goExpense_report();">▼지출일
			</c:when>
			<c:when test="${param.sort=='expense_date asc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_date desc');goExpense_report();">▲지출일
			</c:when>
			<c:otherwise>
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_date asc');goExpense_report();">지출일
			</c:otherwise>
		</c:choose>
		<!------------------------------------->
		<c:choose>
			<c:when test="${param.sort=='expense_price desc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_price asc');goExpense_report();">▼비용			
			</c:when>
			<c:when test="${param.sort=='expense_price asc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_price desc');goExpense_report();">▲비용
			</c:when>
			<c:otherwise>
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_price asc');goExpense_report();">비용
			</c:otherwise>
		</c:choose>
		<!------------------------------------->
		<c:choose>
			<c:when test="${param.sort=='expense_method desc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_method asc');goExpense_report();">▼지출수단			
			</c:when>
			<c:when test="${param.sort=='expense_method asc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_method desc');goExpense_report();">▲지출수단
			</c:when>
			<c:otherwise>
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('expense_method asc');goExpense_report();">지출수단
			</c:otherwise>
		</c:choose>
		<!------------------------------------->
		<c:choose>
			<c:when test="${param.sort=='receipt_no desc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('receipt_no asc');goExpense_report();">▼영수증번호			
			</c:when>
			<c:when test="${param.sort=='receipt_no asc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('receipt_no desc');goExpense_report();">▲영수증번호
			</c:when>
			<c:otherwise>
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('receipt_no asc');goExpense_report();">영수증번호
			</c:otherwise>
		</c:choose>
		<!------------------------------------->
		<c:choose>
			<c:when test="${param.sort=='sign_state desc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('sign_state asc');goExpense_report();">▼결재상황			
			</c:when>
			<c:when test="${param.sort=='sign_state asc'}">
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('sign_state desc');goExpense_report();">▲결재상황
			</c:when>
			<c:otherwise>
				<th style="cursor:pointer"
					onclick="$('[name=sort_multi]').val('');$('[name=sort]').val('sign_state asc');goExpense_report();">결재상황
			</c:otherwise>
		</c:choose>

			<c:forEach var="expense" items="${expenseList}" varStatus="loopTagStatus"> 
				 <tr align=center style="cursor:pointer" onClick="">
 
				<td>${pageingData.beginRowNo_desc-loopTagStatus.index}
				<td align=left>
				   ${expense.report_name}
				<td>${expense.expense_field}
				<td>${expense.sign_name}
				<td>${expense.sign_date}
				<td>${expense.expense_date}
				<td>${expense.expense_price}
				<td>${expense.expense_method}
				<td>${expense.receipt_no}
				<td>${expense.sign_state}
	
			</c:forEach>	

      </table> 

      <form name="expenseRegForm" method="post" action ="/pro/expense_report_reg_form.do">
         <input type="hidden" name="report_no">
          <input type="hidden" name="selectPageNo">
      </form>
      
      
   </body>
   


</HTML>


