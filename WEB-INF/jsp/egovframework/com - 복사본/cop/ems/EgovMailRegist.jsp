
<%
	/**
	 * @Class Name : EgovMailRegist.jsp
	 * @Description : 발송메일 등록 화면
	 * @Modification Information
	 * @
	 * @  수정일       수정자          수정 내용
	 * @ ----------   --------    ---------------------------
	 * @ 2009.03.11    박지욱          최초 생성
	 * @ 2011.12.06    이기하          첨부파일 기능 추가(fileStreCours)
	 *   2016.06.13    장동한          표준프레임워크 v3.6 개선
	 *
	 *  @author 공통서비스 개발팀 박지욱
	 *  @since 2009.03.11
	 *  @version 1.0
	 *  @see
	 *
	 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<c:set var="pageTitle">
	<spring:message code="comCopSymEms.regist.title" />
</c:set>

<%@include
	file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">

<script type="text/javascript"
	src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="sndngMailVO" staticJavascript="false"
	xhtml="true" cdata="false" />
<script type="text/javaScript" language="javascript">
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function fn_egov_regist_sndngMail(form) {

		if (!validateSndngMailVO(form)) {
			return false;
		} else {
			if (confirm("<spring:message code="common.regist.msg" />")) {
				form.action = "<c:url value='/cop/ems/insertSndngMail.do'/>";
				form.submit();
			}
		}
	}

	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fnInit() {
		var closeYn = document.sndngMailVO.closeYn.value;
		if (closeYn == "Y") {
			window.close();
		}
		document.sndngMailVO.recptnPerson.focus();
	}
</script>
<style>
.layout-container form, div.board {
	width: auto !important;
}
.wTableFrm table th, .wTable th {
    width: 25% !important;
}
.wTableFrm table td, .wTable td {
    width: 75% !important;
}
div.btn {
    margin-left: 45%;
}
</style>
</head>
<body onLoad="fnInit();">
	<!-- javascript warning tag  -->
	<noscript class="noScriptTitle">
		<spring:message code="common.noScriptTitle.msg" />
	</noscript>

	<div class="layout-container">
 

		<!-- 발송메일 등록 -->

		<div class="wTableFrm">
			<!-- 타이틀 -->
			<h2>메일발송</h2>
			<form:form name="sndngMailVO" method="post"
				enctype="multipart/form-data"
				action="${pageContext.request.contextPath}/cop/ems/insertSndngMail.do"
				onSubmit="fn_egov_regist_sndngMail(document.forms[0]); return false;">
				<input type="hidden" name="posblAtchFileNumber" value="1" />
				<!-- 파일첨부 개수 -->
				<input type="hidden" name="link" value="${resultInfo.link}" />
				<input type="hidden" name="closeYn" value="${closeYn}" />
				<input type="hidden" name="fileStreCours" />

				<!-- 등록폼 -->
				<table class="wTable"
					summary="<spring:message code="comCopSymEms.regist.summary" arguments="${pageTitle}" />">
					<caption>
						<spring:message code="comCopSymEms.regist.title" />
						<spring:message code="title.create" />
					</caption>
					<tbody>
						<!-- 입력 -->
						<c:set var="inputTxt">
							<spring:message code="input.input" />
						</c:set>
						<!-- 받는사람 -->
						<c:set var="title">
							<spring:message code="comCopSymEms.regist.receiver" />
						</c:set>
						<tr>
							<th>${title}<span class="pilsu">*</span></th>
							<td class="left"><input name="recptnPerson"
								id="recptnPerson" type="text" size="74"
								value="${resultInfo.recptnPerson}" maxlength="60"
								style="ime-mode: disabled;" tabindex="1"
								title="${title} ${inputTxt}" />
								<div>
									<form:errors path="recptnPerson" cssClass="error" />
								</div></td>
						</tr>
						<!-- 제목 -->
						<c:set var="title">
							<spring:message code="comCopSymEms.regist.title2" />
						</c:set>
						<tr>
							<th>${title}<span class="pilsu">*</span></th>
							<td class="nopd"><input name="sj" id="sj" type="text"
								size="74" value="${resultInfo.sj}" maxlength="250" tabindex="2"
								title="${title} ${inputTxt}" />
								<div>
									<form:errors path="sj" cssClass="error" />
								</div></td>
						</tr>
						<!-- 첨부파일 -->
						<c:set var="title">
							<spring:message code="comCopSymEms.regist.atch" />
						</c:set>
						<tr style="display: none;">
							<th>${title}</th>
							<td class="nopd">
								<table>
									<tr>
										<td><input name="file_1" id="egovComFileUploader"
											type="file" tabindex="3"
											onchange="this.select(); document.getElementById('egovComFileUploader').value=document.selection.createRange().text.toString();"
											title="${title} ${inputTxt}" /></td>
									</tr>
									<tr>
										<td>
											<div id="egovComFileList""></div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<!-- 발신내용 -->
						<c:set var="title">
							<spring:message code="comCopSymEms.regist.content" />
						</c:set>
						<tr>
							<th>${title}</th>
							<td class="nopd"><textarea id="emailCn" name="emailCn"
									cols="75" rows="25" tabindex="4" title="${title} ${inputTxt}" /></textarea>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 하단 버튼 -->
				<div class="btn">
					<input type="submit" class="s_submit"
						value="발송"
						title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
				</div>
				<div style="clear: both;"></div>


			</form:form>
			<script type="text/javascript">
				var maxFileNum = document.sndngMailVO.posblAtchFileNumber.value;
				if (maxFileNum == null || maxFileNum == "") {
					maxFileNum = 3;
				}
				var multi_selector = new MultiSelector(document
						.getElementById('egovComFileList'), maxFileNum);
				multi_selector.addElement(document
						.getElementById('egovComFileUploader'));
			</script>

		</div>
		<!-- div end(wTableFrm)  -->
	</div>

	<%@include
		file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>