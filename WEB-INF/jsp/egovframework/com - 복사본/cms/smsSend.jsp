<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>icodekorea sms module</title>
  <link rel="stylesheet" href="css/phone_body.css" type="text/css">
  <script src="js/msg.js" type="text/javascript"></script>
</head>
<body onload="setDate()">
<div id="phone_body">
  <form id="MsgForm" name="MsgForm" method="POST" action="./sms.jsp" onSubmit="return varcheck();">
  <input type="hidden" name="strTelList">
  <div class="head"><img src="sms_images/head.gif" alt="title"></div>
  <!-- 전송창 -->
  <div class="text" id="divLmsTitle" style="display: none;">
      <input type="text" name="strSubject" onchange="chkTitle()" value="제목을 입력하세요"/>
  </div>
  <div class="text">
      <textarea name="strData" class="sendsms" onchange="ChkLen()" onkeyup="ChkLen()" rows="7" cols="20"></textarea></div>
  <!-- 전송창 -->
  <!-- 바이트표시 -->
  <div class="byte">
      <table style="width: 100%;">
      <tr>
          <td class="white">
          <input type="text" name="strDataCount" size="3" style="border-color:#000000; border:solid 0; height: 14px; width: 18px; background-color: #5d5d5d; FONT-SIZE: 8pt; color:white" maxlength="3" value="0" readonly>
          /<div id="maxLength" style="display:inline;">90</div>
          </td>
          <td class="blue ar b">
          <div id="msgType" style="display:inline;" class="blue ar b">SMS</div>
          </td>
      </tr>
      </table>
  </div>
  <!-- //바이트표시 -->
  <!-- 받는번호 보내는번호 -->
  <div class="Numb">
      받는번호 <input type="text" name="addCallNum"><br />
      <div class="btnarea2">
      <span class="button1"><a href="javascript:addItem()">추가</a></span>
      <span class="button2"><a href="javascript:delItem()">삭제</a></span>
      </div>
      
      <select name="strDest" size="10" multiple class="sendNumb">
      <option value="0">--수신자 리스트--</option>
      </select>
      보낸번호 <input type="text" name="strCallBack">
  </div>
  <!-- //받는번호 보내는번호 -->
  <div class="line"></div>
  <!-- 즉시전송 예약전송선택 -->
  <div class="Rn">
      <table style="width:100%;">
      <tr> 
          <td style="width:50%;" class="ac"><input name="chkSendFlag" type="radio" value="0" onClick="CWCheck(this.form)" checked><div class="rt">즉시전송</div></td>
          <td style="width:50%;" class="ac"><input name="chkSendFlag" type="radio" value="1" onClick="CWCheck(this.form)"><div class="rt">예약전송</div></td>
      </tr> 
      </table>
  </div>

  <!--  예약시간 -->
  <!-- 입력 형식 ex : 2011년 05월 01일 오후 2시 02분 -->
  <!-- 년(4자리) : 2011 -->
  <!-- 월(2자리) : 05 -->
  <!-- 일(2자리) : 01 -->
  <!-- 시(2자리) : 14 -->
  <!-- 분(2자리) : 02 -->
  <div ID="sDest" class="Rn" STYLE="display:none">  
      <table style="width: 100%;border-top:dotted 1px">
      <tr> 
        <td style="padding-top:4px">
          <input type="text" name="R_YEAR"  size="4" maxlength="4" style="width:40px">년 
          <input type="text" name="R_MONTH" size="2" maxlength="2" style="width:30px">월
          <input type="text" name="R_DAY"   size="2" maxlength="2" style="width:30px">일
        </td>
      </tr>
      <tr> 
        <td>
          <input type="text" name="R_HOUR"  size="2" maxlength="2" style="width:30px">시 
          <input type="text" name="R_MIN"   size="2" maxlength="2" style="width:30px">분
        </td>
      </tr>
      </table>
  </div>
  <!--  //예약시간 -->

  <!-- //즉시전송 예약전송선택 -->
  <div class="line"></div>
  <!-- 발송버튼 -->
  <div class="btnarea">
      <input type="image" src="sms_images/btn_send.gif" alt="문자전송" style="width: 75px;height: 25px;">
      <a href="#" onclick="reset();"><img src="sms_images/btn_reset.gif" alt="다시쓰기"></a>    
  </div>
  <!-- //발송버튼 -->
  </form>
</div>
</body>
</html>
