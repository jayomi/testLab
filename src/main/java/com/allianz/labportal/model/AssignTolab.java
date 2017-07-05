package com.allianz.labportal.model;
// default package
// Generated Jul 3, 2017 11:54:32 AM by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * AssignTolab generated by hbm2java
 */
@Entity
@Table(name = "assign_tolab", catalog = "allianz_lab_portal")
public class AssignTolab implements java.io.Serializable {

	private Integer id;
	private String labName;
	private int tokenId;
	private String userEmail;
	private String branch;

	public AssignTolab() {
	}

	public AssignTolab(int tokenId) {
		this.tokenId = tokenId;
	}

	public AssignTolab(String labName, int tokenId, String userEmail, String branch) {
		this.labName = labName;
		this.tokenId = tokenId;
		this.userEmail = userEmail;
		this.branch = branch;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "lab_name")
	public String getLabName() {
		return this.labName;
	}

	public void setLabName(String labName) {
		this.labName = labName;
	}

	@Column(name = "token_id", nullable = false)
	public int getTokenId() {
		return this.tokenId;
	}

	public void setTokenId(int tokenId) {
		this.tokenId = tokenId;
	}

	@Column(name = "user_email")
	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@Column(name = "branch")
	public String getBranch() {
		return this.branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

}