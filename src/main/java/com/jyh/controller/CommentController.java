package com.jyh.controller;

import com.github.pagehelper.PageInfo;
import com.jyh.domain.Comment;
import com.jyh.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private ICommentService commentService;

    //查询所有评论
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "8") Integer size) {
        ModelAndView mv = new ModelAndView();
        List<Comment> commentList = commentService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(commentList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("/comment/comment-list");
        return mv;
    }

    //课程评论
    @RequestMapping("/delete.do")
    public String delete(@RequestParam(name = "ids", required = true) Integer[] ids) {
        commentService.delete(ids);
        return "redirect:findAll.do";
    }

    //查询指定id的评论
    @RequestMapping("/findById.do")
    public ModelAndView findById(Integer id) {
        ModelAndView mv = new ModelAndView();
        Comment comment = commentService.findById(id);
        mv.addObject("comment",comment);
        mv.setViewName("/comment/comment-show");
        return mv;
    }
}
