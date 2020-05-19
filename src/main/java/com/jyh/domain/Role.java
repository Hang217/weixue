package com.jyh.domain;

import java.util.List;

public class Role {
    private Integer id;
    private String roleName;//角色名
    private String roleDesc;//角色级别 vip
    private List<AdminInfo> admins;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public List<AdminInfo> getUsers() {
        return admins;
    }

    public void setUsers(List<AdminInfo> admins) {
        this.admins = admins;
    }
}
