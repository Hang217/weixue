package com.jyh.controller;

import com.jyh.domain.AdminInfo;
import com.jyh.domain.Role;
import com.jyh.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private IAdminService adminService;

    //查询所有管理员
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<AdminInfo> adminList = adminService.findAll();
        mv.addObject("adminList", adminList);
        mv.setViewName("/admin/admin-list");
        return mv;
    }

    //管理员添加
    @RequestMapping("/save.do")
    @Secured("ROLE_ADMIN")
    public String save(AdminInfo adminInfo) {
        adminService.save(adminInfo);
        return "redirect:findAll.do";
    }

    //查询指定id的管理员
    @RequestMapping("/findById.do")
    @Secured("ROLE_ADMIN")
    public ModelAndView findById(Integer id) {
        ModelAndView mv = new ModelAndView();
        AdminInfo adminInfo = adminService.findById(id);
        mv.addObject("admin",adminInfo);
        mv.setViewName("/admin/admin-show");
        return mv;
    }

    //查询管理员以及管理员可以添加的角色
    @RequestMapping("/findAdminByIdAndAllRole.do")
    @Secured("ROLE_ADMIN")
    public ModelAndView findAdminByIdAndAllRole(@RequestParam(name = "id", required = true) Integer id) {
        ModelAndView mv = new ModelAndView();
        //1.根据用户id查询用户
        AdminInfo adminInfo = adminService.findById(id);
        //2.根据用户id查询可以添加的角色
        List<Role> otherRoles = adminService.findOtherRoles(id);
        mv.addObject("admin", adminInfo);
        mv.addObject("roleList", otherRoles);
        mv.setViewName("/admin/admin-role-add");
        return mv;
    }

    //给管理员添加角色
    @RequestMapping("/addRoleToAdmin.do")
    @Secured("ROLE_ADMIN")
    public String addRoleToAdmin(@RequestParam(name = "id", required = true) Integer adminId, @RequestParam(name = "ids", required = true) Integer[] roleIds) {
        adminService.addRoleToAdmin(adminId, roleIds);
        return "redirect:findAll.do";
    }
}
