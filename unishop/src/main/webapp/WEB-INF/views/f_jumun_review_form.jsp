<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.scripting.xmltags.ForEachSqlNode"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.text.DecimalFormat"%>

<div class="checkout-steps">
	<a class="active" href="jumun_review_form">4. 주문확인</a> <a
		class="completed" href="#"><span class="angle"></span><span
		class="step-indicator icon-circle-check"></span>3. 결제정보</a> <a
		class="completed" href="#"><span class="angle"></span><span
		class="step-indicator icon-circle-check"></span>2. 배송확인</a> <a
		class="completed" href="#"><span class="angle"></span><span
		class="step-indicator icon-circle-check"></span>1. 주소</a>
</div>
<h4>주문 확인</h4>
<hr class="padding-bottom-1x">
<div class="table-responsive shopping-cart">
	<table class="table">
		<thead>
			<tr>
				<th>상품명</th>
				<th class="text-center">수량</th>
				<th class="text-center">가격</th>
				<th class="text-center"></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:set var="sum" value="0" />


			<c:forEach items="${cartList}" var="cart" begin="0" step="1"
				end="${cartList.size()}" varStatus="status">


				<tr>

					<td>
						<div class="product-item">
							<a class="product-thumb"
								href="shop-single.jsp?product_no=${cart.product_no}"><img
								src="IMAGE/${cart.product_image_1}" alt="Product"></a>
							<div class="product-info">
								<h4 class="product-title">
									<a href="shop-single.html">${cart.product_name}</a>
								</h4>
								<span><em>Color:</em>${cart.cart_product_size}</span><span><em>Product
										No:</em>${cart.product_no}</span>
							</div>
						</div>
					</td>

					<td class="text-center">
						<div class="count-input">
							<select name="cart_qty" class="form-control">
								<option value="0" selected="selected">${cart.cart_qty}</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</div>
					</td>
					<td class="text-center text-lg text-medium">${cart.cart_tot_price}</td>
					<td class="text-center"><a class="remove-from-cart"
						href="cart_delete_cartNo_action_get?cart_no=${cart.cart_no}"
						data-toggle="tooltip" title="선택상품 삭제"><i class="icon-cross"></i></a></td>
					<td><input type=submit value="수량" data-toggle="tooltip"
						title="수량변경" class=TXTFLD
						onclick="location.href = 'cart_update_action_get'"> <input
						type="hidden" name=cart_no value="${cart.cart_no}"></td>

				</tr>

			</c:forEach>

		</tbody>
	</table>
</div>
<div class="shopping-cart-footer">
	<div class="column"></div>
	<div class="column text-lg">
		카트 합계: <span class="text-medium">${cart_subtotal}</span>
	</div>
</div>
<div class="row padding-top-1x mt-3">
	<div class="col-sm-6">
		<h5>받는분:</h5>
		<ul class="list-unstyled">
			<li><span class="text-muted">이름:</span>${loginMember.member_name}</li>
			<li><span class="text-muted">주소:</span>${loginMember.member_address1}</li>
			<li><span class="text-muted">연락처:</span>${loginMember.member_phone}</li>
		</ul>
	</div>
	<div class="col-sm-6">
		<h5>결제 수단:</h5>
		<ul class="list-unstyled">
			<li><span class="text-muted">카드 번호:</span>${createJumun.card_no}</li>
		</ul>
	</div>
</div>
<div class="checkout-footer margin-top-1x">
	<div class="column hidden-xs-down">
		<a  class="btn btn-outline-secondary" id="jumun_cancel_button" href="#"></i>&nbsp;주문취소</a>
	</div>
	<div class="column">
		<a id = "jumun_complete_button" class="btn btn-primary" href="jumun_review_action">계속</a>
	</div>
</div>
