<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="../includes/header.jsp"%>


	<section class="container">
		<input id="select1" name="radioBanner" type="radio" class="banner_input1" checked="" />
        <label for="select1" class="label_btn1">1</label>

        <input id="select2" name="radioBanner" type="radio" class="banner_input2" />
        <label for="select2" class="label_btn2">2</label>

        <input id="select3" name="radioBanner" type="radio" class="banner_input3" />
        <label for="select3" class="label_btn3">3</label>

        <ul class="banner_mask">
            <li>
                <a href="#"><img src="" alt="중고장터 광고1"></a>
            </li>
            <li>
                <a href="#"><img src="" alt="중고장터 광고2"></a>
            </li>
            <li>
                <a href="#"><img src="" alt="이벤트"></a>
            </li>
        </ul>
	</section>
	
	<section>
		<div class="bestProductWapper">
			<div class="ProductNav">
				<div class="title">실시간 베스트셀러</div>
				<div class="more">더보기</div>
			</div>
			
			<ul class="productItem">
				<c:forEach items="${bestBookList}" var="best" varStatus="status">
					<c:if test="${status.index < 5}">
						<c:forEach items="${best.attachList}" var="attach" >
						   	<li>
						   	<img src="<c:url value='/sarak/display'/>?filename=<c:out value='${attach.uploadpath}/${attach.filename}'/>" alt="${best.bname}"/>
						   	</li>
						</c:forEach>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	<div class="newProductWapper">
		<div class="ProductNav">
			<div class="title">이번 달 신간 도서</div>
			<div class="more">더보기</div>
		</div>
		
		<ul class="productItem">
			<c:forEach items="${newBookList}" var="newBook" varStatus="status">
				<c:if test="${status.index < 5}">
					<c:forEach items="${newBook.attachList}" var="attach">
				    	<li>
				    	<img src="<c:url value='/sarak/display'/>?filename=<c:out value='${attach.uploadpath}/${attach.filename}'/>" alt="${newBook.bname}"/>
						</li>	
					</c:forEach>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	</section>



	<%@include file="../includes/footer.jsp"%>