package com.jyh.dao;

import com.jyh.domain.AdminInfo;
import com.jyh.domain.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAdminDao {

    @Select("select * from admin")
    List<AdminInfo> findAll();

    @Insert("insert into admin(name,password,phone,email,status) values(#{name},#{password},#{phone},#{email},#{status})")
    void save(AdminInfo adminInfo);

    @Select("select * from admin where name=#{name}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "password", column = "password"),
            @Result(property = "phone", column = "phone"),
            @Result(property = "email", column = "email"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles",column = "id",javaType = List.class,many = @Many(select = "com.jyh.dao.IRoleDao.findRoleByAdminId"))
    })
    AdminInfo findByName(String name);

    @Select("select * from admin where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "password", column = "password"),
            @Result(property = "phone", column = "phone"),
            @Result(property = "email", column = "email"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles",column = "id",javaType = List.class,many = @Many(select = "com.jyh.dao.IRoleDao.findRoleByAdminId"))
    })
    AdminInfo findById(Integer id);

    @Select("select * from role where id not in( select roleId from admin_role where adminId=#{id})")
    List<Role> findOtherRoles(Integer id);

    @Insert("insert into admin_role(adminId,roleId) values(#{adminId},#{roleId})")
    void addRoleToAdmin(@Param("adminId") Integer adminId, @Param("roleId") Integer roleId);
}
