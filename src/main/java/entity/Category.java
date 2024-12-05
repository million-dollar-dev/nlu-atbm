package entity;

public class Category {
	private int id;
	private String name;
	public Category(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + "]";
	}
	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof Category))
			return false;
		Category other = (Category) obj;
		return this.id == other.id
				&& this.name.equals(other.name);
	}
	
	
}
