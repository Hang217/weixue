package com.jyh.domain;

import com.jyh.util.DateUtils;

import java.util.Date;

public class SysLog {
    private Integer id;
    private String name;//管理员名
    private String ip;//IP地址
    private String url;//路径
    private String method;//执行方法
    private Date visitTime;//访问时间
    private String visitTimeStr;
    private Long executionTime;//执行时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getVisitTime() {
        return visitTime;
    }

    public void setVisitTime(Date visitTime) {
        this.visitTime = visitTime;
    }

    public String getVisitTimeStr() {
        if(visitTime != null){
            visitTimeStr = DateUtils.date2String(visitTime, "yyyy-MM-dd");
        }
        return visitTimeStr;
    }

    public void setVisitTimeStr(String visitTimeStr) {
        this.visitTimeStr = visitTimeStr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Long getExecutionTime() {
        return executionTime;
    }

    public void setExecutionTime(Long executionTime) {
        this.executionTime = executionTime;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }
}
