package org.kosta.finalproject.model.domain;

public class ItemLikeVO {

	private int itemLikeId;
	private ItemVO itemVO;
	private UserVO userVO;
	
	public ItemLikeVO() {
		super();
	}

	public ItemLikeVO(int itemLikeId, ItemVO itemVO, UserVO userVO) {
		super();
		this.itemLikeId = itemLikeId;
		this.itemVO = itemVO;
		this.userVO = userVO;
	}
	
	public int getItemLikeId() {
		return itemLikeId;
	}
	public void setItemLikeId(int itemLikeId) {
		this.itemLikeId = itemLikeId;
	}
	public ItemVO getItemVO() {
		return itemVO;
	}
	public void setItemVO(ItemVO itemVO) {
		this.itemVO = itemVO;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	public String toString() {
		return "ItemLikeVO [itemLikeId=" + itemLikeId + ", itemVO=" + itemVO + ", userVO=" + userVO + "]";
	}
	
}
