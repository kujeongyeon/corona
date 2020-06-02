package com.spring.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.WordVO;
import com.spring.dao.WordDao;

@Service
public class WordServiceImpl implements WordService{
    
   @Inject
   private WordDao dao;
	
	
	@Override
	public List<WordVO> wordlist(WordVO wordvo) throws Exception {
		return dao.wordList(wordvo);
	}


	@Override
	public void wordadd(WordVO wordVo) {
		dao.wordadd(wordVo);
	}


	@Override
	public List<WordVO> wordTestlist(WordVO wordVo) {
		return dao.wordTestList(wordVo);
	}


	@Override
	public List<WordVO> wordReTestlist(List<WordVO> list, int maxShowWord) {
		
		for (int i = 0; i < list.size(); i++) {
			String sentence = list.get(i).getSentence();
			String[] array = sentence.split(" +");
			
			String resentence = "";
			int max = maxShowWord;
			if(array.length < max) {
				max = array.length;
			}
			
			for (int j = 0; j < max; j++) {
				resentence += array[j]+" ";
			}
			list.get(i).setSentence(resentence);
		}
		
		return list;
	}
   
}

