package com.jyh.dao;

import com.jyh.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUserDao {

    @Select("select * from user")
    List<UserInfo> findAll();

    @Insert("insert into " +
            "user(username,password,num,name,sex,telephone,college,profession," +
            "grade,specialty,course,email,elucidation) " +
            "values(#{username},#{password},#{num},#{name},#{sex},#{telephone},#{college},#{profession}," +
            "#{grade},#{specialty},#{course},#{email},#{elucidation})")
    void save(UserInfo userInfo);

    @Delete("delete from user where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "imgUrl", column = "imgUrl"),
            @Result(property = "username", column = "username"),
            @Result(property = "password", column = "password"),
            @Result(property = "num", column = "num"),
            @Result(property = "name", column = "name"),
            @Result(property = "sex", column = "sex"),
            @Result(property = "telephone", column = "telephone"),
            @Result(property = "college", column = "college"),
            @Result(property = "profession", column = "profession"),
            @Result(property = "grade", column = "grade"),
            @Result(property = "specialty", column = "specialty"),
            @Result(property = "course", column = "course"),
            @Result(property = "email", column = "email"),
            @Result(property = "elucidation", column = "elucidation"),
            @Result(property = "collects",column = "id",javaType = List.class,many = @Many(select = "com.jyh.dao.ICollectDao.deleteCollectByUserId")),
            @Result(property = "comments",column = "id",javaType = List.class,many = @Many(select = "com.jyh.dao.ICommentDao.deleteCommentByUserId"))
    })
    void delete(Integer id);

    @Delete("delete from u_c where userId=#{id}")
    void deletesc(Integer id);

    @Delete("delete from u_u where userId_s=#{id}")
    void deletest(Integer id);

    @Delete("delete from u_u where userId_t=#{id}")
    void deletets(Integer id);

    @Select("select * from user where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "imgUrl", column = "imgUrl"),
            @Result(property = "username", column = "username"),
            @Result(property = "password", column = "password"),
            @Result(property = "num", column = "num"),
            @Result(property = "name", column = "name"),
            @Result(property = "sex", column = "sex"),
            @Result(property = "telephone", column = "telephone"),
            @Result(property = "college", column = "college"),
            @Result(property = "profession", column = "profession"),
            @Result(property = "grade", column = "grade"),
            @Result(property = "specialty", column = "specialty"),
            @Result(property = "course", column = "course"),
            @Result(property = "email", column = "email"),
            @Result(property = "elucidation", column = "elucidation"),
            @Result(property = "collects",column = "id",javaType = List.class,many = @Many(select = "com.jyh.dao.ICollectDao.findCollectByUserId")),
            @Result(property = "courses",column = "id",javaType = List.class,many = @Many(select = "com.jyh.dao.ICourseDao.findCourseByUserId"))
    })
    UserInfo findById(Integer id);

    @Update("update user " +
            "set username=#{username},password=#{password},num=#{num}," +
            "name=#{name},sex=#{sex},telephone=#{telephone},college=#{college},profession=#{profession}," +
            "grade=#{grade},specialty=#{specialty},course=#{course},email=#{email},elucidation=#{elucidation} " +
            "where id=#{id}")
    void update(UserInfo userInfo);

    //根据评论id查询出所有对应的用户
    @Select("select * from user where id=#{id}")
    public UserInfo findUserByCommentId(Integer id);

    @Select("select * from user where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "imgUrl", column = "imgUrl"),
            @Result(property = "username", column = "username"),
            @Result(property = "password", column = "password"),
            @Result(property = "num", column = "num"),
            @Result(property = "name", column = "name"),
            @Result(property = "sex", column = "sex"),
            @Result(property = "telephone", column = "telephone"),
            @Result(property = "college", column = "college"),
            @Result(property = "profession", column = "profession"),
            @Result(property = "grade", column = "grade"),
            @Result(property = "specialty", column = "specialty"),
            @Result(property = "course", column = "course"),
            @Result(property = "email", column = "email"),
            @Result(property = "elucidation", column = "elucidation"),
            @Result(property = "collects",column = "id",javaType = List.class,many = @Many(select = "com.jyh.dao.ICollectDao.findCollectByUserId")),
            @Result(property = "courses",column = "id",javaType = List.class,many = @Many(select = "com.jyh.dao.ICourseDao.findSelectByUserId"))
    })
    UserInfo findByIds(Integer id);
}
