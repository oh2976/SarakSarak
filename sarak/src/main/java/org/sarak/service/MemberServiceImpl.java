package org.sarak.service;

import org.sarak.domain.AuthVO;
import org.sarak.domain.MemberVO;
import org.sarak.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	@Override
	public void registerMember(MemberVO memberVo, AuthVO authVo) throws Exception {
		log.info("register...");
		memberMapper.register(memberVo);
		
		log.info("insert Auth...");
		memberMapper.insertAuth(authVo);
		
	}



}