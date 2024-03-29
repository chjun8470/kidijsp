<% 
/**
 * @Class Name : EgovNtwrkSvcMntrngUpdt.jsp
 * @Description : 네트워크서비스모니터대상 수정
 * @Modification Information
 * @
 * @ 수정일               수정자          수정내용
 * @ ----------   --------  ---------------------------
 * @ 2010.08.17   장철호          최초 생성
 *   2018.11.02   신용호          표준프레임워크 v3.8 개선
 *
 *  @author 공통컴포넌트개발팀 장철호
 *  @since 2010.08.17
 *  @version 1.0 
 *  @see
 *  
 */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comUtlSysNsm.ntwrkSvcMntrng.title"/></c:set>
<!DOCTYPE html>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<script type="text/javascript">
	function fn_egov_init_NtwrkSvcMntrng(){
	
	}

	function fn_egov_update_ntwrksvcmntrng() {
		if (!validateNtwrkSvcMntrngVO(document.ntwrkSvcMntrngVO)){
			return;
		}
		
		if (confirm('<spring:message code="common.regist.msg" />')) {
			document.ntwrkSvcMntrngVO.action = "<c:url value='/utl/sys/nsm/updateNtwrkSvcMntrng.do'/>";
			document.ntwrkSvcMntrngVO.submit();					
		}
	}

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_list_ntwrksvcmntrng(){
		document.ntwrkSvcMntrngVO.action = "<c:url value='/utl/sys/nsm/selectNtwrkSvcMntrngList.do'/>";
		document.ntwrkSvcMntrngVO.submit();	
	}	

</script>
<style>
.layout-container form, div.board {
	width: auto !important;
}
</style>
</head>

<body onLoad="fn_egov_init_NtwrkSvcMntrng()">

<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="layout-container">

	<!-- 타이틀 -->
	<h2>${pageTitle} <spring:message code="title.update" /></h2>

<form:form commandName="ntwrkSvcMntrngVO" name="ntwrkSvcMntrngVO" method="post" action="${pageContext.request.contextPath}/utl/sys/nsm/updateNtwrkSvcMntrng.do">

<div class="wTableFrm">
	<!-- 등록폼 -->
	<table class="wTable">
	<caption>네트워크서비스모니터대상 수정</caption>
		<colgroup>
			<col style="width:20%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="comUtlSysNsm.ntwrkSvcMntrng.sysIp.label" /> <span class="pilsu">*</span></th><!-- 시스템IP -->
			<td class="left">
			    <form:input path="sysIp1" maxlength="3" title="시스템IP1" cssStyle="width:30px" /> . 
				<form:input path="sysIp2" maxlength="3" title="시스템IP2" cssStyle="width:30px" /> . 
				<form:input path="sysIp3" maxlength="3" title="시스템IP3" cssStyle="width:30px" /> .
				<form:input path="sysIp4" maxlength="3" title="시스템IP4" cssStyle="width:30px" />
				<div><form:errors path="sysIp1" cssClass="error"/></div>
				<div><form:errors path="sysIp2" cssClass="error"/></div>
				<div><form:errors path="sysIp3" cssClass="error"/></div>
				<div><form:errors path="sysIp4" cssClass="error"/></div>
			</td>
		</tr>
		<tr>
			<th><spring:message code="comUtlSysNsm.ntwrkSvcMntrng.sysPort.label" /> <span class="pilsu">*</span></th><!-- 시스템포트 -->
			<td class="left">
			    <form:input path="sysPort" maxlength="5" title="<spring:message code='comUtlSysNsm.ntwrkSvcMntrng.sysPort.label' />" cssStyle="width:40px"/>
      			<div><form:errors path="sysPort" cssClass="error"/></div>
			</td>
		</tr>
		<tr>
			<th><spring:message code="comUtlSysNsm.ntwrkSvcMntrng.sysNm.label" /> <span class="pilsu">*</span></th><!-- 시스템명 -->
			<td class="left">
			    <form:input path="sysNm" size="65" maxlength="255" title="<spring:message code='comUtlSysNsm.ntwrkSvcMntrng.sysNm.label' />"/>
      			<div><form:errors path="sysNm" cssClass="error"/></div>
			</td>
		</tr>
		<tr>
			<th><spring:message code="comUtlSysNsm.ntwrkSvcMntrng.mngrNm.label" /> <span class="pilsu">*</span></th><!-- 관리자명 -->
			<td class="left">
			    <form:input path="mngrNm" maxlength="60" title="<spring:message code='comUtlSysNsm.ntwrkSvcMntrng.mngrNm.label' />" cssStyle="width:100px"/>
      			<div><form:errors path="mngrNm" cssClass="error"/></div>
			</td>
		</tr>
		<tr>
			<th><spring:message code="comUtlSysNsm.ntwrkSvcMntrng.mngrEmailAddr.label" /> <span class="pilsu">*</span></th><!-- 관리자이메일주소 -->
			<td class="left">
			    <form:input path="mngrEmailAddr" size="25" maxlength="50" title="<spring:message code='comUtlSysNsm.ntwrkSvcMntrng.mngrEmailAddr.label' />"/>
  				<div><form:errors path="mngrEmailAddr" cssClass="error"/></div>
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value='<spring:message code="button.save" />' onclick="fn_egov_update_ntwrksvcmntrng(); return false;" /><!-- 저장 -->
		<span class="btn_s"><a href="<c:url value='/utl/sys/nsm/selectNtwrkSvcMntrngList.do'/>?searchWrd=<c:out value='${ntwrkSvcMntrngVO.searchWrd}'/>&amp;searchCnd=<c:out value='${ntwrkSvcMntrngVO.searchCnd}'/>&amp;pageIndex=<c:out value='${ntwrkSvcMntrngVO.pageIndex}'/>" onclick="fn_egov_list_ntwrksvcmntrng(); return false;"><spring:message code="button.list" /></a></span><!-- 목록 -->
	</div>
	<div style="clear:both;"></div>
</div>

<input type="hidden" id="oldSysIp" name="oldSysIp" value="<c:out value='${ntwrkSvcMntrngVO.sysIp}'/>"/>
<input type="hidden" id="oldSysPort" name="oldSysPort" value="<c:out value='${ntwrkSvcMntrngVO.sysPort}'/>"/>
<!-- 검색조건 유지 -->
<input type="hidden" name="searchWrd" value="<c:out value='${ntwrkSvcMntrngVO.searchWrd}'/>" />
<input type="hidden" name="searchCnd" value="<c:out value='${ntwrkSvcMntrngVO.searchCnd}'/>" />
<input type="hidden" name="pageIndex" value="<c:out value='${ntwrkSvcMntrngVO.pageIndex}'/>" />
<!-- 검색조건 유지 -->

</form:form>

</div>
<!-- end layout-container -->

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

