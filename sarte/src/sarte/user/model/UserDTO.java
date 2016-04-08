package sarte.user.model;

public class UserDTO 
{
	private int idx;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phonenum;
	private String profile;
	private String imgpath;
	
	public UserDTO(int idx, String id, String pw, String name, String email, String phonenum, String profile,
			String imgpath) {
		super();
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phonenum = phonenum;
		this.profile = profile;
		this.imgpath = imgpath;
	}

	public UserDTO() {
		super();
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	
	
	
}
