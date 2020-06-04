package com.spring.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


	@Override
	public Map<String,String> wordCompare(List<WordVO> wordlist) {
		
		int all = wordlist.size();
		int success = all;
		String idx = "";
		String senten = "";
		
		for (int i = 0; i < wordlist.size(); i++) {
			
			String origin_sentence = dao.wordCompare(wordlist.get(i).getIdx());
			String sentence = wordlist.get(i).getSentence();
			String origin_sentence_ver = origin_sentence.replaceAll("\\p{Z}", "");
			sentence = sentence.replaceAll("\\p{Z}", "");
			
			if(!origin_sentence_ver.equals(sentence)) {
				success -= 1;
				idx +=  wordlist.get(i).getIdx() + ",";
				senten += origin_sentence + ",";
			}
		}
		Map<String,String> result = new HashMap<String,String>();
		
		result.put("success", success+"");
		result.put("fail", all-success+"");
		result.put("idx", idx);
		result.put("senten", senten);
		
		return result;
	}
   
}

