package entity;

import java.util.Date;

public class UserKey {
	private String keyId;
	private User user;
	private String key;
	private String keyType;
	private int keySize;
	private Date createdAt;
	private Date updatedAt;
	private Date ExpireAt;
	private boolean isActive;

	public UserKey(String keyId, User user, String key, String keyType, int keySize, Date createdAt, Date updatedAt,
			Date expireAt, boolean isActive) {
		super();
		this.keyId = keyId;
		this.user = user;
		this.key = key;
		this.keyType = keyType;
		this.keySize = keySize;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		ExpireAt = expireAt;
		this.isActive = isActive;
	}

	public UserKey(String keyId, String key, String keyType, int keySize, Date createdAt, Date updatedAt, Date expireAt,
			boolean isActive) {
		super();
		this.keyId = keyId;
		this.key = key;
		this.keyType = keyType;
		this.keySize = keySize;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		ExpireAt = expireAt;
		this.isActive = isActive;
	}

	public void setKeyId(String keyId) {
		this.keyId = keyId;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public void setKeyType(String keyType) {
		this.keyType = keyType;
	}

	public void setKeySize(int keySize) {
		this.keySize = keySize;
	}

	public void setcreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setupdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public void setExpireAt(Date expireAt) {
		ExpireAt = expireAt;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public String getKeyId() {
		return keyId;
	}

	public User getUser() {
		return user;
	}

	public String getKey() {
		return key;
	}

	public String getKeyType() {
		return keyType;
	}

	public int getKeySize() {
		return keySize;
	}

	public Date getcreatedAt() {
		return createdAt;
	}

	public Date getupdatedAt() {
		return updatedAt;
	}

	public Date getExpireAt() {
		return ExpireAt;
	}

	public boolean isActive() {
		return isActive;
	}

}
