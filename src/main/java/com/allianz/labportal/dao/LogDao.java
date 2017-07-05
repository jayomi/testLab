package com.allianz.labportal.dao;

import java.util.List;

import com.allianz.labportal.model.Log;

public interface LogDao {
	
	public void addRecode(int tokenId,String comment);
	public List<Log> getLogs(int tokenId);

}
