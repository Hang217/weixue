package com.jyh.service.impl;

import com.github.pagehelper.PageHelper;
import com.jyh.dao.ICollectDao;
import com.jyh.dao.ICourseDao;
import com.jyh.domain.Course;
import com.jyh.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CourseServiceImpl implements ICourseService {

    @Autowired
    private ICourseDao courseDao;

    @Autowired
    private ICollectDao collectDao;

    @Override
    public List<Course> findAll(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return courseDao.findAll();
    }

    @Override
    public void delete(Integer[] ids) {
        for (Integer id:ids) {
            courseDao.delete(id);
        }
    }

    @Override
    public Course findById(Integer id) {
        return courseDao.findById(id);
    }
}
