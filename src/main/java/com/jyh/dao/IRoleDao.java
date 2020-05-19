package com.jyh.dao;

import com.jyh.domain.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IRoleDao {

    //根据管理员id查询出所有对应的角色
    @Select("select * from role where id in (select roleId from admin_role where adminId=#{adminId})")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc")
    })
    public List<Role> findRoleByAdminId(Integer adminId);

    @Select("select * from role")
    List<Role> findAll();

    @Insert("insert into role(roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void save(Role role);
}
