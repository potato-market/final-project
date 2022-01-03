package org.kosta.finalproject.model.domain;

public class ItemVO {
	private int itemId;
	private String itemTitle;
	private long itemPrice;
	private int itemHit;
	private String itemContent;
	private String itemStatus;
	private int itemLikeHit;
	private String itemCreatedAt;
	private CategoryVO categoryVO;
	private UserVO userVO;
	//private ItemLikeVO itemLikeVO;

	public ItemVO() {
		super();
	}

	public ItemVO(int itemId, String itemTitle, long itemPrice, int itemHit, String itemContent, String itemStatus, int itemLikeHit,
			String itemCreatedAt, CategoryVO categoryVO, UserVO userVO) {
		super();
		this.itemId = itemId;
		this.itemTitle = itemTitle;
		this.itemPrice = itemPrice;
		this.itemHit = itemHit;
		this.itemContent = itemContent;
		this.itemStatus = itemStatus;
		this.itemLikeHit = itemLikeHit;
		this.itemCreatedAt = itemCreatedAt;
		this.categoryVO = categoryVO;
		this.userVO = userVO;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemTitle() {
		return itemTitle;
	}

	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}

	public long getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(long itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getItemHit() {
		return itemHit;
	}

	public void setItemHit(int itemHit) {
		this.itemHit = itemHit;
	}

	public String getItemContent() {
		return itemContent;
	}

	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}

	public String getItemStatus() {
		return itemStatus;
	}

	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}

	public String getItemCreatedAt() {
		return itemCreatedAt;
	}

	public void setItemCreatedAt(String itemCreatedAt) {
		this.itemCreatedAt = itemCreatedAt;
	}

	public CategoryVO getCategoryVO() {
		return categoryVO;
	}

	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	
	public int getItemLikeHit() {
		return itemLikeHit;
	}

	public void setItemLikeHit(int itemLikeHit) {
		this.itemLikeHit = itemLikeHit;
	}

	@Override
	public String toString() {
		return "ItemVO [itemId=" + itemId + ", itemTitle=" + itemTitle + ", itemPrice=" + itemPrice + ", itemHit="
				+ itemHit + ", itemContent=" + itemContent + ", itemStatus=" + itemStatus + ", itemLikeHit=\" + itemLikeHit + \", itemCreatedAt="
				+ itemCreatedAt + ", categoryVO=" + categoryVO + ", userVO=" + userVO + "]";
	}

}
