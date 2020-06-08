package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.Category;
import com.spring.WordVO;

@Repository
public class WordDaoImpl implements WordDao {
	@Inject
    private SqlSession sqlsession;
     
    private static final String mapper ="mappers.wordMapper.";

	@Override
	public List<WordVO> wordList(WordVO wordvo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(mapper+"wordList",wordvo);
	}

	@Override
	public void wordadd(WordVO wordVo) {
		sqlsession.insert(mapper+"wordadd",wordVo);
	}

	@Override
	public List<WordVO> wordTestList(WordVO wordVo) {
		
		return sqlsession.selectList(mapper+"wordTestList",wordVo);
	}

	@Override
	public String wordCompare(Integer idx) {
		return sqlsession.selectOne(mapper+"wordCompare", idx);
	}

	@Override
	public List<Category> categoryList(Category category) {
		return sqlsession.selectList(mapper+"categoryList",category);
	}

	@Override
	public void categoryAdd(Category category) {
		sqlsession.insert(mapper+"categoryAdd",category);
	}
    
}