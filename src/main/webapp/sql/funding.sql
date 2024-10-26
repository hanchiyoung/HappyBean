create database happypotato;
use happypotato;-- 

CREATE TABLE `FundingTBL` (
	`num` int(10) not null auto_increment, -- 게시글 번호
	`kategorie` varchar(20), -- 게시글 카테고리
    `status` varchar(10), -- 활성화 유무
    `title` varchar(50), -- 제목
    `thumb` varchar(200), -- 섬네일 이미지 주소 저장
    `company` varchar(20), -- 주최자
    `slogan` varchar(50), -- 주최회사 홍보문구
    `option` VARCHAR(200), -- 상품 선택 옵션
    `delivery_amount` int(10), -- 배송비
    `delivery_free` int(10), -- 무료배송이 가능해지는 구매금액
    `start_date` date DEFAULT NULL, -- 시작날짜
	`end_date` date DEFAULT NULL, -- 종료날짜
    `goal_amount` int(20), -- 목표금액
	`rased_amount` int(20), -- 누적금액
    `description` text, -- 본문내용  

	PRIMARY KEY ( `num` )
);

INSERT INTO `happypotato`.`FundingTBL` (`num`, `kategorie`, `status`, `title`, `thumb`, `company`, `slogan`, `option`, `delivery_amount`, `delivery_free`, `start_date`, `end_date`, `goal_amount`, `rased_amount`, `description`) VALUES ('1', '작은가게', '진행중', '과즙이 풍부한 황금빛 사과 \'시나노골드\'', 'thumb_02.jpg', '츠루베', '건강한 사과를 판매합니다.', '가정용] 영덕 시나노골드 3kg(약 9~12과){30000}, [선물용] 영덕 시나노골드 3kg(약 7~9과){40000}', '3500', '500000', '2024-09-25', '2024-10-20', '1000000', '0', '<h3>오직 지금만 누릴 수 있는 달콤함</h3><p>경북 영덕의 청정 자연 속에서 자란 황금빛 사과 \'시나노골드\'를 소개합니다. 시나노골드는 당도가 높고 과즙이 풍부해요. 황금빛 색상만큼 고급스럽게 달콤해, 한 번 맛보면 다시 찾게 되는 매력이 있죠. 일반 사과보다 칼로리가 낮아 더욱 건강하게 즐길 수 있답니다. 수확 기간이 짧아 오직 지금만 누릴 수 있는 귀한 열매를 만나보세요.</p><img src=\"./images/thumb_02_2.jpg\" alt=\"황금및 사과 시나노골드\"><h3>자연 친화적 재배로 키운 GAP 인증 사과</h3><p>불필요한 화학비료 대신 자연과 조화를 이루는 방식으로 재배합니다. GAP 인증을 받은 농장에서 믿을 수 있는 농법으로 키우며, 자연 그대로의 맛을 담아내고 있죠. 3대째 사과 농사를 이어온 농부님들은 매일 나무와 토양을 관리하고 있는데요. 뿌리를 타고 올라온 정성이 가지마다 맺혀, 저마다 달콤하고 아삭한 식감을 뽐내는 사과로 자라납니다.</p><span class=\"gr\">*GAP 인증번호 : 1009573</span><img src=\"./images/thumb_02_3.jpg\" alt=\"황금빛 사과 시나노골드\"><h3>3대째 온 가족의 정성이 담긴 농사</h3><p>건강한 사과를 전한다는 자부심은 온 가족이 1년 내내 쉼 없이 땀 흘릴 수 있는 원동력이 되어줍니다. 세대를 거쳐 쌓아온 노하우뿐 아니라, 교육과 연구를 통해 전문성을 더해가고 있어요.</p><br><p>이번 펀딩 후원금은 사과나무를 더 건강하게 키우기 위한 농자재 구매에 사용됩니다. 더 높은 품질의 사과를 전할 수 있도록 여러분의 많은 참여 부탁드립니다!</p><img src=\"./images/thumb_02_4.jpg\" alt=\"황금빛 사과 시나노 골드\"><h3 class=\"reward_info\">리워드 안내</h3><h4>영덕 시나노골드 사과</h4><p>경북 영덕군 구미리의 깨끗한 자연 속에서 키워낸 시나노골드 사과입니다. 신선한 제철 사과의 맛을 느끼실 수 있도록 새벽에 수확 후 당일 발송됩니다. 품질이 최대한 오래 유지되도록 사과 꼭지를 자르지 않고 보내드려요.</p><ul class=\"reward_option_list\"><li>구성 : 3kg / 5kg / 10kg</li><li><h5>옵션</h5><dl><dt>① 가정용</dt><dd>꼭지 상처, 껍질 소량 찍힘이 있거나 색상이 다소 옅은 제품이 포함될 수 있습니다. 사과의 맛과 품질은 선물용과 동일합니다.</dd><dt>② 선물용</dt><dd>가정용 시나노골드보다 크기가 크고 황금빛이 짙은 사과로 선별해 보내드립니다. 소중한 사람들에게 제철 과일의 맛을 선물해 보세요.</dd></dl></li><li><img src=\"./images/thumb_02_5.jpg\" alt=\"시나노 골드\"></li><li><h5>세척방법</h5><ul><li>• 베이킹소다나 식초를 이용하여 표면을 세척하고, 흐르는 물에 씻어 드세요.</li><li>• 건강하게 키운 GAP 인증 사과로, 세척 후에는 껍질째 드실 수 있습니다.</li></ul></li><li><h5>보관방법</h5><ul><li>• 신선도 유지를 위해 수령 즉시 냉장보관하세요.</li><li>• 한 알씩 키친타월로 감싸 보관하면, 수분 증발을 방지해 더욱 싱싱하게 드실 수 있습니다.</li></ul></li></ul><ul class=\"delivery_info_list\"><li><h5>결제 방법 및 배송방법</h5><ul><li>리워드는 해당 프로젝트 개설자가 제공합니다.</li><li>100% 달성 시에만 아래 지정일에 결제됩니다.</li></ul></li><li><h6 class=\"due_date_info\">결제 및 발송 예정일</h6><p class=\"deu_date fir\">1차 결제 : 2024년 10월 3일, 예상 발송일 : 2024년 10월 7일</p><p class=\"deu_date sec\">2차 결제 : 2024년 10월 10일, 예상 발송일 : 2024년 10월 14일</p></li></ul>');
select * from FundingTBL;