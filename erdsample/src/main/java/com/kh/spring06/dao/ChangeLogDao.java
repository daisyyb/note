package com.kh.spring06.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.kh.spring06.dto.ChangeLogDto;
import java.util.List;
import java.util.Date;

@Repository
public class ChangeLogDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 특정 재고 번호에 대한 변경 로그 목록 조회
    public List<ChangeLogDto> selectChangeLogsByStockNo(int stockNo) {
        String sql = "SELECT * FROM ChangeLog WHERE stockNo = ?";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            ChangeLogDto dto = new ChangeLogDto();
            dto.setId(rs.getInt("id"));
            dto.setStockNo(rs.getInt("stockNo"));
            dto.setChangedFields(rs.getString("changedFields"));
            dto.setChangedDate(rs.getTimestamp("changedDate"));
            return dto;
        }, stockNo);
    }
}
