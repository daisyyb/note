package com.kh.spring06.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ErdDto {
    private int stockNo;
    private String stockCategory;
    private String stockName;
    private int stockQuantity;
    private Date stockDate; // 입고 날짜 추가
    private String imageUrl;  // 새로 추가된 필드
//데이터 형식 삭제
    private Date expirationDate; // 유통기한 추가
    
 // ChangeLogDto를 추가하는 필드
    private ChangeLogDto latestChangeLog;  // 추가된 필드
}
