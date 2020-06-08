package com.spring.contoller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.spring.Category;
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
	    public String wordlist(WordVO wordVo,Category category, Model model) throws Exception{
	       
	    	List<WordVO> list = service.wordlist(wordVo);
	    	model.addAttribute("list",list);
	    	
	    	List<Category> categorylist = service.categorylist(category);
	    	model.addAttribute("categorylist",categorylist);
	    	
	        return "wordlist";
	    }
	    @RequestMapping("/wordadd.do")
	    public String wordadd(HttpServletRequest req,WordVO wordVo, Category category, Model model) throws Exception{
	    	
	    	//service.wordadd(wordVo);
	    	String cate = req.getParameter("category_input");
	    	String cate_select = req.getParameter("category_select");
	    	
	    	if(cate==null)
	    		cate = cate_select;
	    	
	    	wordVo.setCategory(cate);
	    	wordVo.setSentence(req.getParameter("sentence"));
	    	wordVo.setContent(req.getParameter("content"));
	    	
	    	service.wordadd(wordVo);
	    	
	    	boolean categoryUse = false;
	    	List<Category> categorylist = service.categorylist(category);
	    	System.out.println(cate+","+categorylist.size());
	    	for (int i = 0; i < categorylist.size(); i++) {
				if(cate.equals(categorylist.get(i).getCate())) {
					categoryUse = true;
				}
			}
	    	if(!categoryUse) {
	    		category.setCate(cate);
	    		service.categoryadd(category);
	    		categorylist.add(category);
	    	}
	    	
	    	
	    	List<WordVO> list = service.wordlist(wordVo);
	    	model.addAttribute("list",list);
	    	model.addAttribute("categorylist",categorylist);
	    	return "wordlist";
	    }
	    
	    @RequestMapping("/wordtest.do")
	    public String wordtest(Model model,Category category) throws Exception{
	    	
	    	List<Category> categorylist = service.categorylist(category);
	    	model.addAttribute("categorylist",categorylist);
	    	
	        return "wordtest";
	    }
	    
	    @RequestMapping("/wordtestlist.do")
	    public String wordtestlist(HttpServletRequest req,WordVO wordVo, Model model) throws Exception{
	    	
	    	wordVo.setCategory(req.getParameter("category"));
	    	int maxShowWord = 1;
	    	if( !(req.getParameter("maxShowWord")+"").equals("") && req.getParameter("maxShowWord") != null)
	    		maxShowWord = Integer.parseInt(req.getParameter("maxShowWord")+"");
	    	List<WordVO> list = service.wordTestlist(wordVo);
	    	list = service.wordReTestlist(list,maxShowWord);
	    	model.addAttribute("list",list);
	    	return "wordtestlist";
	    }
	    
	    @RequestMapping(value = "/wordresult.do", produces = "application/text; charset=utf8")
	    @ResponseBody
	    public String wordresult(WordVO wordVo) throws Exception{
	    	List<WordVO> wordlist = wordVo.getWordVoList();
	    	
	    	Map<String,String> result = service.wordCompare(wordlist);
	    	String success = result.get("success");
	    	String fail = result.get("fail");
	    	String data = "정답:"+success+"실패:"+fail;
	
			String idx = result.get("idx");
			String senten = result.get("senten");
	
			idx.substring(0, idx.length() - 1);
			senten.substring(0, senten.length() - 1);
	
			String[] id = idx.split(",");
			String[] sente = senten.split(",");
			
			Gson gson = new Gson();
			JsonObject obj1 = new JsonObject();
			JsonArray jArray = new JsonArray();
	
			for (int i = 0; i < id.length; i++) {
				JsonObject obj2 = new JsonObject();
	
				obj2.addProperty("idx", id[i]);
				obj2.addProperty("setence", sente[i]);
	
				jArray.add(obj2);
			}
	
			obj1.add("content", jArray);
			obj1.addProperty("result", data);
			String resultJsonArr = gson.toJson(obj1);

			System.out.println(resultJsonArr);

	        return resultJsonArr;
	    }
	    
}
