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
	여성 스커트 리스트<hr>
	<c:forEach  items="${productList}" 
				var="product"  
				begin="0"  
				step="1" 
				end="${productList.size()}"
				varStatus="status">
		<li><a href="shop_product_detail?product_no=${product.product_no}">
		<img src=IMAGE/${product.product_image_1} width=100, height=100><br>${product.product_name}</a></li>
	</c:forEach>
</body>
</html>