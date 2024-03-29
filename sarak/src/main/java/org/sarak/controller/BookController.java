package org.sarak.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.sarak.domain.BookAttachVO;
import org.sarak.domain.BookVO;
import org.sarak.domain.Criteria;
import org.sarak.domain.PageDTO;
import org.sarak.mapper.BookMapper;
import org.sarak.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sarak/*")
@AllArgsConstructor
public class BookController {
	
	private BookService bookService;
	
	@Autowired
	private BookMapper bookMapper;
	
	// 메인 페이지
	@GetMapping("/main")
	public void main(Criteria cri, Model model) {
		
		log.info("###### 메인 페이지 진입 ######");
		model.addAttribute("bestBookList", bookService.bestBookList(cri));
		model.addAttribute("newBookList", bookService.newBookList(cri));
		
		log.info("newBookList" + bookService.newBookList(cri));
		
		int total = bookService.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		

	}
	
	@GetMapping("/bestBookList")
	public String bestBook(Criteria cri, Model model) {
		log.info("###### 베스트 페이지 진입 ######");
		
		model.addAttribute("bestBookList", bookService.bestBookList(cri));
		
		int total = bookService.getBestTotal(cri);	
		
		log.info("bestBookList: " + cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "sarak/bestBookList";
	}
	
	@GetMapping("/newBookList")
	public String newBook(Criteria cri, Model model) {
		log.info("###### 베스트 페이지 진입 ######");
		
		model.addAttribute("newBookList", bookService.newBookList(cri));
		
		int total = bookService.getNewTotal(cri);	
		
		log.info("newBookList: " + cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "sarak/newBookList";
	}
	
	
	
	// 전체도서 비동기
	@RequestMapping("/allBookListAjax")
	public @ResponseBody List<BookVO> allBookListAjax() {
		
		List<BookVO> allBookListAjax = bookMapper.allBookListAjax();
		
		for (BookVO book : allBookListAjax) {
			
			int bid = book.getBid();
			
			List<BookAttachVO> bookAttachList = bookService.getAttachList(bid);
			
			book.setAttachList(bookAttachList);
			
		}
		
		return allBookListAjax;
		
	}
	
	// 전체도서 페이지 (페이징)
	@GetMapping("/allBookList")
	public String allBookList(Criteria cri, Model model) {
		
		log.info("allBookList: " + cri);
		
		List<BookVO> allBookList = bookService.allBookList(cri);
		
		for (BookVO book : allBookList) {
			
			int bid = book.getBid();
			
			List<BookAttachVO> bookAttachList = bookService.getAttachList(bid);
			
			book.setAttachList(bookAttachList);
			
		}
		
		model.addAttribute("allBookList", allBookList);
		
		int total = bookService.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "sarak/allBookList";
		
	}
	
	@GetMapping("/bookDetail")
	public String bookDetail(@RequestParam("bid") int bid, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("###### 도서 상세 페이지 진입 ######");
		
		BookVO bookVO = bookService.getMap(bid);
		
		List<BookAttachVO> attachList = bookService.getAttachList(bid);
		
		model.addAttribute("bookVO", bookVO);
		
		model.addAttribute("attachList", attachList);
		
		return "sarak/bookDetail";
	}
	
	@GetMapping(value = "/getAttachList")
	@ResponseBody
	public ResponseEntity<List<BookAttachVO>> getAttachList(@RequestParam(name = "bid", defaultValue = "0") int bid,
			@RequestParam(name = "keyword", defaultValue = "") String keyword) {
	
		if (bid <= 0) {
			
	        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }
		
		log.info("getAttachList " + bid);
		
		List<BookAttachVO> attachList;
		
		if ("mainimg".equals(keyword)) {
			
			attachList = bookService.getMainImgAttachList(bid);
			
		} else {
			
			attachList = bookService.getAttachList(bid);
			
		}
		
		return new ResponseEntity<>(attachList, HttpStatus.OK);
	
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String filename) {
		
		File file = new File("C:\\saraksarak\\" + filename);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
		
		return result;
		
	}
	
	@GetMapping("/checkLogin")
    @ResponseBody
    public String checkLogin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
        	
            return "authenticated";
            
        } else {
        	
            return "unauthenticated";
            
        }
    }
}