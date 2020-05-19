package com.jyh.service.impl;

import com.github.pagehelper.PageHelper;
import com.jyh.dao.IUserDao;
import com.jyh.domain.UserInfo;
import com.jyh.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    public List<UserInfo> findAll(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return userDao.findAll();
    }

    @Override
    public void save(UserInfo userInfo) {
        userDao.save(userInfo);
    }

    @Override
    public void delete(Integer[] ids) {
        for (Integer id:ids) {
            userDao.deletets(id);
            userDao.delete(id);
        }
    }

    @Override
    public UserInfo findById(Integer id) {
        return userDao.findById(id);
    }

    @Override
    public void update(UserInfo userInfo) {
        userDao.update(userInfo);
    }

    @Override
    public UserInfo findByIds(Integer id) {
        return userDao.findByIds(id);
    }

    @Override
    public void deletes(Integer[] ids) {
        for (Integer id:ids) {
            userDao.deletesc(id);
            userDao.deletest(id);
            userDao.delete(id);
        }
    }
}
