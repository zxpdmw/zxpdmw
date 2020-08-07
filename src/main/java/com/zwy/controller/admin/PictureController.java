package com.zwy.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwy.pojo.Picture;
import com.zwy.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

/**
 * @Description: 照片墙后台管理控制器
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Controller
@RequestMapping("/admin")
public class PictureController {

    @Autowired
    private PictureService pictureService;

    /** 
    * @Description: pictures  查询照片列表
    * @Param: [model, pageNum]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:05
    */
    @GetMapping("/pictures")
    public String pictures(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Picture> listFriendLink = pictureService.getBaseMapper().selectList(null);
        PageInfo<Picture> pageInfo = new PageInfo<Picture>(listFriendLink);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/pictures";
    }

    /**
    * @Description: toAdd 跳转新增页面
    * @Param: [model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:05
    */
    @GetMapping("/pictures/input")
    public String toAdd(Model model) {
        model.addAttribute("picture",new Picture());
        return "admin/pictures-input";
    }

    /**
    * @Description: add 照片新增
    * @Param: [picture, result, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:05
    */
    @PostMapping("/pictures")
    public String add(@Valid Picture picture, BindingResult result, RedirectAttributes attributes) {
        if(result.hasErrors()){
            return "admin/pictures-input";
        }
        boolean P = pictureService.save(picture);
        if (P ) {
            attributes.addFlashAttribute("message", "新增成功");
        } else {
            attributes.addFlashAttribute("message", "新增失败");
        }
        return "redirect:/admin/pictures";
    }

    /**
    * @Description: toEdit 跳转照片编辑页面
    * @Param: [id, model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:06
    */
    @GetMapping("/pictures/{id}/input")
    public String toEdit(@PathVariable Long id, Model model) {
        model.addAttribute("picture", pictureService.getById(id));
        return "admin/pictures-input";
    }

    /**
    * @Description: edit    编辑相册
    * @Param: [picture, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:06
    */
    @PostMapping("/pictures/{id}")
    public String edit(@Valid Picture picture, RedirectAttributes attributes) {

        boolean P = pictureService.updateById(picture);
        if (P ) {
            attributes.addFlashAttribute("message", "编辑成功");
        } else {
            attributes.addFlashAttribute("message", "编辑失败");
        }
        return "redirect:/admin/pictures";
    }

    /**
    * @Description: delete 删除照片
    * @Param: [id, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:07
    */
    @GetMapping("/pictures/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes attributes) {
        pictureService.removeById(id);
        attributes.addFlashAttribute("message", "删除成功");
        return "redirect:/admin/pictures";
    }

}