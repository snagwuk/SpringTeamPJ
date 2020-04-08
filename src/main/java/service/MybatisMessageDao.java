package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public void readcountupdate(int chatnum, String id) {
		        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		        Map map = new HashMap();
				map.put("num", chatnum);
				map.put("receiver", id);
		        try
		        {

		            sqlSession.update(namespace + ".readcountupdate",map);
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
	public void insertnewmessage(Amessage ms) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try
		{
			
			sqlSession.insert(namespace + ".insertnewmessage",ms);
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
	
	public int checkchatnum(Amessage m) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try
		{
			return sqlSession.selectOne(namespace + ".checkchatnum",m);
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

	public void deleteintromessage(Amessage me) {
		   SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      
	        try
	        {

	            sqlSession.delete(namespace + ".deleteintromessage",me);
	            sqlSession.commit();
	        }
	        finally
	        {
	            sqlSession.close();
	        }
		
	}
	
	
}