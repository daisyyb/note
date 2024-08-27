package com.kh.spring06.dto;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class ChangeLogDto {
    private int id;
    private int stockNo;
    private String changedFields;
    private String oldValues; // 추가된 필드
    private String newValues; // 추가된 필드 에러발생 가능지점 문제시 삭제(2)
    private Timestamp changedDate;

    // 기본 생성자
    public ChangeLogDto() {}

    // 모든 필드를 인자로 받는 생성자
    public ChangeLogDto(int stockNo, String changedFields, Timestamp changedDate) {
        this.stockNo = stockNo;
        this.changedFields = changedFields;
        this.changedDate = changedDate;
    }
}
