package mapper;

import entity.News;

/*
* 为 Mapper 增加一个接口，使 Mapper 不再简单地管理 SQL 语句，而是变成 DAO 组件
* 建议接口遵循如下约定：
* Mapper 接口的接口名与对应的 XML 文件同名
* Mapper 接口的源文件与对应的 XML 文件放在相同的包下
* Mapper 接口中的抽象方法的方法名与 XML Mapper 中的 SQL 语句的 id 相同*/
public interface NewsMapper {
    // 方法名必须与 NewsMapper.xml 文件中的 SQL 语句的 id 对应
    // 参数需要与 NewsMapper.xml 文件中的 SQL 语句的参数对应
    int saveNews(News news);
    int updateNews(News news);
    int deleteNews(int a);
    News getNews(int a);
    /**
     * 只需定义 Mapper 接口，无需为接口提供实现类，MyBatis 会负责为这些 Mapper 接口提供实现类
     */
}
