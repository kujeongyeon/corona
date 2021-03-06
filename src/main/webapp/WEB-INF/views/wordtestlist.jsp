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

	.text-under{
		color:red;
		display: flex;
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
 <div id="result"></div>
    <form id="frm">
  <c:forEach items="${list}" var="word" varStatus="status">
  <div class="form-group">
  <div class="row"> 
  <label class="control-label" class="col-sm-1 col-form-label" >${status.count}.</label>
  <label class="control-label" class="col-sm-10 col-form-label" >${word.content}</label>
  </div>
  <input type="hidden" name="wordVoList[${status.count-1}].idx" value="${word.idx}">
  <input type="text" name="wordVoList[${status.count-1}].sentence" class="form-control" id="content" value="${word.sentence}">
      <small id="under-${word.idx}" class="text-under"></small>
</div>
</c:forEach>
      <hr class="my-4">
</form> 
  <div class="col-sm-3">
      <button id="submitbutton" class="btn btn-dark mb-2">정답제출</button>
    </div>

  </main>

  <footer class="mastfoot mt-auto">
    <div class="inner">
      <p>wordsite, by @cosmos8749@gmail.com</a>.</p>
    </div>
  </footer>
</div>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$('#submitbutton').on('click',function(){
		$.ajax({
			url: "/coronasite/wordresult.do",
			type: "POST",
			dataType:"JSON",
			data: $("#frm").serialize(),
			 success : function(data) {
				 
				 if(data.error){
					 alert(data.error);
					 return false;
				 }
				 var stringJson = JSON.stringify(data);
                 console.log(stringJson);
				 
				 $.each(data.content,function(key,val){
					 
					 $('#under-'+val.idx).text(val.setence);
				 })
				  
				$('#result').text(data.result);
				},
				error : function(xhr, status , error){console.log("ajax ERROR!!! : " );}
			})
	})
</script>

</body>
</html>