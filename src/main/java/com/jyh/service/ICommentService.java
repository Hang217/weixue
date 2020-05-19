package com.jyh.service;

import com.jyh.domain.Comment;

import java.util.List;

public interface ICommentService {

    List<Comment> findAll(Integer page, Integer size);

    void delete(Integer[] ids);

    Comment findById(Integer id);
}
