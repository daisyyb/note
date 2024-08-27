package com.kh.spring06.dao;

import com.kh.spring06.dto.ChangeLogDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ChangeLogDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper 구현
    private static final RowMapper<ChangeLogDto> CHANGE_LOG_ROW_MAPPER = new RowMapper<ChangeLogDto>() {
        @Override
        public ChangeLogDto mapRow(ResultSet rs, int rowNum) throws SQLException {
            ChangeLogDto dto = new ChangeLogDto();
            dto.setId(rs.getInt("id"));
            dto.setStockNo(rs.getInt("stockNo"));
            dto.setChangedFields(rs.getString("changedFields"));
            dto.setOldValues(rs.getString("oldValues"));  // 추가된 필드
            dto.setNewValues(rs.getString("newValues"));  // 추가된 필드
            dto.setChangedDate(rs.getTimestamp("changedDate"));
            return dto;
        }
    };

    // 특정 재고 번호에 대한 변경 로그 목록 조회
    public List<ChangeLogDto> selectChangeLogsByStockNo(int stockNo) {
        String sql = "SELECT * FROM ChangeLog WHERE stockNo = ? ORDER BY changedDate DESC";
        return jdbcTemplate.query(sql, CHANGE_LOG_ROW_MAPPER, stockNo);
    }

    // 모든 변경 로그 조회
    public List<ChangeLogDto> selectAllChangeLogs() {
        String sql = "SELECT * FROM ChangeLog ORDER BY changedDate DESC";
        return jdbcTemplate.query(sql, CHANGE_LOG_ROW_MAPPER);
    }

    // ChangeLog 기록 추가 메서드
    public void insertChangeLog(int stockNo, String changedFields, String oldValues, String newValues) {
        String sql = "INSERT INTO ChangeLog (id, stockNo, changedFields, oldValues, newValues, changedDate) " +
                     "VALUES (ChangeLog_seq.NEXTVAL, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, stockNo, changedFields, oldValues, newValues, new java.sql.Timestamp(System.currentTimeMillis()));
    }

}
