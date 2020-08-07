package com.zwy.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwy.pojo.FriendLink;
import com.zwy.service.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * @Description: 友链后台管理控制器
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Controller
@RequestMapping("/admin")
public class FriendController {

    @Autowired
    private FriendLinkService friendLinkService;

    /**
    * @Description: friend 查询所有友链
    * @Param: [model, pageNum]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:14
    */
    @GetMapping("/friendlinks")
    public String friend(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum, 10);
        List<FriendLink> listFriendLink = friendLinkService.getBaseMapper().selectList(null);
        PageInfo<FriendLink> pageInfo = new PageInfo<FriendLink>(listFriendLink);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/friendlinks";
    }

    /**
    * @Description: toAdd 跳转友链新增页面
    * @Param: [model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:14
    */
    @GetMapping("/friendlinks/input")
    public String toAdd(Model model) {
        model.addAttribute("friendlink", new FriendLink());
        return "admin/friendlinks-input";
    }

    /**
    * @Description: add 友链新增
    * @Param: [friendLink, result, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:14
    */
    @PostMapping("/friendlinks")
    public String add(@Valid FriendLink friendLink, BindingResult result, RedirectAttributes attributes) {

        FriendLink type1 = friendLinkService.getOne(new QueryWrapper<FriendLink>().eq("blogaddress",friendLink.getBlogaddress()));
        if (type1 != null) {
            attributes.addFlashAttribute("message", "不能添加相同的网址");
            return "redirect:/admin/friendlinks/input";
        }

        if (result.hasErrors()) {
            return "admin/friendlinks-input";
        }
        friendLink.setCreateTime(new Date());
        boolean F = friendLinkService.save(friendLink);
        if (F) {
            attributes.addFlashAttribute("message", "新增成功");
        } else {
            attributes.addFlashAttribute("message", "新增失败");
        }
        return "redirect:/admin/friendlinks";
    }

    /**
    * @Description: toEdit 跳转友链编辑页面
    * @Param: [id, model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:15
    */
    @GetMapping("/friendlinks/{id}/input")
    public String toEdit(@PathVariable Long id, Model model) {
        model.addAttribute("friendLink", friendLinkService.getById(id));
        return "admin/friendlinks-input";
    }

    /**
    * @Description: editPost 编辑友链
    * @Param: [friendLink, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:15
    */
    @PostMapping("/friendlinks/{id}")
    public String editPost(@Valid FriendLink friendLink, RedirectAttributes attributes) {
        boolean save = friendLinkService.updateById(friendLink);
        if (save) {
            attributes.addAttribute("message", "修改成功");
        } else {
            attributes.addAttribute("message", "修改失败");
        }
        return "redirect:/admin/friendlinks";
    }

    /**
    * @Description: delete 删除友链
    * @Param: [id, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:15
    */
    @GetMapping("/friendlinks/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes attributes) {
        boolean b = friendLinkService.removeById(id);
        if (b) {
            attributes.addAttribute("message", "删除成功");
        } else {
            attributes.addAttribute("message", "删除失败");
        }
        return "redirect:/admin/friendlinks";
    }

}