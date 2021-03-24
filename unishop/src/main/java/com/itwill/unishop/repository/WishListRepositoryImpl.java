package com.itwill.unishop.repository;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.unishop.domain.Product;
import com.itwill.unishop.domain.WishList;
import com.itwill.unishop.mapper.WishListMapper;
@Repository("wishListRepository")
public class WishListRepositoryImpl implements WishListRepository{

	@Autowired
	private WishListMapper wishListMapper;
	
	@Override
	public int insertWishList(WishList wishList) throws Exception {
		
		int insertCount = 0;
		insertCount = wishListMapper.insertWishList(wishList);
		return insertCount;
	};
	
	@Override
	public int inspectDuplicateWishList(String member_id, String product_no) throws Exception {
		int duplicateCount = 0;
		duplicateCount = wishListMapper.inspectDuplicateWishList(member_id, product_no);
		return duplicateCount;
	}
	
	@Override
	public ArrayList<WishList> selectWishListAll(String member_id) throws Exception {
		
		ArrayList<WishList> wishList = (ArrayList<WishList>)wishListMapper.selectWishListAll(member_id);
		return wishList;
	};

	@Override
	public int deleteWishListById(String member_id, String product_no) throws Exception {
		
		int deleteCount = wishListMapper.deleteWishListById(member_id, product_no);
		return deleteCount;
	};
	
	public int deleteWishListAll(String member_id) throws Exception{
		return wishListMapper.deleteWishListAll(member_id);
	};
	
	/*
	 * public int insertWishList(WishList wishList) throws Exception;
	
	public ArrayList<WishList> selectWishListAll(String no) throws Exception;
	
	
	public int deleteWishListById(String product_no) throws Exception;
	
	public int deleteWishListAll(String no) throws Exception;
	
	 */
	
}
