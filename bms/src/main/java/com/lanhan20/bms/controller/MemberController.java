package com.lanhan20.bms.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lanhan20.bms.entity.Member;
import com.lanhan20.bms.repository.MemberRepository;

import lombok.Data;

@Data
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	MemberRepository repository;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		System.out.println("JOIN PAGE");
		return "join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(HttpServletRequest request,
			@ModelAttribute Member member) {
		System.out.println("member : " + member);
		member.setCreatedBy("SYSTEM")
		.setCreatedAt(LocalDateTime.now());
		System.out.println("member : " + member);

		Member newMember = repository.save(member);
		System.out.println("newMember : " + newMember);
		
		if (newMember != null) {
			return "redirect:"+ request.getContextPath() + "/member/login";
		} else {
			return "redirect:"+ request.getContextPath() + "/error";
		}
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("LOGIN PAGE");
		return "login"; //login.jsp
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request,
			HttpSession httpSession,
			@ModelAttribute Member member) {
		System.out.println("member : " + member);
		Member loginMember = repository.findByUserid(member.getUserid());
		
		if (loginMember != null) {
			if(loginMember.getUserpw().equals(member.getUserpw())) {
				httpSession.setAttribute("USERID_SESSION", loginMember.getUserid());
				return "redirect:" + request.getContextPath() + "/home";
			} else {
				return "redirect:" + request.getContextPath() + "/member/login";
			}
		} else {
			return "redirect:" + request.getContextPath() + "/member/login";
		}
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpSession httpsession) {
		httpsession.invalidate();
		return "redirect:" + request.getContextPath() + "/home";
	}
}
