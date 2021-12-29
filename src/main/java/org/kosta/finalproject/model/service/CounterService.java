package org.kosta.finalproject.model.service;

public interface CounterService {

	long getNextSequenceId(String key) throws SequenceException;
	
	

}
