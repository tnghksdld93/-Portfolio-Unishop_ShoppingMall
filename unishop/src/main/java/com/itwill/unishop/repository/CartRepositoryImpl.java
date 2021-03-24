package com.itwill.unishop.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.unishop.domain.Cart;
import com.itwill.unishop.mapper.CartMapper;

@Repository("cartRepository")
public class CartRepositoryImpl implements CartRepository {
	@Autowired
	private CartMapper cartMapper;

	public CartRepositoryImpl() {

	}

	@Override
	public int insertCart(Cart cart){

		int insertRowCount = cartMapper.insertCart(cart);
		return insertRowCount;
	}

	@Override
	public ArrayList<Cart> selectCartAll(String member_id){

		List<Cart> cartList2 = cartMapper.selectCartAll(member_id);
		ArrayList<Cart> cartList1 = (ArrayList<Cart>) cartList2;
		return cartList1;
	}
	
	@Override
	public int inspectDuplicateCart(String member_id, String product_no, String cart_product_size) {
		int duplicateCount = 0;
		duplicateCount = cartMapper.inspectDuplicateCart(member_id, product_no, cart_product_size);
		return duplicateCount;
	}

	@Override
	public Cart selectCartOne(String member_id, String product_no, String cart_product_size) {
		Cart cart = cartMapper.selectCartOne(member_id, product_no, cart_product_size);
		return cart;
	}
	
	@Override
	public int updateCart(Cart updateCart) {

		int updateRowCount = cartMapper.updateCart(updateCart);
		return updateRowCount;
	}

	@Override
	public int deleteCartByCartNo(int cart_no) {

		int deleteRowCount = cartMapper.deleteCartByCartNo(cart_no);
		return deleteRowCount;
	}
	
	@Override
	public int deleteCartByMemberId(String member_id) {
		int deleteRowCount = cartMapper.deleteCartByMemberId(member_id);
		return deleteRowCount;
	}
	

}
