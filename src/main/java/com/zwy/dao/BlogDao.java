package com.zwy.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zwy.pojo.Blog;
import com.zwy.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description: 博客持久层接口
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Mapper
@Repository
public interface BlogDao extends BaseMapper<Blog> {

    List<BlogQuery> getAllBlogQuery();

    List<BlogQuery> searchByTitleOrTypeOrRecommend(SearchBlog searchBlog);

    List<FirstPageBlog> getFirstPageBlog();

    List<RecommendBlog> getAllRecommendBlog();

    List<FirstPageBlog> getSearchBlog(String query);

    DetailedBlog getDetailedBlog(Long id);

    int getCommentCountById(Long id);

    List<FirstPageBlog> getByTypeId(Long typeId);

    @Select("select sum(views) from t_blog")
    Integer getBlogViewTotal();

}