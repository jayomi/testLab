package com.allianz.labportal.model;
// default package
// Generated Jul 3, 2017 11:54:32 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * HeadTokenInfo generated by hbm2java
 */
@Entity
@Table(name = "head_token_info", catalog = "allianz_lab_portal")
public class HeadTokenInfo implements java.io.Serializable {

	private Integer id;
	private String createdBy;
	private Date createdDate;
	private String branch;
	private String customerName;
	private String nic;
	private String proposalNo;
	private String tokenStatus;
	private String reportCategory;
	private String medicalReports;
	private String specialMedicalReports;
	private String otherMedicalReports;
	private Integer labId;
	private String labName;
	private String priority;
	private String appointmentDate;
	private String appointmentTime;
	private String tokenCreateComment;
	private String specialInstructions;
	private String remarks;
	private Integer pendingReportCountFromLab;
	private String completeStatusLab;
	private String labComment;
	private Integer doctorId;
	private String doctorName;
	private String assignToDoctorReport;
	private String completeStatusDoctor;
	private String doctorComment;
	private Integer srpId;
	private String srpName;
	private String assignToSrpReport;
	private String srpComment;
	private String adminComment;
	private String username;
	private String lastMessage;
	private Date lastResponse;
	private String completeStatusSrp;

	public HeadTokenInfo() {
	}

	public HeadTokenInfo(String createdBy, Date createdDate, String branch, String customerName, String nic,
			String proposalNo, String tokenStatus, String reportCategory, String medicalReports,
			String specialMedicalReports, String otherMedicalReports, Integer labId, String labName, String priority,
			String appointmentDate, String appointmentTime, String tokenCreateComment, String specialInstructions,
			String remarks, Integer pendingReportCountFromLab, String completeStatusLab, String labComment,
			Integer doctorId, String doctorName, String assignToDoctorReport, String completeStatusDoctor,
			String doctorComment, Integer srpId, String srpName, String assignToSrpReport, String srpComment,
			String adminComment, String username, String lastMessage, Date lastResponse, String completeStatusSrp) {
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.branch = branch;
		this.customerName = customerName;
		this.nic = nic;
		this.proposalNo = proposalNo;
		this.tokenStatus = tokenStatus;
		this.reportCategory = reportCategory;
		this.medicalReports = medicalReports;
		this.specialMedicalReports = specialMedicalReports;
		this.otherMedicalReports = otherMedicalReports;
		this.labId = labId;
		this.labName = labName;
		this.priority = priority;
		this.appointmentDate = appointmentDate;
		this.appointmentTime = appointmentTime;
		this.tokenCreateComment = tokenCreateComment;
		this.specialInstructions = specialInstructions;
		this.remarks = remarks;
		this.pendingReportCountFromLab = pendingReportCountFromLab;
		this.completeStatusLab = completeStatusLab;
		this.labComment = labComment;
		this.doctorId = doctorId;
		this.doctorName = doctorName;
		this.assignToDoctorReport = assignToDoctorReport;
		this.completeStatusDoctor = completeStatusDoctor;
		this.doctorComment = doctorComment;
		this.srpId = srpId;
		this.srpName = srpName;
		this.assignToSrpReport = assignToSrpReport;
		this.srpComment = srpComment;
		this.adminComment = adminComment;
		this.username = username;
		this.lastMessage = lastMessage;
		this.lastResponse = lastResponse;
		this.completeStatusSrp = completeStatusSrp;
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

	@Column(name = "created_by", length = 45)
	public String getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_date", length = 19)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "branch", length = 45)
	public String getBranch() {
		return this.branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	@Column(name = "customer_name", length = 45)
	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	@Column(name = "nic", length = 45)
	public String getNic() {
		return this.nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	@Column(name = "proposal_no", length = 45)
	public String getProposalNo() {
		return this.proposalNo;
	}

	public void setProposalNo(String proposalNo) {
		this.proposalNo = proposalNo;
	}

	@Column(name = "token_status", length = 45)
	public String getTokenStatus() {
		return this.tokenStatus;
	}

	public void setTokenStatus(String tokenStatus) {
		this.tokenStatus = tokenStatus;
	}

	@Column(name = "report_category", length = 45)
	public String getReportCategory() {
		return this.reportCategory;
	}

	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}

	@Column(name = "medical_reports")
	public String getMedicalReports() {
		return this.medicalReports;
	}

	public void setMedicalReports(String medicalReports) {
		this.medicalReports = medicalReports;
	}

	@Column(name = "special_medical_reports")
	public String getSpecialMedicalReports() {
		return this.specialMedicalReports;
	}

	public void setSpecialMedicalReports(String specialMedicalReports) {
		this.specialMedicalReports = specialMedicalReports;
	}

	@Column(name = "other_medical_reports")
	public String getOtherMedicalReports() {
		return this.otherMedicalReports;
	}

	public void setOtherMedicalReports(String otherMedicalReports) {
		this.otherMedicalReports = otherMedicalReports;
	}

	@Column(name = "lab_id")
	public Integer getLabId() {
		return this.labId;
	}

	public void setLabId(Integer labId) {
		this.labId = labId;
	}

	@Column(name = "lab_name")
	public String getLabName() {
		return this.labName;
	}

	public void setLabName(String labName) {
		this.labName = labName;
	}

	@Column(name = "priority", length = 45)
	public String getPriority() {
		return this.priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	@Column(name = "appointment_date", length = 45)
	public String getAppointmentDate() {
		return this.appointmentDate;
	}

	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	@Column(name = "appointment_time", length = 45)
	public String getAppointmentTime() {
		return this.appointmentTime;
	}

	public void setAppointmentTime(String appointmentTime) {
		this.appointmentTime = appointmentTime;
	}

	@Column(name = "token_create_comment")
	public String getTokenCreateComment() {
		return this.tokenCreateComment;
	}

	public void setTokenCreateComment(String tokenCreateComment) {
		this.tokenCreateComment = tokenCreateComment;
	}

	@Column(name = "special_instructions")
	public String getSpecialInstructions() {
		return this.specialInstructions;
	}

	public void setSpecialInstructions(String specialInstructions) {
		this.specialInstructions = specialInstructions;
	}

	@Column(name = "remarks")
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "pending_report_count_from_lab")
	public Integer getPendingReportCountFromLab() {
		return this.pendingReportCountFromLab;
	}

	public void setPendingReportCountFromLab(Integer pendingReportCountFromLab) {
		this.pendingReportCountFromLab = pendingReportCountFromLab;
	}

	@Column(name = "complete_status_lab", length = 45)
	public String getCompleteStatusLab() {
		return this.completeStatusLab;
	}

	public void setCompleteStatusLab(String completeStatusLab) {
		this.completeStatusLab = completeStatusLab;
	}

	@Column(name = "lab_comment")
	public String getLabComment() {
		return this.labComment;
	}

	public void setLabComment(String labComment) {
		this.labComment = labComment;
	}

	@Column(name = "doctor_id")
	public Integer getDoctorId() {
		return this.doctorId;
	}

	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}

	@Column(name = "doctor_name", length = 45)
	public String getDoctorName() {
		return this.doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	@Column(name = "assign_to_doctor_report")
	public String getAssignToDoctorReport() {
		return this.assignToDoctorReport;
	}

	public void setAssignToDoctorReport(String assignToDoctorReport) {
		this.assignToDoctorReport = assignToDoctorReport;
	}

	@Column(name = "complete_status_doctor", length = 45)
	public String getCompleteStatusDoctor() {
		return this.completeStatusDoctor;
	}

	public void setCompleteStatusDoctor(String completeStatusDoctor) {
		this.completeStatusDoctor = completeStatusDoctor;
	}

	@Column(name = "doctor_comment")
	public String getDoctorComment() {
		return this.doctorComment;
	}

	public void setDoctorComment(String doctorComment) {
		this.doctorComment = doctorComment;
	}

	@Column(name = "srp_id")
	public Integer getSrpId() {
		return this.srpId;
	}

	public void setSrpId(Integer srpId) {
		this.srpId = srpId;
	}

	@Column(name = "srp_name", length = 45)
	public String getSrpName() {
		return this.srpName;
	}

	public void setSrpName(String srpName) {
		this.srpName = srpName;
	}

	@Column(name = "assign_to_srp_report")
	public String getAssignToSrpReport() {
		return this.assignToSrpReport;
	}

	public void setAssignToSrpReport(String assignToSrpReport) {
		this.assignToSrpReport = assignToSrpReport;
	}

	@Column(name = "srp_comment")
	public String getSrpComment() {
		return this.srpComment;
	}

	public void setSrpComment(String srpComment) {
		this.srpComment = srpComment;
	}

	@Column(name = "admin_comment")
	public String getAdminComment() {
		return this.adminComment;
	}

	public void setAdminComment(String adminComment) {
		this.adminComment = adminComment;
	}

	@Column(name = "username", length = 45)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "last_message")
	public String getLastMessage() {
		return this.lastMessage;
	}

	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_response", length = 19)
	public Date getLastResponse() {
		return this.lastResponse;
	}

	public void setLastResponse(Date lastResponse) {
		this.lastResponse = lastResponse;
	}

	@Column(name = "complete_status_srp", length = 45)
	public String getCompleteStatusSrp() {
		return this.completeStatusSrp;
	}

	public void setCompleteStatusSrp(String completeStatusSrp) {
		this.completeStatusSrp = completeStatusSrp;
	}

}
