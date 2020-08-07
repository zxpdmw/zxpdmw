package com.zwy.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zwy.pojo.Type;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: ONESTAR
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Mapper
@Repository
public interface TypeDao extends BaseMapper<Type> {

    List<Type> getAllTypeAndBlog();
}