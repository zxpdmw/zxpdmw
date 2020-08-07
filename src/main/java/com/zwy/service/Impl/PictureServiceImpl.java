package com.zwy.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zwy.dao.PictureDao;
import com.zwy.pojo.Picture;
import com.zwy.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description: 照片墙业务层接口实现类
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Service
@Transactional
public class PictureServiceImpl extends ServiceImpl<PictureDao,Picture> implements PictureService {
}