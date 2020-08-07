package com.zwy.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import sun.misc.Cache;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description: 分类实体类
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_type")
public class Type {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private String name;
    @TableField(exist = false)
    private List<Blog> blogs = new ArrayList<>();

}