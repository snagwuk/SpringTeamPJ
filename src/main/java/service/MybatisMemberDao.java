package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Auction;
import model.Member;
import mybatis.AbstractRepository;

@Component
public class MybatisMemberDao {

	private final String namespace = "mybatis.Member";

	@Autowired
	public AbstractRepository dbPro;

	 public void insertmember(Member member){
	        SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
	        try
	        {
	            sqlSession.insert(namespace + ".insertMember",member);
	            sqlSession.commit();
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	    }
	 public int idcheck(String id){
	        SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
	        try {
	            return sqlSession.selectOne(namespace + ".idcheck",id);
	        }
	        finally {
	            sqlSession.close();
	        }
	    }
	 public String authenticate(String password){
	        SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
	        try {
	            return sqlSession.selectOne(namespace + ".authenticate",password);
	        }
	        finally {
	            sqlSession.close();
	        }
	    }
	 public Member selectmember(String id){
	        SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
	        try {
	            return sqlSession.selectOne(namespace + ".selectmember",id);
	        }
	        finally {
	            sqlSession.close();
	        }
	    }
	 public void updatemember(Member member){

	        SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
	        try {
	            sqlSession.update(namespace + ".updatemember",member);
	            sqlSession.commit();
	        }
	        finally {
	        	sqlSession.close();
	        }
	    }
	 public Member getMemberinfo(String id) {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				return sqlSession.selectOne(namespace + ".getMemberinfo", id);
			} finally {
				sqlSession.close();
			}
		}
	 public List<Member> selectposition() {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				return sqlSession.selectList(namespace + ".selectposition");
			} finally {
				sqlSession.close();
			}
		}
	 public void upposition(String id) {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				sqlSession.update(namespace + ".upposition",id);
				sqlSession.commit();
			} finally {
				sqlSession.close();
			}
		}
	 public void downposition(String id) {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				sqlSession.update(namespace + ".downposition",id);
				sqlSession.commit();
			} finally {
				sqlSession.close();
			}
		}
	 public void modifymember(Member member) {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				sqlSession.update(namespace + ".modifymember",member);
				sqlSession.commit();
			} finally {
				sqlSession.close();
			}
		}
	 public void memberStop(String id) {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				sqlSession.update(namespace + ".memberStop",id);
				sqlSession.commit();
			} finally {
				sqlSession.close();
			}
		}
	 public void memberStart(String id) {
			SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
			try {
				sqlSession.update(namespace + ".memberStart",id);
				sqlSession.commit();
			} finally {
				sqlSession.close();
			}
		}
	 public List<Member> memberList(){
	        SqlSession sqlSession = dbPro.getSqlSessionFactory().openSession();
	        try {
	            return sqlSession.selectList(namespace + ".memberList");
	        }
	        finally {
	            sqlSession.close();
	        }
	    }
}
