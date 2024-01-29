<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../includes/header.jsp"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../../resources/dist/css/newBook.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    
    
	 <script type="text/javascript">
	 
		$(document).ready(function() {
				
				var actionForm = $("#actionForm");
				
				// 페이징, 페이지 이동 처리
				$(".paginate_button a").on("click", function(e) {
					
					e.preventDefault();
					
					console.log('click');
					
					console.log($(this).attr("href"));
	
					actionForm.find("input[name = 'pageNum']").val($(this).attr("href"));
					
					actionForm.submit(); 
					
				});
				
			});
		</script>

    </head>
    
					<div class="newBookWapper">
					<h2 class="title">신간 도서</h2>
						<div class="newBookProduct">
						
							<table>
								<tr>
									<td>번호</td>
									<td>표지</td>
									<td>제목</td>
									<td>가격</td>
									<td>출간일</td>
									<td>출판사</td>
									<td>작가번호</td>
								</tr>
								
								<c:forEach var="newBook" items="${newBookList}">
									<tr>
										<td>${newBook.bid}</td>
										<td class="mainimage">
											<c:forEach items="${newBook.attachList}" var="attach">
										    	<li>
										    	<img src="<c:url value='/sarak/display'/>?filename=<c:out value='${attach.uploadpath}/${attach.filename}'/>" alt="${newBook.bname}"/>
												</li>	
											</c:forEach>
										</td>
										<td>
											<div style="display: flex; align-items: center;">
												<div style="flex: 1;">
													<strong>${newBook.bname}</strong>
												</div>
											</div>
										</td>
										<td>${newBook.bprice}</td>
										<td>${newBook.isbn}</td>
										<td>${newBook.pubdate}</td>
										<td>${newBook.publisher}</td>
										<td>${newBook.authorid}</td>
									</tr>
									
									<!-- 줄거리 -->
									<tr>
										<td></td>
										<td colspan="7">
											<div class="summary">
												<strong>줄거리:</strong>
												${fn:substring(newBook.summary, 0, 30)}${fn:length(newBook.summary) > 30 ? '...' : ''}
											</div>
										</td>
									</tr>

								</c:forEach>
								
							</table>
							
							<!-- 페이징 영역 시작 -->
							<div class="pull-right">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="paginate_button previous"><a href="${pageMaker.startPage - 1}">이전</a></li>
										
									</c:if>
									
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
											<a href="${num}">${num}</a>
										</li>
									</c:forEach>
									
									<c:if test="${pageMaker.next}">
										<li class="paginate_button next"><a href="${pageMaker.endPage + 1}">다음</a></li>
									</c:if>
								</ul>
							</div>
							
							<form id='actionForm' action="/sarak/newBookList" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
							</form>
							
							
						</div>
					</div>	




<%@include file="../includes/footer.jsp"%>