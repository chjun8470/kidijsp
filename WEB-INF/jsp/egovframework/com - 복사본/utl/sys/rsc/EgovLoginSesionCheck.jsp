<%--
/**
 * @Class Name  : EgovLoginSesionCheck.java
 * @Description : EgovLoginSesionCheck jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2010.09.01    lee.m.j     최초 생성
 * @ 2015.04.09	       전여철	      기본 url을 /index.do로 변경
 * @ 2018.11.02	       이정은	      공통컴포넌트 3.8 개선
 *
 *  @author lee.m.j
 *  @since 2010.07.01
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
--%>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>

<%@include
	file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script type="text/javaScript" language="javascript" defer="defer">
<!--
	function fncSelectLoginSession() {
		var varFrom = document.getElementById("loginSessionCheck");
		varFrom.action = "<c:url value='/utl/sys/rsc/loginSessionView.do'/>";
		varFrom.submit();
	}

	function fncSetLoginSession() {
		var varFrom = document.getElementById("loginSessionCheck");
		varFrom.action = "<c:url value='/utl/sys/rsc/setLoginSession.do'/>";

		if (confirm("<spring:message code="utlSysRsc.loginSessionCheck.validate.confirmSetLoginSession"/>")) {/* 설정 하시겠습니까? */
			varFrom.submit();
		}
	}

	function fncgetLoginSessionView(url) {
		window
				.open(url, "notice",
						"width=800, height=600, top=50, left=20, scrollbars=no, resizable=no");
	}

	-->
</script>
<style>
.wTableFrm {
	padding:0;
}
form#loginSessionCheck .btn_s{
	background: none!important;
}
form#loginSessionCheck .btn_s a {
    padding: .4rem .6rem;
    margin-left: 0;
    background: #6bc3b0 !important;
}
form#loginSessionCheck input.s_submit {
    margin-left: 0.3rem !important;
    margin-right: 0.7rem !important;
    padding: 0.2rem .6rem!important;
    /* display: block; */
    height: 2.2rem;
    margin-top: .25rem;
    background: #75c4e6;
}
</style>
</head>
<%
	// 세션 정보를 가져온다. LoginVO
	egovframework.com.cmm.LoginVO user = (egovframework.com.cmm.LoginVO) egovframework.com.cmm.util.EgovUserDetailsHelper
			.getAuthenticatedUser();
	String contextPath = request.getContextPath();
	if (user.getUrl() == null || user.getUrl().equals(""))
		user.setUrl(contextPath + "/index.do");
%>
<body>
	<noscript class="noScriptTitle">
		<spring:message code="common.noScriptTitle.msg" />
	</noscript>
	<!-- 자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다. -->

	<div class="layout-container">

		<div class="wTableFrm">
			<!-- 타이틀 -->
			<h2 class="loginSC">
				<spring:message code="utlSysRsc.loginSessionCheck.loginSessionCheck" />
			</h2>
			<!-- 로그인 세션정보 체크 -->
			<form:form commandName="loginSessionCheck" method="post"
				action="${pageContext.request.contextPath}/utl/sys/rsc/setLoginSession.do">


				<!-- 등록폼 -->
				<table class="wTable">
					<colgroup>
						<col style="width: 16%" />
						<col style="" />
					</colgroup>
					<tr>
						<th><spring:message code="utlSysRsc.loginSessionCheck.url" />
							<span class="pilsu">*</span></th>
						<!-- URL -->
						<td class="left"><label for="url"><input name="url"
								id="url" type="text" maxLength="1000" size="80" /></label></td>
					</tr>
					<tr>
						<th><spring:message
								code="utlSysRsc.loginSessionCheck.sessionURL" /> <span
							class="pilsu">*</span></th>
						<!-- 세션 URL -->
						<td class="left"><label for="sessionUrl"><input
								name="sessionUrl" id="sessionUrl" value="<%=user.getUrl()%>"
								type="text" maxLength="1000" size="80" readonly="readonly"
								class="readOnlyClass"></label></td>
					</tr>
				</table>

				<!-- 하단 버튼 -->
				<div class="btn">
					<span class="btn_s"><a
						href="<c:url value='/utl/sys/rsc/loginSessionView.do'/>"
						onclick="fncSelectLoginSession(); return false;"><spring:message
								code="button.inquire" /></a></span> <input class="s_submit" type="submit"
						value="<spring:message code="utlSysRsc.loginSessionCheck.set"/>"
						onclick="fncSetLoginSession(); return false;" />
					<!-- 설정 -->
					<span class="btn_s"><a href="<%=user.getUrl()%>" onclick=""
						target=“_blank” title="새창"
						onclick="fncgetLoginSessionView('<%=user.getUrl()%>'); return false;"><spring:message
								code="utlSysRsc.loginSessionCheck.sessionView" /></a></span>
					<!-- 이동 -->
				</div>
				<div style="clear: both;"></div>
			</form:form>
		</div>


	</div>


	<%@include
		file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>