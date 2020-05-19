package com.jyh.dao;

import com.jyh.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISysLogDao {

    @Select("select * from syslog")
    List<SysLog> findAll();

    @Insert("insert into syslog(name,ip,url,method,visitTime,executionTime) values(#{name},#{ip},#{url},#{method},#{visitTime},#{executionTime})")
    void save(SysLog sysLog);
}
