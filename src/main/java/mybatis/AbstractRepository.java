package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public abstract class AbstractRepository
{
    private SqlSessionFactory sqlSessionFactory;
    
    String resource;
    String dbname = "Mysql";
    
    private void setSqlSessionFactory()
    {
        
        InputStream inputStream;
        try
        {
            inputStream = Resources.getResourceAsStream("mybatis/mybatis-" + dbname + ".xml");
        }
        catch (IOException e)
        {
            throw new IllegalArgumentException(e);
        }
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }
    
    protected SqlSessionFactory getSqlSessionFactory()
    {
        setSqlSessionFactory();
        return sqlSessionFactory;
    }
    
 
}
