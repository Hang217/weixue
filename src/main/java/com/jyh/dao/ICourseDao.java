package com.jyh.dao;

import com.jyh.domain.Course;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICourseDao {

    //根据用户id查询出所有对应的上传课程
    @Select("select * from course where userId=#{userId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "courseName", column = "courseName"),
            @Result(property = "imageUrl", column = "imageUrl"),
            @Result(property = "videoUrl", column = "videoUrl")
    })
    public List<Course> findCourseByUserId(Integer userId);

    @Select("select * from course where id in(select courseId from u_c where userId=#{userId})")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "courseName", column = "courseName"),
            @Result(property = "imageUrl", column = "imageUrl"),
            @Result(property = "videoUrl", column = "videoUrl")
    })
    public List<Course> findSelectByUserId(Integer userId);

    @Select("select * from course")
    List<Course> findAll();

    @Delete("delete from course where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "courseName", column = "courseName"),
            @Result(property = "detail", column = "detail"),
            @Result(property = "imageUrl", column = "imageUrl"),
            @Result(property = "videoUrl", column = "videoUrl"),
            @Result(property = "collects",column = "id",javaType = List.class,many = @Many(select = "com.jyh.dao.ICollectDao.deleteCollectByCourseId"))
    })
    void delete(Integer id);

    @Select("select * from course where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "courseName", column = "courseName"),
            @Result(property = "detail", column = "detail"),
            @Result(property = "imageUrl", column = "imageUrl"),
            @Result(property = "videoUrl", column = "videoUrl"),
            @Result(property = "comments",column = "id",javaType = List.class,many = @Many(select = "com.jyh.dao.ICommentDao.findCommentByCourseId"))
    })
    Course findById(Integer id);
}
