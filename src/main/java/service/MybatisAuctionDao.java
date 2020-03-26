package service;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Auction;
import model.Member;
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
	
	public List<Auction> getAuctions(String id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getAuctions_id", id);
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

	public int getMyBidCount(String id) // ³ªÀÇ ³«Âû»óÇ° Ä«¿îÆ®
	{
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getMyBidCount", id);
		} finally {
			sqlSession.close();
		}
	}

	public List<Auction> getMyBidList(int startRow, int endRow, String id) // ³ªÀÇ ³«Âû»óÇ° ¸ñ·Ï
	{ //³ªÀÇ ³«Âû»óÇ°¸®½ºÆ® °¡Á®¿À±â
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		startRow = startRow - 1;
		endRow = endRow - startRow;
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("id", id);

		try {
			return sqlSession.selectList(namespace + ".getMyBidList_limit", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public Auction getMyBid(String id, int num) { //³ªÀÇ ³«Âû»óÇ° ÄÁÅÙÆ® °¡Á®¿À±â
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Map map = new HashMap();
		map.put("id", id);
		map.put("num", num);
		
		try {
			return sqlSession.selectOne(namespace + ".getMyBid", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public Member getWinnerMemberInfo(String id) //³«ÂûÀÚ Á¤º¸ °¡Á®¿À±â
	{
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getWinnerMemberInfo", id);
		} finally {
			sqlSession.close();
		}
	}

}