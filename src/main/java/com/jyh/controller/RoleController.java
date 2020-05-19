package com.jyh.controller;

import com.jyh.domain.Role;
import com.jyh.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    //查询所有角色
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() {
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll();
        mv.addObject("roleList", roleList);
        mv.setViewName("/role/role-list");
        return mv;
    }

    //角色添加
    @RequestMapping("/save.do")
    @Secured("ROLE_ADMIN")
    public String save(Role role) {
        roleService.save(role);
        return "redirect:findAll.do";
    }
}
