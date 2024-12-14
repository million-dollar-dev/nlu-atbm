package entity;

public class Review {
	private int productId;
	private User user;
	private int rating;
	private String comment;
	private String reviewDate;
	public Review(int productId, User user, int rating, String comment, String reviewDate) {
		super();
		this.productId = productId;
		this.user = user;
		this.rating = rating;
		this.comment = comment;
		this.reviewDate = reviewDate;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public User getUser() {
		return user;
	}
	public void setUer(User user) {
		this.user = user;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	@Override
	public String toString() {
		return "Review [productId=" + productId + ", uer=" + user + ", rating=" + rating + ", comment=" + comment
				+ ", reviewDate=" + reviewDate + "]";
	}
	
	
}
