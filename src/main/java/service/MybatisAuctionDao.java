package service;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Amessage;
import model.Auction;
import model.Bid;
import model.Cash;
import model.Member;
import model.Wishseller;
import mybatis.AbstractRepository;

@Component
public class MybatisAuctionDao {


	private final String namespace = "mybatis.Auction";

	@Autowired
	public AbstractRepository opendb;

	public void insertauction(Auction auction) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			int num = sqlSession.selectOne(namespace + ".insertAuction_num");
			auction.setNum(num);
			sqlSession.insert(namespace + ".insertAuction", auction);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public int getAuctionCount() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getAuctionCount");
		} finally {
			sqlSession.close();
		}
	}

	public List<Auction> getAuctions(int startRow, int endRow) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		startRow = startRow - 1;
		endRow = endRow - startRow;
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		try {
			return sqlSession.selectList(namespace + ".getAuctions_limit", map);
		} finally {
			sqlSession.close();
		}
	}



	public Auction getAuction(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getAuction", num);
		} finally {
			sqlSession.close();
		}
	}

	

	public void updateContent(Auction Auction) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			sqlSession.update(namespace + ".updateContent", Auction);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public void deleteAuction(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			sqlSession.delete(namespace + ".deleteAuction", num);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////


	public int getMyAuctionCount(String id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getMyAuctionCount", id);
		} finally {
			sqlSession.close();
		}
	}
	
	public int getMyBidCount(String id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getMyBidCount", id);
		} finally {
			sqlSession.close();
		}
	}
	

	public List<Auction> getMyAuctionList(int startRow, int endRow, String seller) { //내 판매물품리스트 불러오기
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		startRow = startRow - 1;
		endRow = endRow - startRow;
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("seller", seller);

		try {
			return sqlSession.selectList(namespace + ".getMyAuctionList_limit", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<Auction> getMyBidList(int startRow, int endRow, String winid) { //내 구매물품리스트 불러오기
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		startRow = startRow - 1;
		endRow = endRow - startRow;
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("winid", winid);

		try {
			return sqlSession.selectList(namespace + ".getMyBidList_limit", map);
		} finally {
			sqlSession.close();
		}
	}

	public Auction getMyAuctionContent(Auction auction) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getMyAuctionContent", auction);
		} finally {
			sqlSession.close();
		}
	}
	
	

	public Auction getMyBidCompleteAuction(Auction auction) { //나의 낙찰상품 가져오기
		
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getMyBidCompleteAuction", auction);
		} finally {
			sqlSession.close();
		}
	}

	
	
	public void updateAuctionStatus(Auction Auction) throws Exception { //나의 상품 상태 "배송중"으로 업데이트
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			sqlSession.update(namespace + ".updateAuctionStatus", Auction);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}


	
	
	
	
    /*������Ʈ*/
    public int gethightprice(int num)
    {
        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
        try
        {
           return sqlSession.selectOne(namespace + ".gethightprice",num);
        }
        finally
        {
            sqlSession.close();
        }
    }


	 public void insertbid(Bid abid)
	    {
	        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {

	            sqlSession.insert(namespace + ".insertbid",abid);
	            sqlSession.commit();
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }

	  public List<Bid> getbidlist(int num)
	    {
	        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	           return sqlSession.selectList(namespace + ".getbidlist",num);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }

	  public int getbidunit(int num)
	    {
	        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	           return sqlSession.selectOne(namespace + ".getbidunit",num);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }

	  public List<Auction> getmyseller(int startRow, int endRow,String id)
	    {
	        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        startRow = startRow - 1;
	        endRow = endRow - startRow;
	        Map map = new HashMap();
	        map.put("startRow", startRow);
	        map.put("endRow", endRow);
	        map.put("id", id);

	        List<Auction> result = new ArrayList<>();
	        try
	        {
	            return sqlSession.selectList(namespace + ".getmyseller",map);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }



	  public List<Auction> getsellerstore(int startRow, int endRow,String id)
	    {
	        SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        startRow = startRow - 1;
	        endRow = endRow - startRow;
	        Map map = new HashMap();
	        map.put("startRow", startRow);
	        map.put("endRow", endRow);
	        map.put("id", id);
	        
	        List<Auction> result = new ArrayList<>();
	        try
	        {
	            return sqlSession.selectList(namespace + ".getsellerstore",map);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }

	public void addseller(Wishseller seller) {
	
			SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
			try {
			
				sqlSession.insert(namespace + ".addseller", seller);
				sqlSession.commit();
			} finally {
				sqlSession.close();
			}
		}

	public int selectseller(Wishseller ws) {
		  SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	        try
	        {
	           return sqlSession.selectOne(namespace + ".selectseller",ws);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	}




	  
	  
}

