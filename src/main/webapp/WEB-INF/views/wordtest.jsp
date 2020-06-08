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
    <form action="/coronasite/wordtestlist.do">
     <div class="col-sm">
    <div class="form-group row">
	    <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">그룹</label>
	    <div class="col-sm-6">
	    
	    <select id="category" name="category" class="form-control" id="exampleFormControlSelect1">
	    <c:forEach items="${categorylist}" var="category">
	      <option value="${category.cate}">${category.cate}</option>
	    </c:forEach>
	    </select>
	    
	  </div>
  </div>
  </div>
  <div class="col-sm">
    <div class="form-group row">
	    <label for="exampleFormControlSelect1" class="col-sm-3 col-form-label">보여질 단어 수</label>
	    <div class="col-sm-2">
	    <select name="maxShowWord" class="form-control" id="exampleFormControlSelect1">
	      <option>1</option>
	      <option>2</option>
	      <option>3</option>
	      <option>4</option>
	      <option>5</option>
	    </select>
	  </div>
  </div>
  </div>
  <div class="col-sm-3">
      <button type="submit" class="btn btn-dark mb-2">테스트하기</button>
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