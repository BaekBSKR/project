<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/notice/noticeDetail.css">
<title>공지사항 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
</script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	
	<div class="notice_content_wrap">
        <div class="notice_content_subject"><span>공지사항 상세</span></div>
        	<div class="notice_content_main">
            	<div class="form_section">
                	<div class="form_section_title">
                    	<label>제목</label>
                   	</div>
                   	
                   	<div class="form_section_content">
                   		<input class="input_block" name="n_title" readonly="readonly" value="<c:out value='${noticeInfo.n_title}'></c:out>">
                   	</div>
               	</div> 
               	                   
                <div class="form_section">
                	<div class="form_section_title">
                   		<label>내용</label>
                   	</div>
                   	
                   	<div class="form_section_content">
                   		<textarea class="input_block" name="n_comment" readonly="readonly"><c:out value='${noticeInfo.n_comment}'/></textarea>
                   	</div>
                </div>
                
                <div class="form_section_title">
                	<label>고객번호</label>
                </div>
                
                <div class="form_section_content">
                	<input class="input_block" name="cno" readonly="readonly" value="<c:out value='${noticeInfo.cno}'></c:out>">	
                </div>
                
                <div class="form_section">
                	<div class="form_section_title">
                   		<label>등록 날짜</label>
                   	</div>
                   	
                   	<div class="form_section_content">
                   		<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${noticeInfo.n_reg}" pattern="yyyy-MM-dd"/>">
                   	</div>
               </div>
               
				
              
             	<div class="btn_section">
              		<button id="cancelBtn" class="btn">목 록</button>
	                <button id="modifyBtn" class="btn modify_btn">수 정</button>
	                <button id="deleteBtn" class="btn delete_btn">삭 제</button>
	          	</div> 
			</div>                    
	</div>
                
    <form id="moveForm" method="get">
    	<input type="hidden" name="nno" value='<c:out value="${noticeInfo.nno}"/>'>
        <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
        <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>' >
        <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
    </form>
        
	<%@ include file="../includes/footer.jsp"%>
	
<script>
	let moveForm = $("#moveForm");

	// 공지사항 목록 이동
	$("#cancelBtn").on("click", function(e){
		
		e.preventDefault();
		
		$("input[name=nno]").remove();
		moveForm.attr("action", "/notice/noticeManage")
		moveForm.submit();
		
	});
	
	// 공지사항 수정 페이지 이동
	$("#modifyBtn").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.attr("action", "/notice/noticeModify");
		moveForm.submit();
		
	});
	
	// 공지사항 삭제
	$("#deleteBtn").on("click", function(e){
		e.preventDefault();
		moveForm.find("input").remove();
		moveForm.append('<input type="hidden" name="nno" value="${noticeInfo.nno}">');
		moveForm.attr("action", "/notice/noticeDelete");
		moveForm.attr("method", "post");
		moveForm.submit();
	});
</script>
</body>
</html>