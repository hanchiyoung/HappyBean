<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<!-- <link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index/footer.css" /> -->
<div class="bg">

	<article>
		<strong> <a
			href="<%=request.getContextPath()%>/sub/notice/list.jsp"> 공지사항 </a>
		</strong>

		<%
		// ID가 가장 큰 게시글의 title을 가져오는 메서드 호출
		String maxIdTitle = bMgr.getMaxIdTitle();
		int maxId = bMgr.getMaxId(); // ID도 가져오는 메서드 호출
		if (maxIdTitle != null) { // title이 null이 아닐 경우에만 출력
		%>
		<div class="max-id-title">
			<p>
				<a
					href="<%=request.getContextPath()%>/sub/notice/read_for_user.jsp?id=<%=maxId%>"><%=maxIdTitle%></a>
			</h3>
		</div>
		<%
		} else {
		%>
		<div class="max-id-title">
			<h3>최신 공지가 없습니다.</h3>
		</div>
		<%
		}
		%>
	</article>

</div>
<style>
.bg {
	margin-top: 40px;
	padding-top: 40px;
	border-top: 1px solid #ebebeb;
}

article {
	display: flex;
	flex-flow: row nowrap;
	justify-content: left;
	align-items: center;
	max-width: 1140px;
	margin: 0 auto;
	text-align: center;
}

article>strong {
	margin-right: 100px;
}
</style>
