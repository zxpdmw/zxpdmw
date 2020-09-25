package com.zwy.controller;

import com.zwy.pojo.Message;
import com.zwy.pojo.User;
import com.zwy.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Description: 留言页面控制器
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Controller
public class MessageController {

    @Autowired
    private MessageService messageService;


    private String avatar="https://zwyblog.oss-cn-beijing.aliyuncs.com/avatar.jpg";

    @GetMapping("/message")
    public String message() {
        return "message";
    }

    /**
    * @Description: messages 查询留言
    * @Param: [model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:20
    */
    @GetMapping("/messagecomment")
    public String messages(Model model) {
        List<Message> messages = messageService.listMessage();
        model.addAttribute("messages", messages);
        return "message::messageList";
    }

    /**
    * @Description: add 新增留言
    * @Param: [message, session, model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:20
    */
    @PostMapping("/message")
    public String add(Message message, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        //设置头像
        if (user != null) {
            message.setAvatar(user.getAvatar());
            message.setAdminMessage(true);
        } else {
            message.setAvatar(avatar);
        }
        if (message.getParentMessage().getId() != null) {
            message.setParentMessageId(message.getParentMessage().getId());
        }
        messageService.save(message);
        List<Message> messages = messageService.listMessage();
        model.addAttribute("messages", messages);
        return "message::messageList";
    }

    /**
    * @Description: delete 删除留言
    * @Param: [id, attributes, model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:21
    */
    @GetMapping("/messages/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes attributes, Model model){
        messageService.removeById(id);
        return "redirect:/message";
    }

}