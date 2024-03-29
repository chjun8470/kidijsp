<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>

<script type="text/javaScript" language="javascript">

function fncSelectLoginPolicyList() {
    var varFrom = document.getElementById("loginPolicy");
    varFrom.action = "<c:url value='/uat/uap/selectLoginPolicyList.do'/>";
    varFrom.submit();
}

function fncLoginPolicyUpdate() {
	
    var varFrom = document.getElementById("loginPolicy");
    varFrom.action = "<c:url value='/uat/uap/updtLoginPolicy.do'/>";

    if(confirm("<spring:message code="comUatUap.loginPolicyUpdt.validate.confirm.save"/>")){ //저장 하시겠습니까?
            if(ipValidate())
                varFrom.submit();
            else
                return;
    }
}

function fncLoginPolicyDelete() {
    var varFrom = document.getElementById("loginPolicy");
    varFrom.action = "<c:url value='/uat/uap/removeLoginPolicy.do'/>";
    if(confirm("<spring:message code="comUatUap.loginPolicyUpdt.validate.confirm.delete"/>")){ //삭제 하시겠습니까?
        varFrom.submit();
    }
}

function ipValidate() {

    var varFrom = document.getElementById("loginPolicy");
    var IPvalue = varFrom.ipInfo.value;

    var ipPattern = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
    var ipArray = IPvalue.match(ipPattern);

    var result = "";
    var thisSegment;

    if(IPvalue == "0.0.0.0") {
        alert(IPvalue + " : <spring:message code="comUatUap.loginPolicyUpdt.validate.info.exceptionIP"/>"); //예외 아이피 입니다.
        result = false;
    } else if (IPvalue == "255.255.255.255") {
        alert(result =IPvalue + " : <spring:message code="comUatUap.loginPolicyUpdt.validate.info.exceptionIP"/>"); //예외 아이피 입니다.
        result = false;
    } else {
        result = true;
    }

    if(ipArray == null) {
        alert("<spring:message code="comUatUap.loginPolicyUpdt.validate.info.invalidForm"/>"); //형식이 일치 하지않습니다.
        result = false;
    } else {
        for (var i=1; i<5; i++) {

            thisSegment = ipArray[i];

            if (thisSegment > 255) {
                alert("<spring:message code="comUatUap.loginPolicyUpdt.validate.info.invalidForm"/>"); //형식이 일치 하지않습니다.
                result = false;
            }

            if ((i == 0) && (thisSegment > 255)) {
                alert("<spring:message code="comUatUap.loginPolicyUpdt.validate.info.invalidForm"/>"); //형식이 일치 하지않습니다.
                result = false;
            }
        }
    }

    return result;
}

</script>

<style>
.layout-container form {
    width: 100% !important;
}

.wTableFrm table th, .wTable th {
	width: 30%;
}
.wTableFrm table td, .wTable td {
	width: 70%;
}
  
div.btn {
	margin-left: 35%;
}
</style>

</head>

<body>
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript><!-- 자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다. -->

<div class="layout-container">

	<!-- 타이틀 -->
	<h2><spring:message code="comUatUap.loginPolicyUpdt.pageTop.title"/></h2><!-- 로그인정책 수정 -->

	<div class="wTableFrm">
		<form:form commandName="loginPolicy" method="post" action="${pageContext.request.contextPath}/uat/uap/updtLoginPolicy.do' />">
			
			<!-- 등록폼 -->
			<table class="wTable">
				<colgroup>
					<col style="width:16%" />
					<col style="" />
				</colgroup>
				<tr>
					<th><spring:message code="comUatUap.loginPolicyUpdt.emplyrId"/> <span class="pilsu">*</span></th><!-- 사용자ID -->
					<td class="left">
					    <input name="emplyrId" id="emplyrId" title="<spring:message code="comUatUap.loginPolicyUpdt.emplyrId"/>" type="text" <c:if test="${registerFlag == 'UPDATE'}">readonly</c:if> value="<c:out value='${loginPolicy.emplyrId}'/>" readonly="readonly" style="width:180px" />
					</td>
				</tr>
				<tr>
					<th><spring:message code="comUatUap.loginPolicyUpdt.emplyrNm"/> <span class="pilsu">*</span></th><!-- 사용자명 -->
					<td class="left">
					    <input name="emplyrNm" id="emplyrNm" title="<spring:message code="comUatUap.loginPolicyUpdt.emplyrNm"/>" type="text" value="<c:out value='${loginPolicy.emplyrNm}'/>" maxLength="50" readonly="readonly" style="width:180px" /><!-- 사용자명 -->
					</td>
				</tr>
				<tr>
					<th><spring:message code="comUatUap.loginPolicyUpdt.ipInfo"/> <span class="pilsu">*</span></th><!-- IP정보 -->
					<td class="left">
					    <input name="ipInfo" id="ipInfo" title="<spring:message code="comUatUap.loginPolicyUpdt.ipInfo"/>" type="text" value="<c:out value='${loginPolicy.ipInfo}'/>" maxLength="23" size="30" >&nbsp;<form:errors path="ipInfo" /><!-- IP정보 -->
					</td>
				</tr>
				<tr>
					<th><spring:message code="comUatUap.loginPolicyUpdt.lmttAt"/> <span class="pilsu">*</span></th><!-- IP제한여부 -->
					<td class="left">
					    <select name="lmttAt" id="lmttAt" title="<spring:message code="comUatUap.loginPolicyUpdt.lmttAt"/>"><!-- IP제한여부 -->
						<option value="Y" <c:if test="${loginPolicy.lmttAt == 'Y'}">selected</c:if> >Y</option>
						<option value="N" <c:if test="${loginPolicy.lmttAt == 'N'}">selected</c:if> >N</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><spring:message code="comUatUap.loginPolicyUpdt.regDate"/> <span class="pilsu">*</span></th><!-- 등록일시 -->
					<td class="left">
					    <input name="regDate" id="regDate" title="<spring:message code="comUatUap.loginPolicyUpdt.regDate"/>" type="text" value="<c:out value='${loginPolicy.regDate}'/>" maxLength="50" readonly="readonly" style="width:180px" /><!-- 등록일시 -->
					</td>
				</tr>
			</table>
		
			<!-- 하단 버튼 -->
			<div class="btn">
				<input class="s_submit" type="submit" value='<spring:message code="button.save" />' onclick="fncLoginPolicyUpdate();return false;" /><!-- 저장 -->
				<span class="btn_s"><a href="<c:url value='/uat/uap/removeLoginPolicy.do'/>?emplyrId=<c:out value='${loginPolicyVO.emplyrId}'/>" onclick="fncLoginPolicyDelete(); return false;"><spring:message code="button.delete" /></a></span><!-- 삭제 -->
				<span class="btn_s"><a href="<c:url value='/uat/uap/selectLoginPolicyList.do'/>?pageIndex=<c:out value='${loginPolicyVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${loginPolicyVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncSelectLoginPolicyList(); return false;"><spring:message code="button.list" /></a></span><!-- 목록 -->
			</div>
			<div style="clear:both;"></div>
			<input type="hidden" name="dplctPermAt" value="Y" >
			<input type="hidden" name="searchCondition" value="<c:out value='${loginPolicyVO.searchCondition}'/>" >
			<input type="hidden" name="searchKeyword" value="<c:out value='${loginPolicyVO.searchKeyword}'/>" >
			<input type="hidden" name="pageIndex" value="<c:out value='${loginPolicyVO.pageIndex}'/>" >
		</form:form>
	</div>
</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

