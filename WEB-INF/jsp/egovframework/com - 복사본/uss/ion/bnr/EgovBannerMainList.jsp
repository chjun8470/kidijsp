<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link href="<c:url value="/css/egovframework/com/com.css"/>" rel="stylesheet" type="text/css">
<%

/**
 * @Class Name : EgovBannerMainList.java
 * @Description : EgovBannerMainList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2009.02.01    lee.m.j     최초 생성
 * @ 2018.08.30    이정은               공통컴포넌트 3.8 개선 
 *
 *  @author lee.m.j
 *  @since 2009.03.21
 *  @version 1.0
 *  @see
 *  
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */
 
%>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>
 
<script type="text/javaScript" language="javascript" defer="defer">
/* ********************************************************
 * 조회
 ******************************************************** */
function fncSelectBanner(bannerId) {
    document.items.bannerId.value = bannerId;
    document.items.action = "<c:url value='/uss/ion/bnr/getBanner.do'/>";
    document.items.submit();     
} 
</script>
<style>
div.board {
    padding: 1rem;
    /* width: auto; */
    border-top: 3px solid #6bc3b0;
    border-bottom: 1px solid #6bc3b0;
    box-shadow: 3px 4px 6px #dbdbdb;
}
.layout-container form {
    padding: 0!important;
    /* width: auto; */
    border: 0!important;
    box-shadow: none!important;
}
input.btn01 {
	background:#6bc3b0;
	border:0;
	color:#fff;
}
</style>
</head>
<body>

<div class="layout-container">

	<h2><spring:message code="ussIonBnr.bannerMainList.bannerMainList"/></h2>

<div class="board">
<!-- MYPAGE배너관리 -->
<form name="items" method="post" action="<c:url value='/uss/ion/bnr/getBanner.do'/>">
	<span>※<spring:message code="ussIonBnr.bannerMainList.EgovBannerDc"/></span>

	<table class="datatables-demo table table-striped table-bordered dataTable no-footer">
		<caption></caption>
		<colgroup>
			<col style="" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
			   <th scope="col"><spring:message code="ussIonBnr.bannerMainList.bannerNm"/></th>
			   <th scope="col"><spring:message code="input.cSelect"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="banner" items="${bannerList}" varStatus="status">
			<tr>
				<td class="left">
					<a href="" onclick="fncSelectBanner('<c:out value="${banner.bannerId}"/>');return false;"><c:out value="${banner.bannerNm}"/></a>
				</td>
				<td>
					<input class="btn01" type="button" value="수정" onclick="fncSelectBanner('<c:out value="${banner.bannerId}"/>');return false;" />
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</div>

<input type="hidden" name="bannerId" value="">
<input type="hidden" name="pageIndex" value="1">
<input type="hidden" name="searchCondition" value="1">
<input type="hidden" name="searchKeyword" value="">
</form>

</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>

