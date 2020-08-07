package com.zwy.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zwy.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @Description: 用户持久层接口
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Mapper
@Repository
public interface UserDao extends BaseMapper<User> {
}