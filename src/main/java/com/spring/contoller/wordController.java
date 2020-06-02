package com.spring.contoller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.WordVO;
import com.spring.service.WordService;

@Controller
public class wordController {

	
	 @Inject
	    private WordService service;
	
	 
	    @RequestMapping("/wordshow.do")
	    public String wordshow(Model model) throws Exception{
	       
	    	
	        return "wordshow";
	    }
	    
	    @RequestMapping("/wordlist.do")
	    public String wordlist(WordVO wordVo, Model model) throws Exception{
	       
	    	List<WordVO> list = service.wordlist(wordVo);
	    	model.addAttribute("list",list);
	    	
	        return "wordlist";
	    }
	    @RequestMapping("/wordadd.do")
	    public String wordadd(HttpServletRequest req,WordVO wordVo, Model model) throws Exception{
	    	
	    	//service.wordadd(wordVo);
	    	wordVo.setCategory(req.getParameter("category"));
	    	wordVo.setSentence(req.getParameter("sentence"));
	    	wordVo.setContent(req.getParameter("content"));
	    	
	    	service.wordadd(wordVo);
	    	
	    	List<WordVO> list = service.wordlist(wordVo);
	    	model.addAttribute("list",list);
	    	
	    	return "wordlist";
	    }
	    
	    @RequestMapping("/wordtest.do")
	    public String wordtest(Model model) throws Exception{
	       
	    	
	        return "wordtest";
	    }
	    
	    @RequestMapping("/wordtestlist.do")
	    public String wordtestlist(HttpServletRequest req,WordVO wordVo, Model model) throws Exception{
	    	
	    	wordVo.setCategory(req.getParameter("category"));
	    	int maxShowWord = Integer.parseInt(req.getParameter("maxShowWord")+"");
	    	System.out.println("단원:" + wordVo.getCategory());
	    	List<WordVO> list = service.wordTestlist(wordVo);
	    	for (int i = 0; i < list.size(); i++) {
				System.out.println("1. list["+i+"].getSentence : " + list.get(i).getSentence());
			}
	    	list = service.wordReTestlist(list,maxShowWord);
	    	for (int i = 0; i < list.size(); i++) {
	    		System.out.println("2. list["+i+"].getSentence : " + list.get(i).getSentence());
	    	}
	    	model.addAttribute("list",list);
	    	return "wordtestlist";
	    }
}
