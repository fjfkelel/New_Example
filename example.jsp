<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSP 페이지에서 사용할 [JQuery API] 수입 -->
<script src="/erp/resources/jquery-1.11.0.min.js"></script>
<!-- JSP 페이지에서 사용할 [CSS 파일] 수입 -->
<link href="/erp/resources/style1.css" rel="stylesheet" type="text/css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<style>
	.table1, .table1 td, .table1 th{
	border-collapse:collapse;
	border-top: 1px solid #000000;
	border-bottom: 1px solid #000000;
	border-left:1px solid #000000;
	border-right:1px solid #000000;

	padding:3;
	font-size: 9pt;
	font-family:tahoma,굴림,돋움,verdana;}

	.searchform{
		border:1px solid #000000
	}
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
	</style>


<body><center>
	
	<form name="expense_report">
		<table class="table1" border="1">
			<caption><B>[지출 보고서 검색]</B></caption>
				<td bgcolor=#DCDCDC width=80 align=center>결재일</td>
				<td align=left>&nbsp
					<select name = "approval_year" onChange = "checkApprovalDate()"> 
			<option value="">
				<script>
					for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
					{	document.write("<option value="+i+">"+i);
					}
				</script> 
			</select>년
			<select name = "approval_month" onChange = "checkApprovalDate()">
			<option value="">
				<script>
					for (var i=1; i<=12 ; i++ )
					{	var m = (i<10)?"0"+i:i;
						document.write("<option value="+m+">"+m);
					}
				</script>
			</select>&nbsp;&nbsp;월&nbsp;&nbsp;~&nbsp;&nbsp;
			<select name = "approval_year" onChange = "checkApprovalDate()"> 
			<option value="">
				<script>
					for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
					{	document.write("<option value="+i+">"+i);
					}
				</script> 
			</select>년
			<select name = "approval_month" onChange = "checkApprovalDate()">
			<option value="">
				<script>
					for (var i=1; i<=12 ; i++ )
					{	var m = (i<10)?"0"+i:i;
						document.write("<option value="+m+">"+m);
					}
				</script>
			</select>&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset">[비움]</button>&nbsp&nbsp&nbsp
				<span class="tbcss2" style="cursor:pointer" onclick="">[오늘로]</span>
				</td>
			</tr>
			<tr>
			<td bgcolor=#DCDCDC width=80 align=center>지출일</td>
				<td>&nbsp&nbsp;<select name = "expense_year" onChange = "checkApprovalDate()"> 
			<option value="">
				<script>
					for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
					{	document.write("<option value="+i+">"+i);
					}
				</script> 
			</select>년
			<select name = "expense_month" onChange = "checkApprovalDate()">
			<option value="">
				<script>
					for (var i=1; i<=12 ; i++ )
					{	var m = (i<10)?"0"+i:i;
						document.write("<option value="+m+">"+m);
					}
				</script>
			</select>&nbsp;&nbsp;월&nbsp;&nbsp;~&nbsp;&nbsp;
			<select name = "expense_year" onChange = "checkApprovalDate()"> 
			<option value="">
				<script>
					for (var i=1990; i<=new Date().getFullYear()+1 ; i++ )
					{	document.write("<option value="+i+">"+i);
					}
				</script> 
			</select>년
			<select name = "expense_month" onChange = "checkApprovalDate()">
			<option value="">
				<script>
					for (var i=1; i<=12 ; i++ )
					{	var m = (i<10)?"0"+i:i;
						document.write("<option value="+m+">"+m);
					}
				</script>
			</select>&nbsp;&nbsp;월&nbsp&nbsp&nbsp&nbsp&nbsp
				<button type="reset">[비움]</button>&nbsp&nbsp&nbsp
				<span class="tbcss2" style="cursor:pointer" onclick="">[오늘로]</span>
				</td>
			</tr>
			<tr>
			<td bgcolor=#DCDCDC align=center>결재여부</td>
				<td>&nbsp
					<input type="checkbox"  name="approval_rejection" value="결재완료" class="rejection">결재완료
					<input type="checkbox"  name="approval_rejection" value="미결재" class="rejection">미결재
					<input type="checkbox"  name="approval_rejection" value="반려" class="rejection">반려
					<input type="checkbox"  name="approval_rejection" value="결재종료" class="rejection">결재종료 &nbsp&nbsp
				<span class="tbcss2" style="cursor:pointer" onclick="reverseChecked('approval_rejection');">[반전선택]&nbsp&nbsp&nbsp
				<button type="reset">[비움]</button></span>
				</td>
			</tr>
			<tr>
			<td bgcolor=#DCDCDC align=center>지출수단</td>
				<td>&nbsp
					<input type="checkbox" name="expense_means" value="IT">회사카드
					<input type="checkbox" name="expense_means" value="통신">회사현금
					<input type="checkbox" name="expense_means" value="금융">개인카드
					<input type="checkbox" name="expense_means" value="통신">개인현금 &nbsp&nbsp
				<span class="tbcss2" style="cursor:pointer" onclick="reverseChecked('expense_means');">[반전선택]</span>&nbsp&nbsp&nbsp
				<button type="reset">[비움]</button>
				</td>
			</tr>
			<tr>
			<td bgcolor=#DCDCDC align=center>지출분야</td>
				<td width=840>&nbsp
					<input type="checkbox" name="expense_area" value="IT">식대
					<input type="checkbox" name="expense_area" value="통신">회식비
					<input type="checkbox" name="expense_area" value="금융">접대비
					<input type="checkbox" name="expense_area" value="IT">비품
					<input type="checkbox" name="expense_area" value="통신">기자재
					<input type="checkbox" name="expense_area" value="금융">사무가구
					<input type="checkbox" name="expense_area" value="IT">교통비
					<input type="checkbox" name="expense_area" value="통신">경조사비
					<input type="checkbox" name="expense_area" value="금융">숙박비
					<input type="checkbox" name="expense_area" value="IT">의류비
					<input type="checkbox" name="expense_area" value="통신">도서비
					<input type="checkbox" name="expense_area" value="금융">홍보비
					<input type="checkbox" name="expense_area" value="통신">기타 &nbsp&nbsp
				<button type="reset">[비움]</button>&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td bgcolor=#DCDCDC align=center>비용</td>
				<td>&nbsp
			<!--<select name = "cost_min" onChange = "checkCostMin()"> -->
			<select name = "cost_min">
			<option value="">
				<script>
					for (var i=0; i<=500 ; i+=5 )
					{	document.write("<option value="+i+">"+i);
					}
				</script> 
			</select>만원&nbsp~&nbsp&nbsp
			<!--<select name = "cost_max" onChange = "checkCostMin()"> -->
			<select name = "cost_max">
			<option value="">
				<script>
					for (var i=0; i<=500 ; i+=5 )
					{	document.write("<option value="+i+">"+i);
					}
				</script> 
			</select>만원
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<button value="">[비움]</button>
				</td>
			</tr>
			<tr>
				<td bgcolor=#DCDCDC align=center>키워드</td>
				<td>&nbsp
					<input type="text" name="key" size=20 maxlength=30>&nbsp
					<select name"or_and" class="or_and">
						<option value=""> </option>
						<option value="or">&nbsp;or</option>
						<option value="and">and</option>
					</select>&nbsp
					<input type="text" name="key" size=20 maxlength=30>&nbsp&nbsp&nbsp
					<button type="reset" id="key">[비움]</button>
				</td>
			</tr>
			
		</table>
		<BR>
<center><input type="button" name="search" value="검색" style="width:100px;" onClick="checkForm()">&nbsp;&nbsp;
		<input type="reset" name="asearch" value="초기화 후 모두 검색" style="width:200px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="tbcss2" style="cursor:pointer" onclick="">[지출보고서 등록]</span>
		<p>
		<span class="tbcss2">[다중 정렬] : 
		<select name="sort_multi">
			<option value=""></option>
		</select>  

		&nbsp&nbsp&nbsp&nbsp

		<!-- name은 spring에서 가져온대로 했습니다.  -->
		 <th><select name ="rowCntPerPage">
               <option value="10">10행보기
               <option value="20">20행보기
               <option value="30">30행보기
               <option value="40">40행보기
               <option value="50">50행보기
			</select>

	</form>



	<table class="table1" border="1">
	<tr align=center>
		<td bgcolor=#DCDCDC>번호</td>
		<td bgcolor=#DCDCDC>지출제목</td>
		<td bgcolor=#DCDCDC>지출분야</td>
		<td bgcolor=#DCDCDC>결재여부</td>
		<td bgcolor=#DCDCDC>결재/보류일</td>
		<td bgcolor=#DCDCDC>지출일</td>
		<td bgcolor=#DCDCDC>비용</td>
		<td bgcolor=#DCDCDC>지출수단</td>
		<td bgcolor=#DCDCDC>영수증번호</td>
		<td bgcolor=#DCDCDC>결재상황</td>
	</tr>
	</table>


</body>
</html>