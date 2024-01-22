package org.sarak.service;

import org.sarak.domain.AuthVO;
import org.sarak.domain.MemberVO;

public interface MemberService {

	public void registerMember(MemberVO memberVo, AuthVO authVo) throws Exception;
	
	
}