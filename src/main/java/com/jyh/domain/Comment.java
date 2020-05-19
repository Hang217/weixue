package com.jyh.domain;

import com.jyh.util.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Comment {
    private Integer id;
    private String detail;//评论内容
    @DateTimeFormat(pattern="yyyy-MM-dd")//传入的String格式参数进行格式化为data格式
    private Date publishedTime;//评论时间
    private String publishedTimeStr;
    private UserInfo userInfo;
    private Course course;

    public Date getPublishedTime() {
        return publishedTime;
    }

    public void setPublishedTime(Date publishedTime) {
        this.publishedTime = publishedTime;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getPublishedTimeStr() {
        if(publishedTime != null){
            publishedTimeStr = DateUtils.date2String(publishedTime, "yyyy-MM-dd");
        }
        return publishedTimeStr;
    }

    public void setPublishedTimeStr(String publishedTimeStr) {
        this.publishedTimeStr = publishedTimeStr;
    }
}
