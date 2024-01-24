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


	<%@include file="../includes/footer.jsp"%>