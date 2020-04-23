package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Auction;
import model.Category;

import mybatis.AbstractRepository;

@Component
public class MybatisCategoryDao {
	private final String namespace = "mybatis.Category";

	@Autowired
	public AbstractRepository dbPro;
	
	 public List<Category> selectsecond(Category c) {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				return sqlSession.selectList(namespace + ".selectsecond",c);
			} finally {
				sqlSession.close();
			}
		}
	   
	 public List<Category> selectfirst() {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				return sqlSession.selectList(namespace + ".selectfirst");
			} finally {
				sqlSession.close();
			}
		}
	 public List<Category> selectAllcategory() {
		 SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		 try {
			 return sqlSession.selectList(namespace + ".selectAllcategory");
		 } finally {
			 sqlSession.close();
		 }
	 }
	 
	 public List<Auction> selectbyCategory(int startRow, int endRow, int num) {
			
	        SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
	        startRow = startRow - 1;
	        endRow = endRow - startRow;
	        Map map = new HashMap();
	        map.put("startRow", startRow);
	        map.put("endRow", endRow);
	        map.put("refnum", num);
	        
	        List<Auction> result = new ArrayList<>();
	        try
	        {
	            return sqlSession.selectList(namespace + ".selectbyCategory", map);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }
	 public List<Auction> selectbysecondCategory(int startRow, int endRow, int num) {
		 
		 SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		 startRow = startRow - 1;
		 endRow = endRow - startRow;
		 Map map = new HashMap();
		 map.put("startRow", startRow);
		 map.put("endRow", endRow);
		 map.put("num", num);
		 
		 List<Auction> result = new ArrayList<>();
		 try
		 {
			 return sqlSession.selectList(namespace + ".selectbysecondCategory", map);
		 }
		 finally
		 {
			 sqlSession.close();
		 }
	 }

	public int getCatagoryCount(int num) {
		 SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		 try {
			 return sqlSession.selectOne(namespace + ".getCatagoryCount",num);
		 } finally {
			 sqlSession.close();
		 }
	}
	public int getSecondCatagoryCount(int num) {
		SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getSecondCatagoryCount",num);
		} finally {
			sqlSession.close();
		}
	}
}
