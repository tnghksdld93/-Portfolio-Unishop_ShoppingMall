package com.itwill.unishop.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.unishop.domain.Cart;
import com.itwill.unishop.domain.Delivery;
import com.itwill.unishop.domain.Jumun;
import com.itwill.unishop.domain.Jumun_Detail;
import com.itwill.unishop.domain.Member;
import com.itwill.unishop.domain.Product;
import com.itwill.unishop.domain.Review;
import com.itwill.unishop.domain.WishList;
import com.itwill.unishop.service.CartService;
import com.itwill.unishop.service.DeliveryService;
import com.itwill.unishop.service.JumunService;
import com.itwill.unishop.service.Jumun_DetailService;
import com.itwill.unishop.service.MemberService;
import com.itwill.unishop.service.ProductService;
import com.itwill.unishop.service.QuestionService;
import com.itwill.unishop.service.ReviewService;
import com.itwill.unishop.service.WishListService;

@RestController
public class UnishopRestController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	@Autowired
	private JumunService jumunService;
	@Autowired
	private Jumun_DetailService jumun_DetailService;
	@Autowired
	private CartService cartService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private WishListService wishListService;
	@Autowired
	private DeliveryService deliveryService;

	/**************** 멤버 주문 리스트 *******************/
	@RequestMapping(value = "rest_jumun_detail")
	public List<Jumun_Detail> jumun_detail(@RequestParam int jumun_no) throws Exception {
		return jumun_DetailService.selectByNo(jumun_no);
	}

	@RequestMapping(value = "rest_jumun_delivery_detail")
	public Delivery jumun_delivery_detail(@RequestParam String delivery_no) throws Exception {
		return deliveryService.selectByNo(delivery_no);
	}

	/********** 제품 리뷰 ***********/
	@RequestMapping("/rest_shop_product_review_list")
	public List<Review> shop_product_review(@RequestParam String product_no) throws Exception {

		List<Review> reviewList = reviewService.selectReviewByNo(product_no);

		return reviewList;
	}

	/*************************************
	 * 리뷰를 남겨보자
	 ***************************************/
	@RequestMapping(value = "/rest_shop_product_review_action", method = RequestMethod.GET)
	public String shop_product_review_action_GET() {
		return "forward:rest_shop_product_review_list";
	}

	@RequestMapping(value = "rest_shop_product_review_action", method = RequestMethod.POST)
	public String shop_product_review_action_POST(HttpSession session, @ModelAttribute Review insertReview)
			throws Exception {
		String msg = "";
		String sMemberId = (String) session.getAttribute("sMemberId");
		insertReview.setMember_id(sMemberId);
		System.out.println(insertReview);
		if (sMemberId == null || sMemberId == "") {
			msg = "false";
		}
		Product product = productService.selectByNo(insertReview.getProduct_no());
		if (sMemberId.equals(insertReview.getMember_id())
				&& product.getProduct_no().equals(insertReview.getProduct_no())) {
			reviewService.insertReview(insertReview);
			msg = "true";
		}
		return msg;
	}

	@RequestMapping(value = "rest_shop_add_cart_action")
	public String shop_add_cart(Model model, HttpSession session, @RequestParam int cart_qty,
			@RequestParam String cart_product_size, @RequestParam String product_no) {

		String msg = "";
		String sMemberId = (String) session.getAttribute("sMemberId");

		try {

			if (sMemberId == null || sMemberId == "") {
				msg = "false";
			}
			int duplicateCount = cartService.inspectDuplicateCart(sMemberId, product_no, cart_product_size);
			if (duplicateCount != 0) {
				int update_qty = cartService.selectCartOne(sMemberId, product_no, cart_product_size).getCart_qty()
						+ cart_qty;
				int cart_no = cartService.selectCartOne(sMemberId, product_no, cart_product_size).getCart_no();
				Cart updateCart = new Cart(cart_no, update_qty, 5000, cart_product_size, sMemberId, product_no);
				cartService.updateCart(updateCart);
				//cart_subtotal 업데이트
				ArrayList<Cart> cartList = cartService.selectCartAll(sMemberId);
				int cart_subtotal = 0;
				for (Cart cart1 : cartList) {
					cart_subtotal += cart1.getCart_tot_price();
				}
				session.setAttribute("cart_subtotal", cart_subtotal);

			} else {
				Cart cart = new Cart(-9999, cart_qty, 5000, cart_product_size, sMemberId, product_no);
				cartService.insertCart(cart);
				//cart_subtotal 업데이트
				ArrayList<Cart> cartList = cartService.selectCartAll(sMemberId);
				int cart_subtotal = 0;
				for (Cart cart1 : cartList) {
					cart_subtotal += cart1.getCart_tot_price();
				}
				session.setAttribute("cart_subtotal", cart_subtotal);
			}
			msg = "true";
			// -1과 5000은 임의의 수일 뿐. 쿼리문상 자동으로 계산된 값으로 입력됨
		} catch (Exception e) {
			e.printStackTrace();
			msg = "false";
		}
		return msg;
	}

	/*************** 카트 업데이트시 common_top 업데이트 *****************/
	@RequestMapping(value = "rest_cart_common_top")
	public String cart_commontop_update(HttpSession session) {
		Integer cart_subtotal = (Integer) session.getAttribute("cart_subtotal");
		if (cart_subtotal != 0 && cart_subtotal != null) {
			System.out.println("cart_subtotal= " + cart_subtotal);
			return cart_subtotal + "-";
		} else {
			return cart_subtotal + "-";
		}
	}
	

	/*************** 체크아웃-주소폼 *****************/
	@RequestMapping(value = "/rest_jumun_address_form", method = RequestMethod.POST)
	public String jumun_address_form() {
		return "true";
	}

	/*************** 체크아웃-주소폼 액션 *****************/
	@RequestMapping(value = "/rest_jumun_address_action", method = RequestMethod.POST)
	public String jumun_address_action_POST(HttpSession session, @ModelAttribute Member member) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		loginMember.setMember_id(loginMember.getMember_id());
		loginMember.setMember_name(member.getMember_name());
		loginMember.setMember_phone(member.getMember_phone());
		loginMember.setMember_address_name(member.getMember_address_name());
		loginMember.setMember_address_country(member.getMember_address_country());
		loginMember.setMember_address_city(member.getMember_address_city());
		loginMember.setMember_address_zipcode(member.getMember_address_zipcode());
		loginMember.setMember_address1(member.getMember_address1());
		loginMember.setMember_address2(member.getMember_address2());
		session.setAttribute("loginMember", loginMember);
		memberService.updateAddress(loginMember);

		return "true";
	}

	/*************** 체크아웃-배송 폼 *****************/
	@RequestMapping(value = "rest_jumun_delivery_form", method = RequestMethod.GET)
	public String jumun_delivery_form() {
		return "true";
	}

	/*************** 체크아웃-배송 폼 액션 *****************/
	@RequestMapping(value = "/rest_jumun_delivery_action", method = RequestMethod.POST)
	public String jumun_delivery_action_POST(HttpSession session, @RequestParam String deliveryStr) {
		Jumun createJumun = new Jumun();
		int delivery_fee = (int) session.getAttribute("delivery_fee");
		// 2. 일반 또는 특급 선택후, delivery_fee(배송비) set
		if (deliveryStr.equalsIgnoreCase("일반")) {
			createJumun.setDelivery_no("GEN");
			session.setAttribute("delivery_fee", 3000);
		} else {
			createJumun.setDelivery_no("EX");
			session.setAttribute("delivery_fee", 6000);
		}

		System.out.println(createJumun); // test
		System.out.println("delivery fee = " + delivery_fee); // test

		session.setAttribute("createJumun", createJumun);
		return "true";
	}

	/*************** 체크아웃-결제 폼 *****************/
	@RequestMapping(value = "rest_jumun_payment_form", method = RequestMethod.POST)
	public String jumun_payment_form() {
		return "true";
	}

	/*************** 체크아웃- side bar 총금액 *****************/
	@RequestMapping(value = "rest_jumun_sidebar")
	public String jumun_sidebar(HttpSession session) {
		Integer cart_subtotal = (Integer) session.getAttribute("cart_subtotal");
		Integer delivery_fee = (Integer) session.getAttribute("delivery_fee");
		if (cart_subtotal != 0 && delivery_fee != 0 && cart_subtotal != null && delivery_fee != null) {
			return cart_subtotal + "-" + delivery_fee;
		} else {
			return cart_subtotal + "-" + 0;
		}

	}

	/*************** 체크아웃-결제카드 폼 액션 *****************/
	@RequestMapping(value = "/rest_jumun_payment_action", method = RequestMethod.POST)
	public String jumun_payment_action_POST(HttpSession session, @ModelAttribute Jumun jumun) {
		String sMemberId = (String) session.getAttribute("sMemberId");
		int cart_subtotal = (int) session.getAttribute("cart_subtotal");
		int delivery_fee = (int) session.getAttribute("delivery_fee");

		Jumun createJumun = (Jumun) session.getAttribute("createJumun");

		createJumun.setJumun_status("주문");
		createJumun.setJumun_tot_price(cart_subtotal + delivery_fee);
		createJumun.setJumun_date(new Date());
		createJumun.setMember_id(sMemberId);
		createJumun.setCard_no(jumun.getCard_no());
		createJumun.setCard_expire_date(jumun.getCard_expire_date());
		createJumun.setCard_cvc(jumun.getCard_cvc());
		createJumun.setCard_member_name(jumun.getCard_member_name());

		session.setAttribute("createJumun", createJumun);
		System.out.println(createJumun);
		return "true";
	}

	@RequestMapping(value = "/rest_cart_update_action")
	public String cart_update_action_get(Model model, HttpSession session, @RequestParam int cart_no,
			@RequestParam int cart_qty) {
		String msg = " ";
		String sMemberId = (String) session.getAttribute("sMemberId");

		Cart updateCart = new Cart(cart_no, cart_qty, 1, "", "", "");
		int update_Cartno = cartService.updateCart(updateCart);
		if (update_Cartno == 1) {
			msg = "true";
		} else {
			msg = "false";
		}
		return msg;
	}

	/********** 위시리스트 삭제 ***********/
	@RequestMapping("/rest_delete_wishlist_action")
	public String shop_delete_wishlist_action(Model model, HttpSession session, @RequestParam String product_no) {
		String msg = " ";
		try {
			String sMemberId = (String) session.getAttribute("sMemberId");
			int deleteCount = wishListService.deleteWishListById(sMemberId, product_no);

			System.out.println("deleteCount :" + deleteCount);

			if (deleteCount > 0) {
				msg = "true";
			} else {
				msg = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	@RequestMapping(value = "/shop_add_wishlist_action")
	public String shop_add_wishlist_action(Model model, HttpSession session, @RequestParam String product_no) {
		String idCheck = "";
		// String member_id = "uni1"; //session.getId();
		try {
			String sMemberId = (String) session.getAttribute("sMemberId");
			if (sMemberId == null || sMemberId == "") {
				idCheck = "flase";
			}

			int duplicateCount = wishListService.inspectDuplicateWishList(sMemberId, product_no);

			if (duplicateCount == 0) {
				wishListService.insertWishList(new WishList(-1, sMemberId, product_no, null));
			}
			idCheck = "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return idCheck;
	}

}
