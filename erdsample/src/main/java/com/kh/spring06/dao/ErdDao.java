package com.kh.spring06.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring06.dto.ChangeLogDto;
import com.kh.spring06.dto.ErdDto;
import com.kh.spring06.mapper.ErdMapper;

@Repository
public class ErdDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private ErdMapper erdMapper;

    // 등록 (유통기한 포함)
    public void insert(ErdDto dto, String imageUrl) {
        String sql = "insert into stock (stock_no, stock_category, stock_name, stock_quantity, stock_date, image_url, expiration_date) " +
                     "values (stock_seq.nextval, ?, ?, ?, SYSDATE, ?, ?)";
        Object[] data = {dto.getStockCategory(), dto.getStockName(), dto.getStockQuantity(), imageUrl, dto.getExpirationDate()};
        jdbcTemplate.update(sql, data);

        // ChangeLog 기록
        logChange(dto.getStockNo(), "등록", null, dto, imageUrl);
    }

    // 수정 (유통기한 포함)
    public boolean update(ErdDto dto, String imageUrl) {
        // 현재 값 가져오기
        ErdDto existingDto = selectOne(dto.getStockNo());
        if (existingDto == null) {
            return false;
        }

        // 변경된 필드와 값을 추적
        String oldValues = getFieldValues(existingDto);
        String newValues = getFieldValues(dto);

        String sql = "update stock set stock_category = ?, stock_name = ?, stock_quantity = ?, image_url = ?, expiration_date = ? where stock_no = ?";
        Object[] data = {dto.getStockCategory(), dto.getStockName(), dto.getStockQuantity(), imageUrl, dto.getExpirationDate(), dto.getStockNo()};
        boolean isUpdated = jdbcTemplate.update(sql, data) > 0;

        if (isUpdated) {
            // ChangeLog 기록
            logChange(dto.getStockNo(), "수정", oldValues, dto, imageUrl);
        }
        
        return isUpdated;
    }

    // 삭제
    public boolean delete(int stockNo) {
        // 현재 값 가져오기
        ErdDto existingDto = selectOne(stockNo);
        if (existingDto == null) {
            return false;
        }

        String oldValues = getFieldValues(existingDto);

        String sql = "delete from stock where stock_no = ?";
        Object[] data = {stockNo};
        boolean isDeleted = jdbcTemplate.update(sql, data) > 0;

        if (isDeleted) {
            // ChangeLog 기록
            logChange(stockNo, "삭제", oldValues, null, null);
        }
        
        return isDeleted;
    }

    // 조회 - 전체 리스트
    public List<ErdDto> selectList() {
        String sql = "select * from stock order by stock_no asc";
        return jdbcTemplate.query(sql, erdMapper);
    }

    // 조회 - 조건 검색
    public List<ErdDto> selectList(String column, String keyword) {
        String sql = "select * from stock where instr(" + column + ", ?) > 0 order by stock_no asc";
        Object[] data = {keyword};
        return jdbcTemplate.query(sql, erdMapper, data);
    }

    // 조회 - 특정 항목 상세 조회
    public ErdDto selectOne(int stockNo) {
        String sql = "select * from stock where stock_no = ?";
        Object[] data = {stockNo};
        List<ErdDto> list = jdbcTemplate.query(sql, erdMapper, data);
        return list.isEmpty() ? null : list.get(0);
    }

    // 이미지 URL 업데이트
    public boolean updateImageUrl(int stockNo, String imageUrl) {
        String sql = "update stock set image_url = ? where stock_no = ?";
        Object[] data = {imageUrl, stockNo};
        return jdbcTemplate.update(sql, data) > 0;
    }

    // 수량 업데이트 메서드
    public boolean updateQuantity(ErdDto dto) {
        String sql = "update stock set stock_quantity = ? where stock_no = ?";
        Object[] data = {dto.getStockQuantity(), dto.getStockNo()};
        return jdbcTemplate.update(sql, data) > 0;
    }
    
    // 필드 값을 문자열로 변환하는 메서드
    private String getFieldValues(ErdDto dto) {
        return String.format("Category: %s, Name: %s, Quantity: %d, Image URL: %s, Expiration Date: %s",
                             dto.getStockCategory(),
                             dto.getStockName(),
                             dto.getStockQuantity(),
                             dto.getImageUrl(),
                             dto.getExpirationDate());
    }

    // ChangeLog 기록 메서드
    private void logChange(int stockNo, String changedFields, String oldValues, ErdDto newDto, String newImageUrl) {
        String newValues = newDto != null ? getFieldValues(newDto) : "";
        String oldImageUrl = oldValues != null ? oldValues : "";

        String sql = "INSERT INTO ChangeLog (id, stockNo, changedFields, oldValues, newValues, changedDate) VALUES (ChangeLog_seq.NEXTVAL, ?, ?, ?, ?, ?)";
        Object[] data = {stockNo, changedFields, oldImageUrl, newValues, new Date()};
        jdbcTemplate.update(sql, data);
    }
}
