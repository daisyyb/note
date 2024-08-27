package com.kh.spring06.service;

import com.kh.spring06.dao.ChangeLogDao;
import com.kh.spring06.dto.ChangeLogDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChangeLogService {

    @Autowired
    private ChangeLogDao changeLogDao;

    public List<ChangeLogDto> getChangeLogsByStockNo(int stockNo) {
        return changeLogDao.selectChangeLogsByStockNo(stockNo);
    }

    public void addChangeLog(int stockNo, String changedFields, String oldValues, String newValues) {
        changeLogDao.insertChangeLog(stockNo, changedFields, oldValues, newValues);
    }
}
