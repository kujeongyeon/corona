package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.Category;
import com.spring.WordVO;

public interface WordService {
    
    public List<WordVO> wordlist(WordVO wordvo) throws Exception;

	public void wordadd(WordVO wordVo);

	public List<WordVO> wordTestlist(WordVO wordVo);

	public List<WordVO> wordReTestlist(List<WordVO> list,int maxShowWord);

	public Map<String,String> wordCompare(List<WordVO> wordlist);

	public List<Category> categorylist(Category category);

	public void categoryadd(Category category);
     
}
