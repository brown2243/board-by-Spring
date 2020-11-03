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

import com.lanhan20.bms.entity.Board;
import com.lanhan20.bms.entity.Notice;
import com.lanhan20.bms.mapper.BoardMapper;
import com.lanhan20.bms.mapper.NoticeMapper;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	NoticeMapper noticeMapper;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpSession httpSession,
						Model model) {
		
		List<Board> list = boardMapper.getList();
		List<Notice> noticelist = noticeMapper.getList();
		
		model.addAttribute("list", list);
		model.addAttribute("noticelist", noticelist);
		return "/board/list"; // board_list.jsp
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute Board item,
			@ModelAttribute Notice noticeitem) throws IOException {
		System.out.println(item);
		boardMapper.setBoard(item);
		noticeMapper.setNotice(noticeitem);
		
		return "redirect:"+ request.getContextPath() + "/board/list";
	}
	
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, HttpSession httpSession,
			Model model, @RequestParam(value = "id", defaultValue = "0") Long id){
		
		if (id == 0) {
			return "redirect:"+ request.getContextPath() + "/board/list";
		}
		boardMapper.updateBoardHit(id);
		Board item = boardMapper.getBoard(id);
		model.addAttribute("item", item);
		return "/board/content"; // board_list.jsp
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute Board item) throws IOException {
		
		System.out.println(item);
		try {
			boardMapper.setUpdateBoard(item);
			return "redirect:"+ request.getContextPath() + "/board/list";
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, HttpSession httpSession,
			 @RequestParam(value = "id", defaultValue = "0") Long id){
		
		Integer ret = boardMapper.delBoard(id);
		
		if (ret == 1) {
			return "redirect:"+ request.getContextPath() + "/board/list";
		} else {
			return null;
		}
	}
}
