package com.jyh.service.impl;

import com.github.pagehelper.PageHelper;
import com.jyh.dao.ISysLogDao;
import com.jyh.domain.SysLog;
import com.jyh.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {

    @Autowired
    private ISysLogDao sysLogDao;

    @Override
    public List<SysLog> findAll(int page, int size) {
        //参数pageNum 是页码值,参数pageSize 是每页显示条数
        PageHelper.startPage(page, size);
        return sysLogDao.findAll();
    }

    public void save(SysLog sysLog) {
        sysLogDao.save(sysLog);
    }
}
