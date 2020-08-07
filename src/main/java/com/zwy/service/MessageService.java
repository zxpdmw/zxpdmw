package com.zwy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zwy.pojo.Message;

import java.util.List;

/**
 * @Description: 留言业务层接口
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
public interface MessageService extends IService<Message> {

    //查询留言列表
    List<Message> listMessage();
}