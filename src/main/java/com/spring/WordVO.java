package com.spring;

import java.util.List;

public class WordVO {
	
	private Integer idx;
	private String sentence;
	private String content;
	private String category;
	
	private List<WordVO> wordVoList;
	
	public List<WordVO> getWordVoList() {
		return wordVoList;
	}
	public void setWordVoList(List<WordVO> wordVoList) {
		this.wordVoList = wordVoList;
	}
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public String getSentence() {
		return sentence;
	}
	public void setSentence(String sentence) {
		this.sentence = sentence;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
