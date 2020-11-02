package com.lanhan20.bms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lanhan20.bms.entity.Notice;
import com.lanhan20.bms.mapper.NoticeMapper;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	
	@Autowired
	NoticeMapper noticeMapper;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpSession httpSession,
						Model model) {
		
		List<Notice> list = noticeMapper.getList();
		
		model.addAttribute("list", list);
		return "/notice/list"; // notice_list.jsp
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "/notice/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String list(HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute Notice item) throws IOException {
		System.out.println(item);
		noticeMapper.setNotice(item);
		return "redirect:"+ request.getContextPath() + "/notice/list";
	}
	
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, HttpSession httpSession,
			Model model, @RequestParam(value = "id", defaultValue = "0") Long id){
		
		if (id == 0) {
			return "redirect:"+ request.getContextPath() + "/notice/list";
		}
		Notice item = noticeMapper.getNotice(id);
		model.addAttribute("item", item);
		return "/notice/content"; // notice_list.jsp
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute Notice item,
			@RequestParam(value = "modi") String modi) throws IOException {
		
		System.out.println(item);
		try {
			noticeMapper.setUpdateNotice(item, modi);
			return "redirect:"+ request.getContextPath() + "/notice/list";
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, HttpSession httpSession,
			 @RequestParam(value = "id", defaultValue = "0") Long id){
		
		Integer ret = noticeMapper.delNotice(id);
		
		if (ret == 1) {
			return "redirect:"+ request.getContextPath() + "/notice/list";
		} else {
			return null;
		}
	}
}
