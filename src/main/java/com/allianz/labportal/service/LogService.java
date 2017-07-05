package com.allianz.labportal.service;

import java.util.List;

import com.allianz.labportal.model.Log;

public interface LogService {

	public void addRecode(int tokenId,String comment);
	public List<Log> getLogs(int tokenId);
}
