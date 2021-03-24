<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	해당 제품 리뷰 리스트<hr>
	<c:forEach  items="${reviewList}" 
				var="review"  
				begin="0"  
				step="1" 
				end="${reviewList.size()}"
				varStatus="status">
		<li>번호 : ${review.review_no}</li>
		<li>작성자 : ${review.review_name}</li>
		<li>이메일 : ${review.review_email}</li>
		<li>제목 : ${review.review_title}</li>
		<li>점수 : ${review.review_rating}</li>
		<li>내용 : ${review.review_content}</li>
		<li>아이디 : ${review.member_id}</li>
		<li>제품번호 : ${review.product_no}</li>
	</c:forEach>
</body>
</html>