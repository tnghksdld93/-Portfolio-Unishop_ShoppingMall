$(function() {
	
	/********************** jumun_payment_form 리셋버튼*************************/
	$(document).on('click','#jumun_payment_form_reset_button',function(e){
		$('#jumun_payment_form')[0].reset();
		$('#jumun_payment_form #card_no').focus();
	});
	
	/********************** 3. jumun_payment ----> jumun_review *************************/
	$(document).on('click', '#jumun_review_button', function(e) {
		$.ajax({
			url: 'rest_jumun_payment_action',
			method: 'POST',
			data: $('#jumun_payment_form').serialize(),
			success: function(str) {
				$.ajax({
					url: 'f_jumun_review_form',
					method: 'POST',
					success: function(html) {
						$('#check_out_display').html(html);
					}
				});
			}
		});
	});


	/********************** 2. jumun_delivery ----> jumun_payment /  & sidebar(합계금액) 작업 *************************/
	$(document).on('click', '#jumun_payment_button', function(e) {
		console.log('jumun_delivery ---->jumun_delivery action');
		$.ajax({
			url: 'rest_jumun_delivery_action',
			method: 'POST',
			data: $('#jumun_delivery_form').serialize(),
			success: function(data) {
				console.log('jumun_delivery ---->jumun_delivery action success');
			}
		});

		console.log('jumun_delivery ---->f_jumun_payment_form');
		$.ajax({
			url: 'f_jumun_payment_form',
			method: 'GET',
			success: function(html) {
				$('#check_out_display').html(html);
				console.log('jumun_delivery ---->f_jumun_payment_form success');

				$.ajax({
					url: 'rest_jumun_sidebar',
					method: 'GET',
					success: function(html) {
						var resultStr = html.trim().split('-');
						var tot = window.parseInt(resultStr[0]) + window.parseInt(resultStr[1]);
						$(delivery_fee).html(resultStr[1]);
						$(total_fee).html(tot);
						console.log('rest_jumun_sidebar ---->delivery_fee display');
					}
				});
			}
		});
	});


	/********************** 1. jumun_address----> jumun_delivery ****************************/
	$('#jumun_address_action_button').on('click', (function(e) {
		$.ajax({
			url: 'rest_jumun_address_action',
			method: 'POST',
			data: $('#jumun_address_form').serialize(),
			success: function() {
				console.log('jumun_address---->jumun_address_action');
			}
		});

		$.ajax({
			url: 'rest_jumun_delivery_form',
			method: 'GET',
			success: function() {
				var html = "";
				html += "<form name=\"jumun_delivery_form\" id=\"jumun_delivery_form\">";
				html += "			<div class=\"checkout-steps\"><a href=\"#\">4. 주문확인</a>";
				html += "   <a href=\"#\"><span class=\"angle\"></span>3. 결제정보</a>";
				html += "   <a class=\"active\" href=\"jumun_delivery_form\"><span class=\"angle\"></span>2. 배송방법</a>";
				html += "   <a class=\"completed\" href=\"#\"><span class=\"angle\"></span><span class=\"step-indicator icon-circle-check\"></span>1. 주소</a></div>";
				html += "   <h4>배송방법을 선택하시오</h4>";
				html += "   <hr class=\"padding-bottom-1x\">";
				html += "  <div class=\"ta3ble-responsive\">";
				html += "     <table class=\"table table-hover\">";
				html += "       <thead class=\"thead-default\">";
				html += "         <tr>";
				html += "           <th></th>";
				html += "           <th>배송 방법</th>";
				html += "           <th>평균 배송 시간</th>";
				html += "           <th>배송료</th>";
				html += "         </tr>";
				html += "       </thead>";
				html += "       <tbody>";
				html += "         <tr>";
				html += "           <td class=\"align-middle\">";
				html += "             <div class=\"custom-control custom-radio mb-0\">";
				html += "               <input class=\"custom-control-input\" type=\"radio\" id=\"GEN\" name=\"deliveryStr\" value=\"일반\" checked>";
				html += "               <label class=\"custom-control-label\" for=\"GEN\"></label>";
				html += "             </div>";
				html += "           </td>";
				html += "           <td class=\"align-middle\"><span class=\"text-medium\">일반배송</span><br><span class=\"text-muted text-sm\">*제주도 및 도서 산간지역은 기본배송료 + 추가운임비</span></td>";
				html += "          <td class=\"align-middle\">3 - 4 일</td>";
				html += "           <td class=\"align-middle\">3000 원</td>";
				html += "         </tr>";
				html += "         <tr>";
				html += "           <td class=\"align-middle\">";
				html += "             <div class=\"custom-control custom-radio mb-0\">";
				html += "               <input class=\"custom-control-input\" type=\"radio\" id=\"EX\"  name=\"deliveryStr\" value=\"특급\">";
				html += "               <label class=\"custom-control-label\" for=\"EX\"></label>";
				html += "             </div>";
				html += "           </td>";
				html += "           <td class=\"align-middle\"><span class=\"text-medium\" data-특급>특급배송</span><br><span class=\"text-muted text-sm\">*제주도 및 도서 산간지역은 기본배송료 + 추가운임비</span></td>";
				html += "           <td class=\"align-middle\">1 - 2 일</td>";
				html += "           <td class=\"align-middle\">6000 원</td>";
				html += "         </tr>";
				html += "       </tbody>";
				html += "    </table>";
				html += "   </div>";
				html += "   <div class=\"checkout-footer margin-top-1x\">";
				html += "     <div class=\"column\"><a id=\"jumun_cancel_button\" class=\"btn btn-outline-secondary\" href=\"#\"></i><span class=\"hidden-xs-down\">&nbsp;주문취소</span></a></div>";
				html += "     <div class=\"column\"><a id=\"jumun_payment_button\" class=\"btn btn-primary\" href=\"#\"><span class=\"hidden-xs-down\">계속&nbsp;</span><i class=\"icon-arrow-right\"></i></a></div>";
				html += "   </div>";
				html += "  </form>";
				console.log('jumun_address----> jumun delivery==>' + html);
				$('#check_out_display').html(html);
			}
		});
		e.preventDefault();
	}));


});











/*
		// jumun_address <----- jumun_delivery
		$(document).on('click', '#jumun_back_address_button', function(e) {
			$.ajax({
			url: 'rest_jumun_back_address_action',
			method: 'POST',
			data: $('#jumun_address_form').serialize(),
			success: function() {
				console.log('jumun_address---->jumun_address_action');
			}
		});
		
			$.ajax({
				url: 'rest_jumun_address_form',
				method: 'POST',
				success: function(resultStr) {
					html = "";
					
					if (resultStr.trim() == 'true') {
						html += "<form name=\"jumun_address_form\" id=\"jumun_address_form\">";
						html += "	<div class=\"checkout-steps\">";
						html += "		<a href=\"#\">4. 주문확인</a>";
						html += "		<a href=\"#\"><span class=\"angle\"></span>3. 결제정보</a>";
						html += "		<a href=\"#\"><span class=\"angle\"></span>2. 배송방법</a>";
						html += "		<a class=\"active\" href=\"#\"><span class=\"angle\"></span>1.주소</a>";
						html += "	</div>";
						html += "	<h4>주소</h4>";
						html += "	<hr class=\"padding-bottom-1x\">";
						html += "	<div class=\"row\">";
						html += "		<div class=\"col-sm-6\">";
						html += "			<div class=\"form-group\">";
						html += "				<label for=\"checkout-fn\">주문자 이름</label> ";
						html += "				<input class=\"form-control\" type=\"text\" id=\"checkout-fn\" name=\"member_name\" >";
						html += "			</div>";
						html += "		</div>";
						html += "		<div class=\"col-sm-6\">";
						html += "			<div class=\"form-group\">";
						html += "				<label for=\"checkout-ln\">전화번호</label> ";
						html += "				<input class=\"form-control\" type=\"text\ id=\"checkout-ln\" name=\"member_phone\" >";
						html += "			</div>";
						html += "		</div>";
						html += "	</div>";
						html += "	<div class=\"row\">";
						html += "		<div class=\"col-sm-6\">";
						html += "			<div class=\"form-group\">";
						html += "				<label for=\"checkout-company\">주소명</label> <input";
						html += "					class=\"form-control\" type=\"text";
						html += "					name=\"member_address_name\">";
						html += "			</div>";
						html += "		</div>";
						html += "		<div class=\"col-sm-6\">";
						html += "			<div class=\"form-group\">";
						html += "				<label for=\"checkout-country\">국가</label> <select";
						html += "					class=\"form-control\" id=\"checkout-country";
						html += "					name=\"member_address_country\">";
						html += "					<option></option>";
						html += "					<option value=\"대한민국\">대한민국</option>";
						html += "					<option value=\"캐나다\">캐나다</option>";
						html += "					<option value=\"프랑스\">프랑스</option>";
						html += "					<option value=\"독일\">독일</option>";
						html += "					<option value=\"미국\">미국</option>";
						html += "					<option value=\"뉴질랜드\">뉴질랜드</option>";
						html += "				</select>";
						html += "			</div>";
						html += "		</div>";
						html += "	</div>";
						html += "	<div class=\"row\">";
						html += "		<div class=\"col-sm-6\">";
						html += "			<div class=\"form-group\">";
						html += "				<label for=\"checkout-city\">도시</label> <select";
						html += "					class=\"form-control\" id=\"checkout-city";
						html += "					name=\"member_address_city\">";
						html += "					<option></option>";
						html += "					<option value=\"서울\">서울</option>";
						html += "					<option value=\"인천\">인천</option>";
						html += "					<option value=\"부산\">부산</option>";
						html += "					<option value=\"대전\">대전</option>";
						html += "					<option value=\"익산\">익산</option>";
						html += "				</select>";
						html += "			</div>";
						html += "		</div>";
						html += "		<div class=\"col-sm-6\">";
						html += "			<div class=\"form-group\">";
						html += "				<label for=\"checkout-zip\">우편번호</label> <input";
						html += "					class=\"form-control\" type=\"text\" id=\"checkout-zip";
						html += "					name=\"member_address_zipcode\">";
						html += "			</div>";
						html += "		</div>";
						html += "	</div>";
						html += "	<div class=\"row padding-bottom-1x\">";
						html += "			<div class=\"col-sm-6\">";
						html += "				<div class=\"form-group\">";
						html += "					<label for=\"checkout-address1\">주소1</label> <input";
						html += "						class=\"form-control\" type=\"text\" id=\"checkout-address1\"";
						html += "						name=\"member_address1\" >";
						html += "				</div>";
						html += "			</div>";
						html += "			<div class=\"col-sm-6\">";
						html += "				<div class=\"form-group\">";
						html += "					<label for=\"checkout-address2\">상세주소</label> <input";
						html += "						class=\"form-control\" type=\"text\" id=\"checkout-address2\"";
						html += "						name=\"member_address2\" >";
						html += "				</div>";
						html += "			</div>";
						html += "		</div>";
						html += "	<h4>배송지 주소</h4>";
						html += "	<hr class=\"padding-bottom-1x\">";
						html += "	<div class=\"form-group\">";
						html += "		<div class=\"custom-control custom-checkbox\">";
						html += "			<input class=\"custom-control-input\" type=\"checkbox";
						html += "				id=\"same_address\" checked> <label";
						html += "				class=\"custom-control-label\" for=\"same_address\">회원정보와 동일</label>";
						html += "		</div>";
						html += "	</div>";
						html += "	<div class=\"checkout-footer\">";
						html += "		<div class=\"column\">";
						html += "			<a class=\"btn btn-outline-secondary\" href=\"cart_list\"><i";
						html += "				class=\"icon-arrow-left\"></i><span class=\"hidden-xs-down\">&nbsp;카트로";
						html += "					돌아가기</span></a>";
						html += "		</div>";
						html += "		<div class=\"column\">";
						html += "			<a class=\"btn btn-primary\"";
						html += "				id=\"jumun_address_action_button\"";
						html += "				href=\"#\"><span";
						html += "				class=\"hidden-xs-down\">계속&nbsp;</span><i";
						html += "				class=\"icon-arrow-right\"></i></a>";
						html += "		</div>";
						html += "	</div>";
						html += "	</form>";

						$('#check_out_display').html(html);
						
						
						
					}
				}
			});
			e.preventDefault();
		});
		
		
		
		
		// jumun_delivery <----- jumun_payment
		$(document).on('click', '#jumun_back_delivery_button', function(e) {
			$.ajax({
				url: 'rest_jumun_delivery_form',
				method: 'GET',
				success: function(resultStr) {
					alert('jumun_delivery <----- jumun_payment 실행');
					html = "";
					if (resultStr.trim() == 'true') {
						
					html += "			<div class=\"checkout-steps\"><a href=\"#\">4. 주문확인</a>";
						html += "   <a href=\"#\"><span class=\"angle\"></span>3. 결제정보</a>";
						html += "   <a class=\"active\" href=\"#\"><span class=\"angle\"></span>2. 배송방법</a>";
						html += "   <a class=\"completed\" href=\"#\"><span class=\"angle\"></span><span class=\"step-indicator icon-circle-check\"></span>1. 주소</a></div>";
						html += "   <h4>배송방법을 선택하시오</h4>";
						html += "   <hr class=\"padding-bottom-1x\">";
						html += "  <div class=\"ta3ble-responsive\">";
						html += "     <table class=\"table table-hover\">";
						html += "       <thead class=\"thead-default\">";
						html += "         <tr>";
						html += "           <th></th>";
						html += "           <th>배송 방법</th>";
						html += "           <th>평균 배송 시간</th>";
						html += "           <th>배송료</th>";
						html += "         </tr>";
						html += "       </thead>";
						html += "       <tbody>";
						html += "         <tr>";
						html += "           <td class=\"align-middle\">";
						html += "             <div class=\"custom-control custom-radio mb-0\">";
						html += "               <input class=\"custom-control-input\" type=\"radio\" id=\"GEN\" name=\"deliveryStr\" value=\"일반\" checked>";
						html += "               <label class=\"custom-control-label\" for=\"GEN\"></label>";
						html += "             </div>";
						html += "           </td>";
						html += "           <td class=\"align-middle\"><span class=\"text-medium\">일반배송</span><br><span class=\"text-muted text-sm\">*제주도 및 도서 산간지역은 기본배송료 + 추가운임비</span></td>";
						html += "          <td class=\"align-middle\">3 - 4 일</td>";
						html += "           <td class=\"align-middle\">3000 원</td>";
						html += "         </tr>";
						html += "         <tr>";
						html += "           <td class=\"align-middle\">";
						html += "             <div class=\"custom-control custom-radio mb-0\">";
						html += "               <input class=\"custom-control-input\" type=\"radio\" id=\"EX\"  name=\"deliveryStr\" value=\"특급\">";
						html += "               <label class=\"custom-control-label\" for=\"EX\"></label>";
						html += "             </div>";
						html += "           </td>";
						html += "           <td class=\"align-middle\"><span class=\"text-medium\" data-특급>특급배송</span><br><span class=\"text-muted text-sm\">*제주도 및 도서 산간지역은 기본배송료 + 추가운임비</span></td>";
						html += "           <td class=\"align-middle\">1 - 2 일</td>";
						html += "           <td class=\"align-middle\">6000 원</td>";
						html += "         </tr>";
						html += "       </tbody>";
						html += "    </table>";
						html += "   </div>";
						html += "   <div class=\"checkout-footer margin-top-1x\">";
						html += "     <div class=\"column\"><a id=\"jumun_back_address_button\" class=\"btn btn-outline-secondary\" href=\"#\"><i class=\"icon-arrow-left\"></i><span class=\"hidden-xs-down\">&nbsp;뒤로</span></a></div>";
						html += "     <div class=\"column\"><a id=\"jumun_payment_button\" class=\"btn btn-primary\" href=\"#\"><span class=\"hidden-xs-down\">계속&nbsp;</span><i class=\"icon-arrow-right\"></i></a></div>";
						html += "   </div>";
						html += "  </form>";

						$('#check_out_display').html(html);
					}
				}
			});

			e.preventDefault();
		});
		
		
		// jumun_payment <----- jumun_review
		$(document).on('click', '#jumun_back_payment_button', function(e) {
			$.ajax({
				url: 'rest_jumun_payment_form',
				method: 'POST',
				success: function(resultStr) {
					html = "";
					if (resultStr.trim() == 'true') {
						
	          		html += "<div class=\"checkout-steps\">";
	            	html += "<a href=\"#\">4. 주문확인</a>";
	            	html += "<a class=\"active\" href=\"#\"><span class=\"angle\"></span>3. 결제정보</a>";
	            	html += "<a class=\"completed\" href=\"#\"><span class=\"angle\"></span><span class=\"step-indicator icon-circle-check\"></span>2. 배송확인</a>";
	            	html += "<a class=\"completed\" href=\"#\"><span class=\"angle\"></span><span class=\"step-indicator icon-circle-check\"></span>1. 주소</a>";
            		html += "</div>";
		            html += "<h4>결제 방법을 선택하시오</h4>";
		            html += "<hr class=\"padding-bottom-1x\">";
		            html += "<div class=\"accordion\" id=\"accordion\" role=\"tablist\">";
              		html += "<div class=\"card\">";
                	html += "<div class=\"card-header\" role=\"tab\">";
                    html += "<h6><a href=\"#card\" data-toggle=\"collapse\"><i class=\"icon-columns\"></i>신용카드 결제</a></h6>";
                	html += "</div>";
                	html += "<div class=\"collapse show\" id=\"card\" data-parent=\"#accordion\" role=\"tabpanel\">";
                    html += "<div class=\"card-body\">";
                    html += "<p>결제 가능한 신용카드:&nbsp;<img class=\"d-inline-block align-middle\" src=\"img/credit-cards.png\" style=\"width: 120px;\" alt=\"Cerdit Cards\"></p>";
                    html += "<div class=\"card-wrapper\"></div>";
                    html += "<form class=\"interactive-credit-card row\"  id=\"jumun_payment_form\" name=\"jumun_payment_form\" >";
                    html += "<div class=\"form-group col-sm-6\">";
                    html += "<input class=\"form-control\" type=\"text\" name=\"card_no\"  placeholder=\"card_no\" required>";
	                html += "</div>";
	                html += "<div class=\"form-group col-sm-6\">";
                    html += "<input class=\"form-control\" type=\"text\" name=\"card_member_name\"  placeholder=\"name\" required>";
                    html += "</div>";
                    html += "<div class=\"form-group col-sm-3\">";
                    html += "<input class=\"form-control\" type=\"text\" name=\"card_expire_date\"  placeholder=\"MM/YY\" required>";
                    html += "</div>";
                    html += "<div class=\"form-group col-sm-3\">";
                    html += "<input class=\"form-control\" type=\"text\" name=\"card_cvc\"  placeholder=\"CVC\" required>";
                    html += "</div>";
              		html += "<div class=\"col-sm-6\">";
					html += "<button class=\"btn btn-outline-primary btn-block margin-top-none\" type=\"submit\">clear</button>";
                    html += "</div>";
                    html += "</form>";
                    html += "</div>";
                	html += "</div>";
              		html += "</div>";
            		html += "</div>";
            		html += "<div class=\"checkout-footer margin-top-1x\">";
	                html += "<div class=\"column\"><a id=\"jumun_back_delivery_button\" class=\"btn btn-outline-secondary\" href=\"#\"><i class=\"icon-arrow-left\"></i><span class=\"hidden-xs-down\">&nbsp;뒤로 가기</span></a></div>";
	                html += "<div class=\"column\"><a id=\"jumun_payment_button\" class=\"btn btn-primary\"  href=\"#\"><span class=\"hidden-xs-down\">다음&nbsp;</span><i class=\"icon-arrow-right\"></i></a></div>";
					html += "</div>";

						$('#check_out_display').html(html);
					}
				}
			});

			e.preventDefault();
		});
*/
// 주문 취소 버튼
$(document).on('click', '#jumun_cancel_button', function(e) {
	if (confirm('주문을 취소하겠습니까?')) {
		location.href = 'unishop_main';
	} else {

	}
});






