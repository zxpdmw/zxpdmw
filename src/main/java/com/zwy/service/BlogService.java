package com.zwy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zwy.pojo.Blog;
import com.zwy.vo.*;

import java.util.List;

/**
 * @Description: 博客列表业务层接口
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
public interface BlogService extends IService<Blog> {

    List<BlogQuery> getAllBlogQuery();

    List<BlogQuery> getBlogBySearch(SearchBlog searchBlog);

    List<FirstPageBlog> getAllFirstPageBlog();

    List<RecommendBlog> getRecommendedBlog();

    List<FirstPageBlog> getSearchBlog(String query);

    DetailedBlog getDetailedBlog(Long id);

    //根据TypeId获取博客列表，在分类页进行的操作
    List<FirstPageBlog> getByTypeId(Long typeId);

    Integer getBlogViewTotal();


}