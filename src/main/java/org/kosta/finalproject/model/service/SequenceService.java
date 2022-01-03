package org.kosta.finalproject.model.service;

public interface SequenceService {

	long getNextSequenceId(String key) throws SequenceException;
	
	

}
