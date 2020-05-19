package com.jyh.service;

import com.jyh.domain.Course;

import java.util.List;

public interface ICourseService {
    
    List<Course> findAll(Integer page, Integer size);

    void delete(Integer[] ids);

    Course findById(Integer id);
}
