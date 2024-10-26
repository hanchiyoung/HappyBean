<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
request.setCharacterEncoding("UTF-8");

int totalRecord = 0; // 전체 레코드 수
int numPerPage = 10; // 페이지당 레코드 수 
int pagePerBlock = 10; // 블록당 페이지 수 

int totalPage = 0; // 전체 페이지 수
int totalBlock = 0; // 전체 블록 수 

int nowPage = 1; // 현재 페이지
int nowBlock = 1; // 현재 블록

int start = 0; // 디비의 select 시작번호
int end = numPerPage; // 시작번호로부터 가져올 select 갯수

String keyField = "", keyWord = "";
Vector<BoardBean> vlist = null;

if (request.getParameter("keyField") != null && request.getParameter("keyWord") != null) {
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
}

if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

start = (nowPage - 1) * numPerPage;

totalRecord = bMgr.getTotalCount(keyField, keyWord);
totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sub/notice/list.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css">
<title>해피빈: 공지사항</title>
<script>
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}

	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}

	function block(value) {
		document.readFrm.nowPage.value =
<%=pagePerBlock%>
	* (value - 1) + 1;
		document.readFrm.submit();
	}

	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}

	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
</script>
</head>
<body>
	<header>
		<div class="w_max">
			<h1 class="logo">
				<a href="<%=request.getContextPath()%>/index.jsp"> <img
					src="<%=request.getContextPath()%>/images/common/logo_kr.svg"
					alt="해피빈">
				</a>
			</h1>
			<nav>
				<ul id="gnb">
					<li><a
						href="<%=request.getContextPath()%>/sub/donation/donation.jsp"><span>기부</span></a></li>
					<li><a
						href="<%=request.getContextPath()%>/sub/fundrasing/fundrasing.jsp"><span>진행중인
								모금함</span></a></li>
					<li><a
						href="<%=request.getContextPath()%>/sub/funding/funding.jsp"><span>펀딩</span></a></li>
					<li><a href="./sub/campaign/campaign.html"> <span>캠페인</span>
					</a></li>
					<li><a href="#"> <span>공지사항</span>
					</a></li>
				</ul>
			</nav>
			<div class="btn_container">
				<a href="#" id="login_btn"><span>로그인</span></a>
				<div id="search"></div>
			</div>
		</div>
	</header>

	<div id="wrap">
		<section class="w_max">
			<h2>공지 사항</h2>
			<table align="center" width="600">
				<tr>
					<td>게시물의 개수: 총 <%=totalRecord%>개 (<font color="red"><%=nowPage%>/<%=totalPage%>
							Pages</font>)
					</td>
				</tr>
			</table>
			<!-- 
			<form action="list.jsp" method="get">
				<input type="text" name="keyWord" placeholder="제목의 일부/전부를 검색"
					value="<%=keyWord%>">
				<button type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form> -->

			<table align="center" width="100%" cellpadding="2" cellspacing="0">
				<tr align="center" bgcolor="#D0D0D0" height="50">
					<td>번 호</td>
					<td>제 목</td>
					<td>작성된 날짜</td>
				</tr>
				<%
				vlist = bMgr.getBoardList(keyField, keyWord, start, end);
				int listSize = vlist.size(); // 브라우저에 보여질 게시물 갯수

				if (listSize == 0) {
					out.println("<tr><td colspan='5' align='center'>등록된 게시물이 없습니다.</td></tr>");
				} else {
					for (int i = 0; i < listSize; i++) {
						BoardBean bean = vlist.get(i);
				%>

				<tr>
					<td><%=(nowPage - 1) * numPerPage + i + 1%></td>
					<td><a href="read_for_user.jsp?id=<%=bean.getId()%>"> <%=bean.getTitle()%>
					</a></td>
					<td><%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(bean.getCreatedAt())%></td>
				</tr>
				<%
				} // for
				} // if
				%>
			</table>

			<ol>
				<li>
					<%
					// 이전 버튼: 첫 페이지일 때는 비활성화
					if (nowPage > 1) {
					%> <a href="list.jsp?nowPage=<%=nowPage - 1%>"> <span
						class="prev">이전</span>
				</a> <%
 } else {
 %> <a href="list.jsp?nowPage=<%=nowPage%>"> <span
						class="prev disabled">이전</span>
				</a> <%
 }
 %>

					<div class="page">
						<%
						// 페이지 번호 출력
						for (int i = 1; i <= totalPage; i++) {
						%>
						<a href="list.jsp?nowPage=<%=i%>"
							<%if (i == nowPage) {
	out.print("class='current'");
}%>> <%=i%>
						</a>
						<%
						}
						%>
					</div> <%
 // 다음 버튼: 마지막 페이지일 때는 비활성화
 if (nowPage < totalPage) {
 %> <a href="list.jsp?nowPage=<%=nowPage + 1%>"> <span class="next">다음</span>
				</a> <%
 } else {
 %> <a href="list.jsp?nowPage=<%=nowPage%>"> <span
						class="next disabled">다음</span>
				</a> <%
 }
 %>
				</li>
			</ol>


		</section>
	</div>
	<jsp:include page="/views/article.jsp" />

	<jsp:include page="/views/footer.jsp" />
	<script>
		const $progBar = document.querySelectorAll('.prog_bar')
		const $progValue = document.querySelectorAll('.prog_bar strong')
		const $progNum = document.querySelectorAll('.prog_num')

		for (let i = 0; i < $progValue.length; i++) {
			$progValue[i].style.width = $progNum[i].innerText
		}
	</script>
</body>
</html>
