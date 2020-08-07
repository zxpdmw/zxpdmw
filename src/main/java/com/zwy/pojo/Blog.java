package com.zwy.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Description: 博客实体类
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_blog")
public class Blog {
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private String title;
    private String content;
    private String firstPicture;
    private String flag;
    private Integer views;
    private Integer commentCount;
    private boolean appreciation;
    private boolean shareStatement;
    private boolean commentabled;
    private boolean published;
    private boolean recommend;
    private Date createTime;
    private Date updateTime;
    private Long typeId;
    private Long userId;
    private String description;
    @TableField(exist = false)
    private Type type;
    @TableField(exist = false)
    private User user;
    @TableField(exist = false)
    private List<Comment> comments = new ArrayList<>();

}