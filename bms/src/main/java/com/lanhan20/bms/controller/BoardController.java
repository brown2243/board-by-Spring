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
import com.lanhan20.bms.mapper.BoardMapper;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	BoardMapper boardMapper;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, HttpSession httpSession,
						Model model) {
		
		List<Board> list = boardMapper.getList();
		
		model.addAttribute("list", list);
		return "/board/list"; // board_list.jsp
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String list(HttpServletRequest request, HttpSession httpSession,
			@ModelAttribute Board item) throws IOException {
		System.out.println(item);
		boardMapper.setBoard(item);
		return "redirect:"+ request.getContextPath() + "/board/list";
	}
	
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, HttpSession httpSession,
			Model model, @RequestParam(value = "id", defaultValue = "0") Long id){
		
		Board item = boardMapper.getBoard(id);
		
		model.addAttribute("item", item);
		return "/board/content"; // board_list.jsp
		
		
	}
}
