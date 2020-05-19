package com.jyh.controller;

import com.github.pagehelper.PageInfo;
import com.jyh.domain.Course;
import com.jyh.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private ICourseService courseService;

    //查询所有课程
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "8") Integer size) {
        ModelAndView mv = new ModelAndView();
        List<Course> courseList = courseService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(courseList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("/course/course-list");
        return mv;
    }

    //课程删除
    @RequestMapping("/delete.do")
    public String delete(@RequestParam(name = "ids", required = true) Integer[] ids) {
        courseService.delete(ids);
        return "redirect:findAll.do";
    }

    //查询指定id的课程
    @RequestMapping("/findById.do")
    public ModelAndView findById(Integer id) {
        ModelAndView mv = new ModelAndView();
        Course course = courseService.findById(id);
        mv.addObject("course",course);
        mv.setViewName("/course/course-show");
        return mv;
    }
}
