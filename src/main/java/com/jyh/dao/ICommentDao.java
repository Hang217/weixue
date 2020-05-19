package com.jyh.dao;

import com.jyh.domain.Comment;
import com.jyh.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICommentDao {

    //根据课程id查询出所有对应的评论
    @Select("select * from comment where courseId=#{courseId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "detail", column = "detail"),
            @Result(property = "publishedTime", column = "publishedTime"),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.jyh.dao.IUserDao.findUserByCommentId"))
    })
    public List<Comment> findCommentByCourseId(Integer courseId);

    @Delete("delete from comment where userId=#{userId}")
    void deleteCommentByUserId(Integer userId);

    @Select("select * from comment")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "detail", column = "detail"),
            @Result(property = "publishedTime", column = "publishedTime"),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.jyh.dao.IUserDao.findUserByCommentId"))
    })
    List<Comment> findAll();

    @Delete("delete from comment where id=#{id}")
    void delete(Integer id);

    @Select("select * from comment where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "detail", column = "detail"),
            @Result(property = "publishedTime", column = "publishedTime"),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.jyh.dao.IUserDao.findUserByCommentId"))
    })
    Comment findById(Integer id);
}
