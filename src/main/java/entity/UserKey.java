package entity;

import java.sql.Timestamp;
import java.util.Date;

public class UserKey {
	private String keyId;
	private User user;
	private String key;
	private String keyType;
	private int keySize;
	private Timestamp createdAt;
	private Timestamp expireAt;
	private boolean isActive;
	public UserKey(String keyId, String key, String keyType, int keySize, Timestamp createdAt, Timestamp expireAt,
			boolean isActive) {
		super();
		this.keyId = keyId;
		this.key = key;
		this.keyType = keyType;
		this.keySize = keySize;
		this.createdAt = createdAt;
		this.expireAt = expireAt;
		this.isActive = isActive;
	}
	public String getKeyId() {
		return keyId;
	}
	public void setKeyId(String keyId) {
		this.keyId = keyId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getKeyType() {
		return keyType;
	}
	public void setKeyType(String keyType) {
		this.keyType = keyType;
	}
	public int getKeySize() {
		return keySize;
	}
	public void setKeySize(int keySize) {
		this.keySize = keySize;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Date getExpireAt() {
		return expireAt;
	}
	public void setExpireAt(Timestamp expireAt) {
		this.expireAt = expireAt;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	

}
