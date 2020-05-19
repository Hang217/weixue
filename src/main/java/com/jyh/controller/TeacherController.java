package com.jyh.controller;

import com.github.pagehelper.PageInfo;
import com.jyh.domain.UserInfo;
import com.jyh.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private IUserService userService;

    //查询所有用户
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "8") Integer size) {
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userList = userService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(userList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("/teacher/teacher-list");
        return mv;
    }

    //用户添加
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo) {
        userService.save(userInfo);
        return "redirect:findAll.do";
    }

    //用户删除
    @RequestMapping("/delete.do")
    public String delete(@RequestParam(name = "ids", required = true) Integer[] ids) {
        userService.delete(ids);
        return "redirect:findAll.do";
    }

    //查询指定id的管理员
    @RequestMapping("/findById.do")
    public ModelAndView findById(Integer id) {
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        mv.addObject("user",userInfo);
        mv.setViewName("/teacher/teacher-show");
        return mv;
    }

    //查询指定id的管理员
    @RequestMapping("/findByIdAndUpdate.do")
    public ModelAndView findByIdAndUpdate(Integer id) {
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        mv.addObject("user",userInfo);
        mv.setViewName("/teacher/teacher-update");
        return mv;
    }

    //用户更新
    @RequestMapping("/update.do")
    public String update(UserInfo userInfo) {
        userService.update(userInfo);
        return "redirect:findAll.do";
    }
}
