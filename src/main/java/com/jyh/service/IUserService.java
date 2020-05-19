package com.jyh.service;

import com.jyh.domain.UserInfo;

import java.util.List;

public interface IUserService {

    List<UserInfo> findAll(Integer page, Integer size);

    void save(UserInfo userInfo);

    void delete(Integer[] ids);

    UserInfo findById(Integer id);

    void update(UserInfo userInfo);

    UserInfo findByIds(Integer id);

    void deletes(Integer[] ids);
}
