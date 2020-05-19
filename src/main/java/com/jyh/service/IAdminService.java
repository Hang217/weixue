package com.jyh.service;

import com.jyh.domain.AdminInfo;
import com.jyh.domain.Role;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IAdminService extends UserDetailsService {

    List<AdminInfo> findAll();

    void save(AdminInfo adminInfo);

    AdminInfo findById(Integer id);

    List<Role> findOtherRoles(Integer id);

    void addRoleToAdmin(Integer adminId, Integer[] roleIds);
}
