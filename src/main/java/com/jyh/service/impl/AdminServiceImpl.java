package com.jyh.service.impl;

import com.jyh.dao.IAdminDao;
import com.jyh.domain.AdminInfo;
import com.jyh.domain.Role;
import com.jyh.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements IAdminService {

    @Autowired
    private IAdminDao adminDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public List<AdminInfo> findAll() {
        return adminDao.findAll();
    }

    public void save(AdminInfo adminInfo) {
        //对密码进行加密处理
        adminInfo.setPassword(bCryptPasswordEncoder.encode(adminInfo.getPassword()));
        adminDao.save(adminInfo);
    }

    @Override
    public AdminInfo findById(Integer id) {
        return adminDao.findById(id);
    }

    @Override
    public List<Role> findOtherRoles(Integer id) {
        return adminDao.findOtherRoles(id);
    }

    @Override
    public void addRoleToAdmin(Integer adminId, Integer[] roleIds) {
        for (Integer roleId:roleIds) {
            adminDao.addRoleToAdmin(adminId, roleId);
        }
    }

    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
        AdminInfo adminInfo = null;
        try {
            adminInfo = adminDao.findByName(name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //处理自己的用户对象封装成UserDetails
        //User user = new User(adminInfo.getName(),"{noop}"+adminInfo.getPassword(),getAuthority(adminInfo.getRoles()));
        User user = new User(adminInfo.getName(), adminInfo.getPassword(), adminInfo.getStatus() == 0 ? false : true, true, true, true, getAuthority(adminInfo.getRoles()));
        return user;
    }

    //作用就是返回一个List集合，集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {

        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));
        }
        return list;
    }
}
