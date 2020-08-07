package com.zwy.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zwy.dao.TypeDao;
import com.zwy.pojo.Type;
import com.zwy.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description: 文章分类业务层接口实现类
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Service
@Transactional
public class TypeServiceImpl extends ServiceImpl<TypeDao,Type> implements TypeService {

    @Autowired
    private TypeDao typeDao;

    @Override
    public List<Type> getAllTypeAndBlog() {
        return typeDao.getAllTypeAndBlog();
    }



}