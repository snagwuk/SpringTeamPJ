package service;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Auction;
import model.Cash;
import model.Member;
import mybatis.AbstractRepository;

@Component
public class MyInformationDao {

	private final String namespace = "mybatis.MyInformation";

	@Autowired
	public AbstractRepository opendb;

	//한별언니가 한걸루 바꿔용~ -진희-

}