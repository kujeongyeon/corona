<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Cover Template · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/cover/">

    <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/dist/css/bootstrap.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
            
	input[type="text"],
	select.form-control {
	  background: transparent;
	  border: none;
	  border-bottom: 1px solid #000000;
	  -webkit-box-shadow: none;
	  box-shadow: none;
	  border-radius: 0;
	  color: #ffffff;
	}
	
	 input[type="text"]:focus,
	select.form-control:focus {
	  -webkit-box-shadow: none;
	  box-shadow: none;
	} 

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/cover.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="masthead mb-auto">
    <div class="inner">
      <h3 class="masthead-brand">천일문</h3>
      <nav class="nav nav-masthead justify-content-center">
        <a class="nav-link" href="/coronasite/wordshow.do">메인</a>
        <a class="nav-link" href="/coronasite/wordlist.do">전체문장</a>
        <a class="nav-link active" href="/coronasite/wordtest.do">테스트</a>
      </nav>
    </div>
  </header>

  <main role="main" class="inner cover">
    <h1 class="cover-heading">문장 테스트</h1>
     <hr class="my-4">
    <form>
  <c:forEach items="${list}" var="word">
  <div class="form-group">
  <div class="row"> 
  <label class="control-label" class="col-sm-1 col-form-label" ></label>
  <label class="control-label" class="col-sm-10 col-form-label" >${word.content}</label>
  </div>
  <input type="text" class="form-control" id="content" value="${word.sentence}">
</div>
</c:forEach>
  <!-- <div class="form-group">
  <div class="row"> 
  <label class="control-label" class="col-sm-1 col-form-label" >2.</label>
  <label class="control-label" class="col-sm-10 col-form-label" >성공은 너의 삶의 투쟁으로부터 자라난다</label>
  </div>
  <input type="text" class="form-control" id="content" value="your success">
</div> -->
      <hr class="my-4">
  <div class="col-sm-3">
      <button type="submit" class="btn btn-dark mb-2">정답제출</button>
    </div>
</form> 
  </main>

  <footer class="mastfoot mt-auto">
    <div class="inner">
      <p>wordsite, by @cosmos8749@gmail.com</a>.</p>
    </div>
  </footer>
</div>
</body>
</html>