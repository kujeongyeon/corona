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
        <a class="nav-link active" href="/coronasite/wordlist.do">전체문장</a>
        <a class="nav-link" href="/coronasite/wordtest.do">테스트</a>
      </nav>
    </div>
  </header>

<main role="main" class="inner cover">
    <hr class="my-4">
<form action="/coronasite/wordadd.do">
	  <div class="form-group row">
	    <label for="exampleFormControlSelect1" class="col-sm-2 col-form-label">그룹</label>
	    <div class="col-sm-3">
	    <select id="category_select" name="category_select" class="form-control" id="exampleFormControlSelect1">
	    <c:forEach items="${categorylist}" var="category">
	      <option value="${category.cate}">${category.cate}</option>
	    </c:forEach>
	    <option value="make" selected="selected">직접입력</option>
	    </select>
	  </div>
	   <div class="col-sm-6">
	  <input type="text" name="category_input" id="category_input" class="form-control" id="formGroupExampleInput">
	  </div>
  </div>
   <div class="form-group row">
    <label for="exampleFormControlFile1" class="col-sm-2 col-form-label">음성파일</label>
    <div class="col-sm-10">
    <input type="file" name="voice" class="form-control-file" id="exampleFormControlFile1">
    </div>
  </div>

  <div class="form-group row">
    <label for="formGroupExampleInput" class="col-sm-2 col-form-label">문장</label>
     <div class="col-sm-10">
    <input type="text" name="sentence" class="form-control" id="formGroupExampleInput" placeholder="영어 문장을 입력하세요">
  	</div>
  </div>

   <div class="form-group row">
    <label for="formGroupExampleInput" class="col-sm-2 col-form-label">뜻</label>
    <div class="col-sm-10">
    <input type="text" name="content" class="form-control" id="formGroupExampleInput" placeholder="뜻을 입력하세요">
  </div>
  </div>


 <div class="col-auto">
      <button type="submit" class="btn btn-dark mb-2">문장추가</button>
    </div>
</form>  
  <hr class="my-4">
  <p class="lead">영어문장 테이블</p>
   	<table class="table table-sm table-striped table-dark">
   	<colgroup>
		<col width="15%">
		<col width="40%">
		<col width="35%">
		<col width="10%">
	</colgroup>
  <thead>
    <tr>
      <th scope="col">그룹</th>
      <th scope="col">문장</th>
      <th scope="col">뜻</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="word">
  <tr>
  	<td>${word.category}</td>
  	<td>${word.sentence}</td>
  	<td>${word.content}</td>
  	<td>-</td>
  </tr>
  </c:forEach>
 
  </tbody>
</table>
 <hr class="my-4">
  </main>

  <footer class="mastfoot mt-auto">
    <div class="inner">
      <p>wordsite, by @cosmos8749@gmail.com</a>.</p>
    </div>
  </footer>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
	<script type="text/javascript">
	
	/* 	$('#category_select').on("change",function(){
			$(this).val("make").prop("selected",true);
		}); */
		/* $('#category_select').change(function(){
			alert(this.value);
		})
		 */
		
		$(document).ready(function(){
			$("#category_select").selectmenu();
		})
		 
		$('#category_select').on("change",function(){
		//	$("#category_select option:selected").each(function(){
				
				if($(this).val()=="make"){
					$("#category_input").val('');
					$("#category_input").attr("disabled",false);					
				}else{
					$("#category_input").val($(this).val());
					$("#category_input").attr("disabled",true);					
				}
			//})
		});
		
	</script>	
</body>
</html>