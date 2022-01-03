package org.kosta.finalproject.model.domain;

public class ImageVO {
		private String imageId;
		private int itemId;
		private String imageName;
		public ImageVO() {
			super();
			// TODO Auto-generated constructor stub
		}
		
		public String getImageId() {
			return imageId;
		}
		public void setImageId(String imageId) {
			this.imageId = imageId;
		}
		public int getItemId() {
			return itemId;
		}
		public void setItemId(int itemId) {
			this.itemId = itemId;
		}
		public String getImageName() {
			return imageName;
		}
		public void setImageName(String imageName) {
			this.imageName = imageName;
		}
		@Override
		public String toString() {
			return "ImageVO [imageId=" + imageId + ", itemId=" + itemId + ", imageName=" + imageName + "]";
		}

		public ImageVO(int itemId, String imageName) {
			super();
			
			this.itemId = itemId;
			this.imageName = imageName;
		}
		
}
