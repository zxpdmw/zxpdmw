package com.zwy;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.zwy.dao.BlogDao;
import com.zwy.pojo.Blog;
import com.zwy.pojo.Comment;
import com.zwy.pojo.Message;
import com.zwy.service.BlogService;
import com.zwy.service.CommentService;
import com.zwy.service.MessageService;
import com.zwy.vo.DetailedBlog;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.jta.WebLogicJtaTransactionManager;

@SpringBootTest
class ZxpdmwApplicationTests {
    @Autowired
    MessageService messageService;
    @Autowired
    CommentService commentService;
    @Autowired
    BlogService blogService;
    @Autowired
    BlogDao blogDao;
    @Test
    void contextLoads() {
//        Message message = new Message();
//        message.setNickname("zzzzzzzzzzzzzzzz");
//        System.out.println(messageService.save(message));
//        Message message1 = new Message();
//        message1.setNickname("11111111111");
//        System.out.println(messageService.saveMessage(message1));
//        Comment id = commentService.getOne(new QueryWrapper<Comment>().eq("id",32));
//        System.out.println(id);
//        id.setEmail("123456789");
////        System.out.println(commentService.removeById(id.getId()));
//        id.setNickname("我爱你");
//        System.out.println(commentService.save(id));
//        Integer blogViewTotal = blogDao.getBlogViewTotal();
//        System.out.println(blogViewTotal);
        Blog blog = blogService.getOne(new QueryWrapper<Blog>().eq("id", 1));
        System.out.println(blog);
        System.out.println(blogService.update(new UpdateWrapper<Blog>().eq("id", 1).set("views", blog.getViews() + 1)));
//        Integer blogViewTotal2 = blogDao.getBlogViewTotal();
//        System.out.println(blogViewTotal);

    }
    @Test
    void test(){
        DetailedBlog detailedBlog = blogService.getDetailedBlog(2L);
//        System.out.println(detailedBlog);
        boolean update = blogService.update(new UpdateWrapper<Blog>().eq("id", 2l).set("views", detailedBlog.getViews() + 1));
        System.out.println(update);
    }

}
