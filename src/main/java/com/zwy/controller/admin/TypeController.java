package com.zwy.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwy.pojo.Type;
import com.zwy.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

/**
 * @Description: 分类管理控制器
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Controller
@RequestMapping("/admin")
public class TypeController {

    @Autowired
    private TypeService typeService;

    /**
    * @Description: list 分页查询分类列表
    * @Param: [model, pageNum]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:17
    */
    @GetMapping("/types")
    public String list(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        //按照排序字段 倒序 排序
        String orderBy = "id desc";
        PageHelper.startPage(pageNum,10,orderBy);
        List<Type> list = typeService.getBaseMapper().selectList(null);
        PageInfo<Type> pageInfo = new PageInfo<Type>(list);
        model.addAttribute("pageInfo",pageInfo);
        return "admin/types";
    }

    /**
    * @Description: toAdd 返回新增分类页面
    * @Param: [model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:17
    */
    @GetMapping("/types/input")
    public String toAdd(Model model) {
        model.addAttribute("type", new Type());
        return "admin/types-input";
    }

    /**
    * @Description: add 新增分类
    * @Param: [type, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:17
    */
    @PostMapping("/types")
    public String add(@Valid Type type, RedirectAttributes attributes) {
        Type type1 = typeService.getOne(new QueryWrapper<Type>().eq("name",type.getName()));
        if (type1 != null) {
            attributes.addFlashAttribute("message", "不能添加重复的分类");
            return "redirect:/admin/types/input";
        }
        boolean save = typeService.save(type);
        if (save){
            attributes.addAttribute("message","添加成功");
        }else {
            attributes.addAttribute("message","添加失败");
        }
        return "redirect:/admin/types";
    }

    /**
    * @Description: toEdit 跳转修改分类页面
    * @Param: [id, model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:17
    */
    @GetMapping("/types/{id}/input")
    public String toEdit(@PathVariable Long id, Model model) {

        return "admin/types-input";
    }

    /**
    * @Description: editPost 编辑分类
    * @Param: [type, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:18
    */
    @PostMapping("/types/{id}")
    public String editPost(@Valid Type type, RedirectAttributes attributes) {
        Type type1 = typeService.getOne(new QueryWrapper<Type>().eq("name",type.getName()));
        if (type1 != null) {
            attributes.addFlashAttribute("message", "不能添加重复的分类");
            return "redirect:/admin/types/input";
        }
        boolean t = typeService.updateById(type);
        if (t ) {
            attributes.addFlashAttribute("message", "编辑成功");
        } else {
            attributes.addFlashAttribute("message", "编辑失败");
        }
        return "redirect:/admin/types";
    }

    /**
    * @Description: delete 删除分类
    * @Param: [id, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:18
    */
    @GetMapping("/types/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes attributes) {
        boolean b = typeService.removeById(id);
        if (b){
            attributes.addAttribute("message","删除成功");
        }else {
            attributes.addAttribute("message","删除失败");
        }
        return "redirect:/admin/types";
    }
}