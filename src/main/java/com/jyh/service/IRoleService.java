package com.jyh.service;

import com.jyh.domain.Role;

import java.util.List;

public interface IRoleService {

    List<Role> findAll();

    void save(Role role);
}
