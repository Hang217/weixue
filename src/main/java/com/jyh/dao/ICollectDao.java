package com.jyh.dao;

import com.jyh.domain.Collect;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICollectDao {

    //根据用户id查询出所有对应的收藏课程
    @Select("select * from collect where userId=#{userId}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "courseName", column = "courseName"),
            @Result(property = "detail", column = "detail"),
            @Result(property = "imageUrl", column = "imageUrl"),
            @Result(property = "videoUrl", column = "videoUrl")
    })
    public List<Collect> findCollectByUserId(Integer userId);

    @Delete("delete from collect where courseId=#{courseId}")
    void deleteCollectByCourseId(Integer courseId);

    @Delete("delete from collect where userId=#{userId}")
    void deleteCollectByUserId(Integer userId);
}
