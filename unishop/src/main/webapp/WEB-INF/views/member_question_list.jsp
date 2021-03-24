<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="common_top.jsp"/>
    <!-- Open Ticket Modal-->
    <form class="modal fade" method="post" id="openTicket" name="openTicket" tabindex="-1">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">새로운 질문 등록하기</h4>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          </div>
          <div class="modal-body">
            <p class="text-muted">답변까지 평균 2일이 소요됩니다. 양해 바랍니다.</p>
            <div class="form-group">
              <label for="question_title">제목</label>
              <input class="form-control" type="text" id="question_title" name="question_title" required>
            </div>
            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="question_category">카테고리</label>
                  <select class="form-control" id="question_category" name="question_category">
                    <option>선택해주세요</option>
                    <option>배송</option>
                    <option>상품</option>
                    <option>교환/환불</option>
                    <option>이벤트</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="question_content">내용</label>
              <textarea class="form-control" id="question_content" name="question_content" rows="8" required></textarea>
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" id="question_insert_button" type="submit" >등록하기</button>

          </div>
        </div>
      </div>
    </form>
    <!-- Off-Canvas Wrapper-->
    <div class="offcanvas-wrapper">
      <!-- Page Title-->
      <div class="page-title">
        <div class="container">
          <div class="column">
            <h1>질문 내역</h1>
          </div>
          <div class="column">
            <ul class="breadcrumbs">
              <li><a href="unishop_main">Home</a>
              </li>
              <li class="separator">&nbsp;</li>
              <li><a href="member_profile_form">Account</a>
              </li>
              <li class="separator">&nbsp;</li>
              <li>질문 내역</li>
            </ul>
          </div>
        </div>
      </div>
      <!-- Page Content-->
      <div class="container padding-bottom-3x mb-2">
        <div class="row">
          <div class="col-lg-4">
            <aside class="user-info-wrapper">
              <div class="user-cover" style="background-image: url(img/account/user-cover-img.jpg);">
                <div class="info-label" data-toggle="tooltip" title="You currently have 290 Reward Points to spend"><i class="icon-medal"></i>290 points</div>
              </div>
              <div class="user-info">
                <div class="user-avatar"><a class="edit-avatar" href="#"></a><img src="IMAGE/basic_profile.png" alt="User"></div>
                <div class="user-data">
                  <h4>${loginMember.member_name}</h4><span>${loginMember.member_id}</span>
                </div>
              </div>
            </aside>
            <nav class="list-group">
				<a class="list-group-item with-badge" href="member_jumun_list"><i class="icon-bag"></i>주문 목록</a>
				<a class="list-group-item" href="member_profile_form"><i class="icon-head"></i>내 정보</a>
				<a class="list-group-item" href="member_address_detail"><i class="icon-map"></i>내 주소</a>
				<a class="list-group-item with-badge" href="member_wishlist_detail"><i class="icon-heart"></i>찜 목록</a>
				<a class="list-group-item with-badge active" href="member_question_list"><i class="icon-tag"></i>질문 목록</a></nav>
			</div>
          <div class="col-lg-8">
            <div class="padding-top-2x mt-2 hidden-lg-up"></div>
            <div class="table-responsive">
              <table class="table table-hover margin-bottom-none">
                <thead>
                  <tr>
                    <th>제목</th>
                    <th>질문 날짜</th>
                    <th>카테고리</th>
                    <th>상태</th>
                  </tr>
                </thead>
                <tbody>
                 <c:forEach items="${questionList}" var="question">
                  <tr>
                    <td><a class="text-medium navi-link" href="member_question_detail?question_no=${question.question_no}">${question.question_title}</a></td>
                    <td>${question.question_date}</td>
                    <td>${question.question_category}</td>
                    <td><span class="text-muted">${question.question_status}</span></td>
                  </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
            <hr class="mb-4">
            <div class="text-right">
              <button class="btn btn-primary margin-bottom-none" data-toggle="modal" data-target="#openTicket">질문하기</button>
            </div>
          </div>
        </div>
      </div>
      <!-- Site Footer-->
      <jsp:include page="common_bottom.jsp"/>
    </div>
    <!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-arrow-up"></i></a>
    <!-- Backdrop-->
    <div class="site-backdrop"></div>
    <!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
    <script src="js/vendor.min.js"></script>
    <script src="js/scripts.min.js"></script>
    <script src="js/custom_member.js"></script>
  </body>
</html>