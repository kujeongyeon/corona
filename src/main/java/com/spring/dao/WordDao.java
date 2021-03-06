package com.spring.dao;

import java.util.List;

import com.spring.Category;
import com.spring.WordVO;

public interface WordDao {

	List<WordVO> wordList(WordVO wordvo);

	void wordadd(WordVO wordVo);

	List<WordVO> wordTestList(WordVO wordVo);

	String wordCompare(Integer idx);

	List<Category> categoryList(Category category);

	void categoryAdd(Category category);
  
}