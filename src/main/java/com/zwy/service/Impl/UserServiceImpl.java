package com.zwy.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zwy.dao.UserDao;
import com.zwy.pojo.User;
import com.zwy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description: 用户业务层接口实现类
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserDao,User> implements UserService {
}