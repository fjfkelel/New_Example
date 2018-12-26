<!-- JSP 기술의 한 종류인 [page Directive]를 이용하여 현 JSP 페이지 처리방식 선언하기 -->
<!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML이고, 이 문서는 UTF-8 방식으로 인코딩한다고 설정 -->
<!-- ******************************************************************************** -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="common1.jsp" %>

<!-- ******************************************************************************** -->
<!-- JSP 페이징서 사용할 CSS 파일 수입 -->
<!-- ******************************************************************************** -->

<center><span style="cursor:pointer" onclick="location.replace('/pro/loginForm.do')">[로그아웃]</span></center>