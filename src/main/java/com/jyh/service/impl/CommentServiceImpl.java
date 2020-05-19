package com.jyh.service.impl;

import com.github.pagehelper.PageHelper;
import com.jyh.dao.ICommentDao;
import com.jyh.domain.Comment;
import com.jyh.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommentServiceImpl implements ICommentService {

    @Autowired
    private ICommentDao commentDao;

    @Override
    public List<Comment> findAll(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return commentDao.findAll();
    }

    @Override
    public void delete(Integer[] ids) {
        for (Integer id:ids) {
            commentDao.delete(id);
        }
    }

    @Override
    public Comment findById(Integer id) {
        return commentDao.findById(id);
    }
}
