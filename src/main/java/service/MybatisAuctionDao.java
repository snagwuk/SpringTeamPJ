package service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import model.Auction;
import mybatis.AbstractRepository;
@Component
public class MybatisAuctionDao extends AbstractRepository
{
    private final String namespace = "mybatis.Auction";

 
    public void insertauction(Auction auction)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            int num = sqlSession.selectOne(namespace + ".insertAuction_num");
            auction.setNum(num);
            sqlSession.insert(namespace + ".insertAuction",auction); 
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int getAuctionCount()
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            return sqlSession.selectOne(namespace + ".getAuctionCount");
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Auction> getAuctions(int startRow, int endRow)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        startRow = startRow - 1;
        endRow = endRow - startRow;
        Map map = new HashMap();
        map.put("startRow", startRow);
        map.put("endRow", endRow);
        
        List<Auction> result = new ArrayList<>();
        try
        {
            return sqlSession.selectList(namespace + ".getAuctions_limit",map);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public List<Auction> getAuctions(String id)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
           return sqlSession.selectList(namespace + ".getAuctions_id",id);      
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public Auction getAuction(int num)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {     
           return sqlSession.selectOne(namespace + ".getAuction",num);   
        }
        finally
        {
            sqlSession.close();
        }
    }
    
  
    
    public void updateContent(Auction Auction) throws Exception
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
               sqlSession.update(namespace + ".updateContent",Auction);  
               sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void deleteAuction(int num)
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
               sqlSession.delete(namespace + ".deleteAuction",num);  
               sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
}