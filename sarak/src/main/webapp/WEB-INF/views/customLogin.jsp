<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

   <style>
   *{
	margin: 0 auto;
	padding:0;
	}
	
   	div.container{
   		position: relative;
   		width: 100%;
   		height: 500px;
   	}
   	
   	div.row{
   		position: absolute;
   		width: 40%;
   		top: 50%;
	    left: 50%;
	    margin-left: -50px; /* width의 50% */
	    margin-top: -50px; /* height의 50% */
	    text-align: center;
   	}
   	
   	div.body{
   		position: absolute;
   	}
   	fieldset{
   	 	border: 0;
   	}
   	
   	div.form-group{
   	
   	
   	}
   	
   	div input.form-control{
   		width: 200px;
   	
   	}
   
   
   </style>

</head>

<body>

    <div class="container">
        <div class="row">
                    <div class="header">
                        <h2 class="title">로그인</h2>
                    </div>
                    <div class="body">
                        <form role="form" method='post' action="/login">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="아이디를 입력해 주세요." name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호를 입력해 주세요." name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember-me" type="checkbox">간편 로그인 정보 저장
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input class="submitBtn" type="submit">
                            </fieldset>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
                        </form>
            </div>
           
        </div>
    </div>
    
     <div class="">
     	<p>아직 회원이 아니신가요?</p>
     	<a href="/register">회원가입</a>
     </div>

    
    <script>
    
    	$(".btn-success").on("click", function(e){
    		e.preventDefault();
    		
    		$("form").submit();
    	})
    </script>

</body>

</html>