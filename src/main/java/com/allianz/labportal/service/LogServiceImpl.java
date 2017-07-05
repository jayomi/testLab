package com.allianz.labportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.HeadTokenDaoImpl;
import com.allianz.labportal.dao.LogDaoImpl;
import com.allianz.labportal.model.Log;

@Service("logServiceImpl")
public class LogServiceImpl implements LogService {

	@Autowired
	LogDaoImpl logDaoImpl;
	
	@Override
	@Transactional
	public void addRecode(int tokenId, String comment) {
		logDaoImpl.addRecode(tokenId, comment);
	}

	@Override
	@Transactional
	public List<Log> getLogs(int tokenId) {
		return logDaoImpl.getLogs(tokenId);
	}

}
