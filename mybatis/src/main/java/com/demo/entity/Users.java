package com.demo.entity;

import java.util.Date;
import java.util.List;

public class Users {
	
	private Integer id;//�û����
//	private String username;//��¼�˺�
	private String name;
	private String userpass;//��¼����
	private String nickname;//�û��ǳ�
	private Integer age;//�û�����
	private String gender;//�û��Ա�
	private String phone;//��ϵ��ʽ
	private String email;//�û�����
	private Date createTime;//����ʱ��
	private Date updateTime;//�˺�����޸�ʱ��
	private Date lastLogin;//�û�����¼ʱ��
	private Integer userStatus;//�û�״̬ 0 ���� 1 ���� 2 ɾ��
	private String remark;//�û���ע��Ϣ
	private List<Address> addresses;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
//	public String getUsername() {
//		return username;
//	}
//	public void setUsername(String username) {
//		this.username = username;
//	}
	
	public String getUserpass() {
		return userpass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Integer getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	public List<Address> getAddresses() {
		return addresses;
	}
	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}
	public Users() {
		super();
	}
	public Users(Integer id) {
		super();
		this.id = id;
	}
	public Users(String name, String userpass, String nickname, Integer age, String gender, String phone, String email,
			Date data, Date data2,  Date data3,Integer userStatus) {
		super();
		this.name = name;
		this.userpass = userpass;
		this.nickname = nickname;
		this.age = age;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.createTime = data;
		this.updateTime = data2;
		this.lastLogin=data3;
		this.userStatus = userStatus;
	}	
	public Users(Integer id, String nickname, Integer age, String gender, String email, String phone, Date updateTime,String remark) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.remark = remark;
		this.updateTime = updateTime;
	}
}
