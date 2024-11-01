<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int amount_held = Integer.parseInt(request.getParameter("amount_held"));
	String user_id = (String)session.getAttribute("idKey");
	if(user_id == null){
		%>
		<script>
			alert("잘못된 접근입니다.");
			location.href="./../index.jsp";
		</script>
		<%
	}
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="icon"
      href="./../images/common/favicon.ico"
      type="image/x-icon"
    />
    <link rel="stylesheet" href="./../css/reset.css" />
    <link rel="stylesheet" href="./../css/payment/payment.css" />
    <title>해피빈</title>
  </head>
  <body>
	<jsp:include page="/views/header.jsp" />
    <div id="wrap">
      <section id="payment">
        <div class="title_wrap w_max" style="display: none;">
          <h2 class="payment_title">
            슈퍼 태풍 야기로 초토화된 베트남, 어린이가 위험합니다.
          </h2>
          <p class="host">by <span>유니세프</span></p>
          <button
            type="button"
            class="page_back"
            onclick="history.back()"
          ></button>
        </div>

        <nav class="payment_choose_wrap w_max">
          <ul class="choose_list">
            <li style="display: none;">
              <input type="radio" name="choose_donation" id="amountPay" class="sr-only" checked onclick="formDisplay(0)">
              <label for="amountPay"><span class="sr-only">보유금액 기부하기</span></label>
            </li>

            <li style="display: none;">
              <input type="radio" name="choose_donation" id="regularPay" class="sr-only" onclick="formDisplay(1)">
              <label for="regularPay"><span class="sr-only">정기 기부하기</span></label>
            </li>

            
           
          </ul>
        </nav>

        <section id="payment_form_wrap" class="w_max" >
          <div class="title_wrap">
            <h2 class="slogan">"기부자님의 소중한 마음으로 놀라운 변화가 일어납니다"</h2>
            <p class="sub_slogan">투명한 기부 후기로 그 변화를 소개하고 보답하겠습니다.</p>
          </div>
          <!-- 보유금액 기부 form -->
          <form action="chargeProc.jsp" name="chargeFrm" method="post" id="amount_pay_form" autocomplete="off">
            <ul class="pay_list">
              <li class="bean_info_frame">
                <h3>보유 금액</h3>
                <strong class="current_bean">10,000,000</strong>원
                <!--<input type="hidden" name="amount_held" id="amount_held" value="<%= amount_held %>"> -->
                <input style="display: none;" type="checkbox" name="descOpen" id="descOpen" class="sr-only" checked>
                <label "for="descOpen"><span class="sr-only">콩이란?</span></label>
                <div style="display: none;" class="bean_desc_box">
                  <h4 class="desc_title">콩이란?</h4>
                  <p class="bean_desc">콩은 1개 = 100원의 가치를 가지는 해피빈에서의 기부수단입니다.</p>
                </div>
              </li>
              <li class="pay_choose_frame">
                <h3>충전 할 금액</h3>
                <input type="text" name="payBean" id="payBean" value="0" oninput="formatInput()"><span>원</span>
                <input type="radio" name="choose_amount" id="choose_10000" class="sr-only" value="10000" onclick="updateValue(this.value)">
                <label for="choose_10000">1만원</label>
                <input type="radio" name="choose_amount" id="choose_20000" class="sr-only" value="20000" onclick="updateValue(this.value)">
                <label for="choose_20000">2만원</label>
                <input type="radio" name="choose_amount" id="choose_30000" class="sr-only" value="30000" onclick="updateValue(this.value)">
                <label for="choose_30000">3만원</label>
                <input type="checkbox" name="fullAmount" id="fullAmount" class="sr-only" onclick="updateValue()">
                <label style="display: none;" for="fullAmount">전액 기부하기</label>
              </li>
              <li class="pay_notice_frame">
                <h4 class="notice">보유금액 및 충전금액 한도 안내</h4>
                보유금액 및 충전금액 한도는 최대 <strong>1000만원</strong>을 넘을 수 없습니다. ( 초과 충전/보유 시 1000만원까지만 보유 )
              </li>
              <li class="agree_frame">
                <ul class="agree_list">
                  <li>                    
                      <input type="checkbox" name="agree" id="all_agree" class="sr-only" value="selectAll" onclick="selectAll(this)">
                      <label for="all_agree">이용약관, 마케팅 알림 수신에 모두 동의합니다.</label>                    
                  </li>
                  <li>
                    <input type="checkbox" name="agree" id="terms_agree" class="sr-only" value="동의" required>
                    <label for="terms_agree">&#40필수&#41 해피빈 이용약관에 동의합니다.</label>
                  </li>
                  <li class="terms_desc_box">
                    <p class="terms_preview">해피빈 이용약관
    
    제 1 조 (목적)
    이 약관은 네이버 주식회사 및 재단법인 해피빈(이하 “회사”)과 회원 사이의 권리, 의무 및 책임, 기타 필요한 사항을 규정함을 목적으로 합니다.
    
    제 2 조 (용어의 정의)
    ① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
    1. “해피빈 서비스”라 함은 기부 서비스를 포함하여 펀딩, 공감가게, 가볼까 등 해피빈 웹사이트(happybean.naver.com 등, 이하 동일)에서 제공하는 모든 서비스를 말합니다.
    2. “회원”이라 함은 네이버 회원 중 본 약관에 동의하고 해피빈 서비스를 이용하는 자를 말합니다.
    3. “기부 서비스”라 함은 회사가 회원의 기부금을 모금단체에 전달하는 서비스를 말합니다.
    4. “기부금”이라 함은 회원이 무상으로 제공한 금전이나 물품으로 반대급부 없이 모금단체에 전달되는 것을 말합니다.
    5. “모금단체”라 함은 회사의 심사를 받고 가입하여 해피빈 웹사이트에서 노출되는 비영리 단체로 기부금을 전달받아 공익사업 등에 사용하는 단체를 말합니다.
    6. “콩”이라 함은 기부 서비스 내에서 사용할 수 있는 기부 통화수단으로 회원이 사용한 콩은 회사가 그 가치에 상응하는 현금으로 전환하여 모금단체 등에 전달합니다.
    7. “정기결제”라 함은 회원이 정한 금액이 지정된 날짜에 정기적으로 자동 결제되는 것을 말합니다.
    8. “정기기부”라 함은 회원이 정기결제한 금액이 회원이 선택한 모금함으로 기부되는 것을 말합니다.
    9. “정기저금”이라 함은 회원이 정기결제한 금액이 회원이 선택한 저금통에 적립되는 것을 말합니다.
    10. “해피로그”라 함은 회사의 심사를 받고 가입한 단체회원을 위하여 해피빈 서비스에 개설되는 블로그입니다.
    11. “공감가게”라 함은 회사가 선정한 사회적 기업으로 해피빈 웹사이트에서 그 상품이 노출되는 스마트스토어를 말합니다.
    12. “가볼까 서비스”라 함은 공익 단체 등이 개설한 현장 체험 프로젝트를 해피빈 웹사이트에서 노출하여 주는 것을 말합니다.
    ② 이 약관에서 사용하는 용어 중 본 조에서 정하지 아니한 것은 관계법령 및 각 서비스별 개별 약관에서 정하는 바에 의합니다.
    
    제 3 조 (약관의 명시 및 개정)
    ① 회사는 이 약관을 해피빈 서비스 초기화면에 게시하거나 회원이 연결화면을 통하여 볼 수 있도록 합니다.
    ② 회사가 이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 그 적용일자 7일 이전부터 적용일자 전일까지 서비스 내에 공지합니다. 다만, 회원에게 불리하게 약관내용을 변경하는 경우에는 적용일자 30일 전까지 공지하며, 추가로 적용일자 전일까지 전자우편, 문자메시지, 로그인시 동의창 등을 이용해 통지를 합니다.
    ③ 회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 일정 기간 내에 의사표시를 하지 않으면 약관 동의의 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
    ④ 회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사가 이용계약을 해지할 수 있습니다.
    
    제 4 조 (회원에 대한 통지)
    회사는 불특정다수 회원에 대한 통지의 경우 1주일 이상 해피빈의 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원의 권리·의무에 중대한 영향을 미치는 사항에 대하여는 전자우편 등을 통해 개별통지를 합니다.
    
    제 5 조 (기부 서비스의 이용)
    ① 회원은 기부 서비스를 이용하기 위해 실명인증된 네이버 ID로 로그인해야 합니다.
    ② 회원은 기부금 영수증을 발급받기 원하는 경우, 회원의 개인정보인 이름, 주민등록번호, 주소를 회사에 제공하는데 동의해야 합니다.
    ③ 회원은 전자 기부금 영수증을 발급받기 원하는 경우, 네이버에 제공한 암호화된 동일인 식별정보(CI)를 회사에 제공하는데 동의해야 합니다.
    ④ 회사가 기부금을 모금단체에 전달한 경우, 원칙적으로 회원은 기부금을 반환받을 수 없습니다. 단, 다음 각 호의 사유가 있는 경우 회원은 기부금 반환을 요청할 수 있습니다.
    1. 법적으로 기부금 반환요건이 있는 경우
    2. 기술적 오류로 기부금 전달이 잘못된 경우
    
    제 6 조 (기부 서비스의 제한)
    회사는 아래 각 호에 해당하는 경우 기부를 승낙하지 않을 수 있습니다.
    1. 실명이 아니거나 타인의 명의, 아이디를 도용하여 기부를 신청한 경우
    2. 기부신청 내용을 허위로 기재한 경우
    3. 회사의 명예에 부정적인 영향을 줄 수 있는 경우
    4. 부정한 행위나 과정을 통해 조성된 기부금으로 기부를 신청한 경우
    5. 영리를 추구할 목적으로 해피빈 서비스를 이용하고자 하는 경우
    6. 회사의 목적사업을 위반하며 기부를 신청한 경우
    7. 기타 이 약관 등을 위반하며 기부를 신청한 경우
    
    제 7 조 (콩의 사용 및 환불)
    ① 기부 서비스에서 사용 가능한 콩은 회사가 무상으로 배포한 콩과 회원이 결제하여 저금한 콩(결제기부 후 취소하여 돌려받은 콩 포함)으로 나눠집니다.
    ② 회사가 배포한 콩으로 기부를 한 경우, 기부금 관련 영수증이 발급되지 않습니다.
    ③ 회사가 배포한 콩은 현금 등으로 환급이 불가합니다.
    ④ 회사가 배포한 콩은 회사의 정책에 따라 일정한 유효기간이 있으며, 유효기간이 지난 콩은 사용이나 환급이 불가합니다.
    ⑤ 회원이 결제하여 저금한 콩(결제기부 후 취소하여 돌려받은 콩 포함)은 회원이 기부 등에 사용하기 전까지 환불받을 수 있습니다. 단, 환불은 전체 결제취소방식으로만 가능하며, 회원이 결제하여 저금한 콩(결제기부 후 취소하여 돌려받은 콩 포함)의 일부라도 사용한 경우 나머지 금액만 환불받을 수는 없습니다. ⑥ 회원이 결제하여 저금한 콩(결제기부 후 취소하여 돌려받은 콩 포함)은 10년간 미사용되는 경우 자동으로 소멸됩니다.
    
    제 8 조 (결제금액의 취소, 환불)
    회원이 기부 또는 저금 등을 위해 결제한 금액은 결제일로부터 7일 이내에 취소와 환불이 가능합니다. 단, 원 결제수단의 취소가 불가능한 사정이 있으면 환불이 제한될 수 있습니다.
    
    제 9 조 (정기결제 설정 등)
    ① 회원은 정기기부 또는 정기저금하기를 원하는 경우, 결제대행업체를 통해 정기결제를 신청해야 하며, 필요한 경우 결제대행업체의 약관 등에 동의해야 합니다.
    ② 회사는 정기결제서비스 제공주체가 아니며, 결제대행과정에서의 오류 등에 책임을 지지 않습니다. 단, 회사의 귀책사유로 결제가 이루어졌음에도 정기기부나 정기저금이 이루어지지 않은 경우, 회사는 해당 금원에 상응하는 콩을 회원에게 제공하는 등의 방법으로 회원에게 보상합니다.
    ③ 회원은 정기저금을 한 경우, 원하는 시점에 저금통에 적립된 금액을 모금함에 기부할 수 있습니다.
    ④ 회원은 정기기부 선택 시 정한 모금함을 변경하거나 정기저금 선택 시 정한 저금통을 변경하려면, 기존의 정기기부 또는 정기저금을 해지 후 다시 정기결제를 신청해야 합니다.
    ⑤ 회원은 정기기부 또는 정기저금을 해지하고자 할 경우, 직접 해피빈 서비스 페이지에서 해지신청을 해야 하며, 정기기부 또는 정기저금은 회원이 해지신청을 한 시점에 종료됩니다.
    ⑥ 정기결제는 매월 둘째 주 월요일에 진행되나, 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 서비스 오류, 휴일인 경우 등 상당한 이유가 있는 경우, 회원에 사전 고지 없이 정기결제일이 변경될 수 있습니다.
    ⑦ 정기결제 설정 후 결제정보 오류, 결제한도 초과 등 회원의 결제수단 관리 미비 혹은 불가항력적인 서비스 중지로 인해 3회 연속 결제가 진행되지 않는 경우 정기결제가 자동 해지됩니다.
    
    제 10 조 (기부내역의 확인)
    ① 회사를 통해 기부한 내역은 언제든지 해피빈 웹사이트에서 확인할 수 있습니다.
    ② 일부 모금단체의 경우 기부금 관련 영수증이 발급되지 않을 수 있으므로 회원은 기부하기 전 해피로그를 통해 기부금 관련 영수증 발급대상 단체인지를 확인해야 합니다.
    ③ 회원이 전항에 따라 기부금 관련 영수증 발급대상 단체인지를 확인하지 않고 기부한 경우, 회사는 기부금 관련 영수증이 발급되지 않는 점에 대해 책임을 지지 않습니다.
    
    제 11 조 (공감가게 서비스)
    ① 회사는 공감가게로 이동하는 링크를 제공하는 역할만을 하며 거래를 중개하거나 거래과정에 관여하지 않습니다.
    ② 회사는 공감가게가 독자적으로 제공하는 재화 및 용역에 의하여 회원과 이루어지는 거래에 대하여 보증 책임을 지지 않습니다.
    ③ 공감가게에서 이루어지는 거래에 대해서는 해당 공감가게의 이용약관이 우선 적용됩니다.
    
    제 12 조 (가볼까 서비스)
    ① 회사는 가볼까서비스에 개설된 프로젝트를 홍보하는 역할만을 하며, 프로젝트의 개설자인 공익 단체 등은 프로젝트 책임자로서 운영, 환불, 고객응대 등 역할을 수행합니다.
    ② 회사는 회원과 공익 단체 등 사이에 발생한 분쟁에 개입하지 않습니다.
    
    제 13 조 (회원의 의무)
    ① 회원은 기부 신청 또는 기부내용 변경 시 실명으로 모든 사항을 사실에 근거하여 작성하여야 하며, 허위 또는 타인의 정보를 등록할 경우 일체의 권리를 주장할 수 없습니다.
    ② 회원은 주소, 연락처, 전자우편 주소 등이 변경된 경우에 회원정보를 변경해야 하며, 회원정보 변경을 하지 않아 발생하는 손해는 회원이 책임을 집니다.
    ③ 회원은 기부내역 및 기부금 영수증의 관리의무가 있으며, 관리소홀, 부정사용 등에 의하여 발생한 손해는 회원이 책임을 집니다.
    ④ 회원은 회사의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.
    
    제 14 조 (회원의 금지행위)
    ① 회원은 다음 각 호에 해당하는 행위를 하여서는 안됩니다.
    1. 회원가입 신청 또는 회원정보 변경 시 허위내용을 등록하는 행위
    2. 다른 이용자의 ID, 비밀번호, 주민등록번호를 도용하는 행위
    3. 이용자 ID를 타인과 거래하는 행위
    4. 회사의 운영진, 직원 또는 관계자를 사칭하는 행위
    5. 무단으로 회사의 클라이언트 프로그램을 변경하거나, 회사의 서버를 해킹하거나, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위
    6. 해피빈 서비스에 위해를 가하거나 고의로 방해하는 행위
    7. 해피빈 서비스를 통해 얻은 정보를 회사의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용하거나, 제3자에게 제공하는 행위
    8. 공공질서 및 미풍양속에 위반되는 저속, 음란한 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위
    9. 모욕적이거나 개인신상에 대한 내용이어서 타인의 명예나 프라이버시를 침해할 수 있는 내용을 전송, 게시, 댓글 작성, 전자우편 발송 및 기타의 방법으로 타인에게 유포하는 행위
    10. 다른 이용자를 희롱 또는 위협하거나, 특정 이용자에게 지속적으로 고통 또는 불편을 주는 행위
    11. 동의 없이 다른 사용자의 개인정보를 수집 또는 저장하는 행위
    12. 범죄와 결부된다고 객관적으로 판단되는 행위
    13. 회사 및 제3자의 지식재산권을 침해하는 행위
    14. 이 약관 및 개별 서비스 약관을 포함하여 회사가 정한 제반 규정 또는 이용 조건을 위반하는 행위
    15. 기타 관계법령에 위배되는 행위
    ② 회원이 본 조에서 금지하는 행위를 한 경우, 회사는 회원의 서비스 이용을 제한하거나, 서비스 이용 계약을 해지할 수 있습니다.
    ③ 회사는 회원이 다른 이용자의 ID를 도용하여 취득하는 등 본 조 제1항을 위반하여 취득한 콩을 회수할 수 있습니다.
    
    제 15 조 (게시물의 관리)
    회사는 다음 각 호에 해당하는 게시물이나 댓글, 자료 등을 사전통지 없이 삭제하거나 이동 또는 등록 거부를 할 수 있습니다.
    1. 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
    2. 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
    3. 불법복제 또는 해킹을 조장하는 내용인 경우
    4. 영리를 목적으로 하는 광고일 경우
    5. 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
    6. 다른 회원 또는 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
    7. 회사가 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우
    8. 기타 관계법령에 위배된다고 판단되는 경우
    
    제 16 조 (게시물에 대한 저작권)
    ① 회사가 작성한 저작물에 대한 저작권 기타 지식재산권은 회사에 귀속됩니다.
    ② 회원이 해피빈 서비스 내에 게시하는 게시글 및 댓글은 검색결과 내지 서비스 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 회사는 저작권법을 준수하며, 회원은 언제든지 고객센터 또는 해피빈 서비스 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.
    ③ 회사는 제1항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우에는 전자우편 등을 통해 사전에 회원의 동의를 얻어야 합니다.
    
    제 17 조 (광고게재 및 광고주와의 거래)
    ① 회원은 해피빈 서비스 이용시 노출되는 광고게재에 대해 동의합니다.
    ② 회사는 해피빈 서비스상에 게재되어 있거나 해피빈 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다
    
    제 18 조 (개인정보의 보호)
    ① 회사는 이용자의 개인정보 수집시 해피빈 서비스 제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.
    ② 회사는 개인정보를 목적외의 용도로 이용하지 않으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 회원의 동의를 받습니다. 단, 관련 법령에 달리 정함이 있는 경우는 예외로 합니다.
    ③ 회사는 회원의 개인정보 보호를 위한 보안시스템을 마련합니다.
    
    제 19 조 (면책조항)
    ① 회사는 다음 각 호의 경우 책임을 지지 않습니다.
    1. 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우
    2. 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우
    3. 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 손해가 발생한 경우
    4. 회원의 귀책사유로 인한 서비스 이용의 장애 또는 손해가 발생한 경우
    5. 회원의 컴퓨터 오류에 의해 손해가 발생한 경우 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우.
    6. 회원이 해피빈 서비스를 이용하면서 얻은 자료를 활용하여 손해가 발생한 경우
    7. 회원이 해피빈 서비스를 이용하면서 타 회원으로 인해 정신적 피해를 입은 경우
    ② 회사는 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않습니다.
    ③ 회사는 회원 상호간 및 회원과 제3자 사이에 해피빈 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며, 이로 인한 손해를 배상할 책임도 없습니다.
    
    제 20 조 (서비스의 중단)
    ① 회사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
    ② 회사는 고의 또는 중과실이 없는 한 서비스의 제공이 일시적으로 중단됨으로 인하여 발생한 손해를 배상하지 않습니다.
    
    제 21 조 (재판권 및 준거법)
    ① 이 약관에 명시되지 않은 사항은 관계법령 및 네이버 이용약관에 따릅니다.
    ② 회사와 회원간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.
    
    &lt;부칙&gt;
      공지 일자 : 2023.11.30
      적용 일자 : 2024.01.01
                    </p>
                  </li>
                  <li>
                    <input type="checkbox" name="agree" id="ad_agree" class="sr-only" value="동의">
                    <label for="ad_agree">&#40선택&#41 해피빈 마케팅 알림 수신에 동의합니다.</label>  
                  </li>
                </ul>            

              </li>
            </ul>
            <div class="btn_box">
              <button type="button" onClick="check_input(chargeFrm.payBean.value)">충전하기</button>
              <button type="button" onclick="history.back()">모금함으로 돌아가기</button>
            </div>
          </form>    


        </section>

      </section>
    </div>

    <jsp:include page="/views/footer.jsp" />

    <script>      

      const $payBean = document.querySelector("input#payBean");
      const $current_bean = document.querySelector("strong.current_bean");
      const amount_held = <%= amount_held %>


      $payBean.addEventListener('focus',()=>{
        $payBean.setAttribute('placeholder', '');    
        $payBean.value = '';  
        
      });      
      
      $payBean.addEventListener('blur',()=>{
        $payBean.setAttribute('placeholder', '0');        
      });
     

      function formatNumber(num) {
    	const numStr = String(num);
        return numStr.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      }
      
      $current_bean.textContent = formatNumber(amount_held);
      

      function formatInput() {
        const rawValue = $payBean.value.replace(/,/g, '');
        const formattedValue = formatNumber(rawValue); 
        $payBean.value = formattedValue; 
      }
      
      function updateValue(value) {
        const $selectedRadio = document.querySelector('input[name="choose_amount"]:checked');
        const $selectedRadios = document.querySelectorAll('input[name="choose_amount"]');
        const $selectedCheckBox = document.querySelector('input[name="fullAmount"]');
        
             
        if($selectedRadio.checked) {
            $payBean.value = formatNumber(value);
            $selectedRadio.checked = false;
        }   
      };
      
      function check_input(payBean){
    	  	if(payBean == null || payBean == 0 || payBean == ""){
    	  		alert("충전할 금액을 입력해 주세요.");
    	  		document.chargeFrm.payBean.focus();
    	  		return;
    	  	}
    	  
    	  	payBean = payBean.replace(/,/g, '');
    	  	console.log(payBean);
    		// 숫자 유효성 검사
    		let flag = false; 
    		const payBeanArr = payBean.split("");
    		for(let i=0; i<payBeanArr.length; i++){
    			const trans = parseInt(payBeanArr[i]);
    			if(!Number.isInteger(trans))
    				flag = true;	
    		}
    		
    		if(flag){
    			alert("숫자만 입력해 주세요.");
    		    document.chargeFrm.payBean.value = "";
    		    document.chargeFrm.payBean.focus();
    			return;
    		}
    		
    		if(!document.getElementById('terms_agree').checked){
    			alert("필수 항목에 동의해 주세요.");
    			return;
    		}
    		
    		document.chargeFrm.payBean.value = payBean;
    		chargeFrm.submit();
      }

     
    </script>
  </body>
</html>
    