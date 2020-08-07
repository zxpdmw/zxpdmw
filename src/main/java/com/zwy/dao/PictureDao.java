package com.zwy.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zwy.pojo.Picture;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description: 照片墙持久层接口
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Mapper
@Repository
public interface PictureDao extends BaseMapper<Picture> {
}