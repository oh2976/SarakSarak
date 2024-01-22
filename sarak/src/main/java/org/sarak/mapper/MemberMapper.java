package org.sarak.mapper;

import org.sarak.domain.AuthVO;
import org.sarak.domain.MemberVO;

public interface MemberMapper {

	public void register(MemberVO vo) throws Exception;
	public void insertAuth(AuthVO vo);
	
	public MemberVO read(String mid);
}