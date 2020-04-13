package service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Auction;
import model.Cash;
import mybatis.AbstractRepository;

@Component
public class MybatisCashDao
{
    
    private final String namespace = "mybatis.Cash";
    
    @Autowired
    public AbstractRepository opendb;
    
    public void insertCash(Cash cash)
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {
            int cnum = sqlSession.selectOne(namespace + ".getCnum");
            cash.setCnum(cnum);
            sqlSession.insert(namespace + ".insertCash", cash);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int myCash(String id)
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".myCash",id);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Cash> getMyCashList(String id)
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectList(namespace + ".getMyCashList", id);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int getMyCashCount(String id)
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".getMyCashCount",id);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Cash> getCashCheckList()
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectList(namespace + ".getCashCheckList");
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void adminCheck(Cash cash) throws Exception 
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try 
        {
                sqlSession.update(namespace + ".adminCheck", cash);
                sqlSession.commit();
        } 
        finally 
        {
                sqlSession.close();
        }
    }
    
    public Cash getCashCnum(int cnum)
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".getCashCnum",cnum);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int getPayCash(String id, int num)
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        Map map = new HashMap();
		map.put("id", id);
		map.put("num", num);
        try
        {
            return sqlSession.selectOne(namespace + ".getPayCash",map);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
   
    
}