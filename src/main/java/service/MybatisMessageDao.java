package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Amessage;
import model.Bid;
import mybatis.AbstractRepository;

@Component
public class MybatisMessageDao {


	private final String namespace = "mybatis.Amessage";

	@Autowired
	public AbstractRepository opendb;
	
	public int getunreaccount(String id) {
		 SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	           return sqlSession.selectOne(namespace + ".getunreaccount",id);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	}

	public void readcountupdate(String id) {
		        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		        try
		        {

		            sqlSession.update(namespace + ".readcountupdate",id);
		            sqlSession.commit();
		        }
		        finally
		        {
		            sqlSession.close();
		        }
		    }
	
		
	  public List<Amessage> recentmessage(Amessage message)
	    {
	        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	           return sqlSession.selectList(namespace + ".recentmessage",message);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }
	
	  
	  public List<Amessage> selectAllms(Amessage message)
	    {
	        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	           return sqlSession.selectList(namespace + ".selectAllms",message);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }
	  public List<Amessage> recentsender(Amessage message)
	    {
	        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	           return sqlSession.selectList(namespace + ".recentsender",message);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }

	public void insertmessage(Amessage ms) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {

            sqlSession.insert(namespace + ".insertmessage",ms);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
		
	}

	public int selectchatnum(Amessage m) {
		 SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	           return sqlSession.selectOne(namespace + ".selectchatnum",m);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	}
	public int recentnum(Amessage m) {
		 SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	           return sqlSession.selectOne(namespace + ".recentnum",m);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	}

	public String selectReceiver(Amessage ms) {
		 SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	           return sqlSession.selectOne(namespace + ".selectReceiver",ms);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	}
	
	
}