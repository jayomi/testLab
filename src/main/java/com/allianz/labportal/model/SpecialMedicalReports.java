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
 * SpecialMedicalReports generated by hbm2java
 */
@Entity
@Table(name = "special_medical_reports", catalog = "allianz_lab_portal")
public class SpecialMedicalReports implements java.io.Serializable {

	private Integer id;
	private String reportName;
	private String description;

	public SpecialMedicalReports() {
	}

	public SpecialMedicalReports(String reportName, String description) {
		this.reportName = reportName;
		this.description = description;
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

	@Column(name = "report_name")
	public String getReportName() {
		return this.reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
