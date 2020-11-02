package com.lanhan20.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lanhan20.bms.entity.Member;
import com.lanhan20.bms.repository.MemberRepository;

@RestController
@CrossOrigin("*")
@RequestMapping(value = "/rest")
public class MemberRestController {

	@Autowired 
	MemberRepository repository;
	// http://localhost:8089/rest/memberuseridcheck.json?userid=abcd
	@RequestMapping(value = "memberuseridcheck.json",
					method = {RequestMethod.GET, RequestMethod.POST},
					produces = {MediaType.APPLICATION_JSON_VALUE},
					consumes = {MediaType.ALL_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public Map<String, Object> getMember(@RequestParam(value = "userid" , defaultValue = "") String userid){
		Member member = repository.findByUserid(userid);
		int ret = 0;
		
		if (member != null) {
			ret = 1; //userid 동일한 값이 있음
		} else {
			ret = 0; //userid 동일한 값이 없음
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dup", ret);
		return map;
	}
}