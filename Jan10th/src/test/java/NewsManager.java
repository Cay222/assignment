import entity.News;
import mapper.NewsMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

public class NewsManager {
    /*
     MyBatis 操作数据库的核心 API 是 SqlSession，因此在调用 MyBatis 执行持久化操作之前，必须先获得 SqlSession
     步骤如下：
     使用 Mapper 定义 SQL 语句
     创建 SqlSessionFactoryBuilder
     调用 SqlSessionFactoryBuilder 对象的 build() 方法创建 SqlSessionFactory
     获取 SqlSession（同时会打开事务）
     调用 SqlSession 的方法执行 Mapper 中定义的 SQL 语句（或通过 Mapper 对象来操作数据库）
     关闭事务，关闭 SqlSession*/
    @Test
    public void insertTest() throws Exception{
        // 使用 Resources 工具从类加载路径下加载指定文件
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        // 构建 SqlSessionFactory
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        // 打开 session
        SqlSession sqlSession = sqlSessionFactory.openSession();

        /**
         * // 创建消息实例
         * Map<String, String> news = new HashMap<>();
         * // 设置消息标题和消息内容
         * news.put("title", "冬奥会即将到来");
         * news.put("content", "每个人都十分期待");
         * 调用 insert 方法执行 SQL 语句
         */

        /*
         MyBatis 的 insert() 方法在底层封装了下面的过程：
         获取 Connection 对象（数据库连接）
         根据 insert() 方法第一个参数指定的 SQL 语句创建 PreparedStatement
         根据 insert() 方法的第二个参数为 PreparedStatement 设置参数
         调用 PreparedStatement 的 execute() 方法执行 SQL 语句
         */

        // 创建消息实例
        News news = new News();
        // 设置消息标题和内容
        news.setTitle("冬奥会即将到来");
        news.setContent("每个人都开心");
        // 获取 Mapper 对象
        NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
        // 调用 Mapper 对象的方法执行持久化操作
        int n = newsMapper.saveNews(news);
        System.out.printf("插入了%d条数据%n", n);
        // 提交事务
        sqlSession.commit();
        // 关闭资源
        sqlSession.close();
    }

    @Test
    public void updateTest() throws Exception {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();

        News news = new News();
        news.setId(2);
        news.setTitle("神十三上天");
        news.setContent("举国欢庆");

        NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
        int n = newsMapper.updateNews(news);
        System.out.printf("更新了%d条数据%n", n);
        sqlSession.commit();
        sqlSession.close();
    }

    @Test
    public void deleteTest() throws Exception {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();

        NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
        int n = newsMapper.deleteNews(1);
        System.out.printf("删除了%d条数据%n", n);
        sqlSession.commit();
        sqlSession.close();
    }

    @Test
    public void selectTest() throws Exception {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();

        NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
        News news = newsMapper.getNews(2);
        System.out.println("查询到的记录为：" + news);
        sqlSession.commit();
        sqlSession.close();
    }
}
