package org.kosta.zoosee.model.vo;

public class MemberVO {
	private String id;
	private String name;
	private String address;
	private String gender;
	private String email;
	private String password;
	private String tel;
	private String job;
	private String rank;
	
	public MemberVO() {
 	}
	public MemberVO(String id, String name, String address, String gender,
			String email, String password, String tel, String job, String rank) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.tel = tel;
		this.job = job;
		this.rank = rank;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", address=" + address
				+ ", gender=" + gender + ", email=" + email + ", password="
				+ password + ", tel=" + tel + ", job=" + job + ", rank=" + rank
				+ "]";
	}
}
