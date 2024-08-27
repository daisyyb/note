<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 목록</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #fce4ec; /* 부드러운 핑크색 배경 */
    margin: 0;
    padding: 0;
}

h1 {
    text-align: center;
    color: #ffffff; /* 헤더 텍스트 색상을 흰색으로 설정 */
    background-color: #f8a5b0; /* 부드러운 핑크색 배경 */
    padding: 20px;
    margin: 0;
}

form {
    display: flex;
    justify-content: center;
    margin: 20px 0;
    background-color: #ffffff; /* 폼 배경색을 흰색으로 설정 */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

label {
    font-weight: bold;
    color: #f8a5b0; /* 레이블 색상을 부드러운 핑크색으로 설정 */
    margin-right: 10px;
    white-space: nowrap; /* 레이블과 입력 필드의 줄바꿈을 방지하여 정렬을 유지 */
    margin-top: 8px;
}

select, input[type="text"], button {
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
    margin-right: 10px;
    font-size: 16px;
}

button {
    background-color: #f8a5b0; /* 버튼의 배경색을 부드러운 핑크색으로 설정 */
    color: white; /* 버튼의 텍스트 색상을 흰색으로 설정 */
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #f48fb1; /* 버튼 호버 시 배경색을 약간 어두운 핑크색으로 설정 */
}

table {
    width: 90%;
    max-width: 1200px;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #ffffff; /* 테이블 배경색을 흰색으로 설정 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f8a5b0; /* 테이블 헤더 배경색을 부드러운 핑크색으로 설정 */
    color: white; /* 헤더 텍스트 색상을 흰색으로 설정 */
    font-weight: bold;
}

tr:hover {
    background-color: #fce4ec; /* 테이블 행 호버 시 배경색을 부드러운 핑크색으로 설정 */
}

a {
    color: #f8a5b0; /* 링크 색상을 부드러운 핑크색으로 설정 */
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    text-decoration: underline;
}

/* 버튼 컨테이너 스타일 */
.button-container {
    display: flex;
    justify-content: center; /* 버튼을 중앙에 정렬 */
    margin: 20px 0; /* 상하 여백 추가 */
}

/* 재고 등록 버튼 스타일 */
.button {
    background-color: #f8a5b0; /* 버튼 배경색 */
    color: white; /* 버튼 텍스트 색상 */
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    text-decoration: none;
    text-align: center;
    display: inline-block;
    transition: background-color 0.3s ease;
}

.button:hover {
    background-color: #f48fb1; /* 버튼 호버 시 배경색 */
}

/* 상품 이미지와 레이블 스타일 */
.product-container {
    position: relative; /* 이미지와 텍스트를 겹치게 배치할 수 있게 함 */
    display: inline-block; /* 이미지와 텍스트를 수평으로 정렬 */
}

.product-image {
    max-width: 100px; /* 이미지 최대 너비 설정 */
    max-height: 120px; /* 이미지 최대 높이 설정 */
    height: auto; /* 이미지의 비율을 유지하며 높이 자동 조정 */
    border-radius: 5px; /* 이미지의 모서리를 둥글게 */
}

/* 재고 부족 텍스트 스타일 */
.low-stock {
    position: absolute; /* 텍스트를 이미지 위에 겹치게 배치 */
    top: 5px; /* 이미지의 상단에서 5px 떨어진 위치에 텍스트 배치 */
    left: 5px; /* 이미지의 좌측에서 5px 떨어진 위치에 텍스트 배치 */
    background-color: rgba(255, 0, 0, 0.7); /* 빨간색 배경과 투명도 */
    color: #ffffff; /* 텍스트 색상을 흰색으로 설정 */
    padding: 5px 10px; /* 텍스트 주위에 패딩 추가 */
    border-radius: 5px; /* 텍스트 배경의 모서리를 둥글게 */
    font-weight: bold; /* 텍스트를 두껍게 설정 */
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}
</style>
</head>
<body>
    <h1>재고 목록</h1>
    <table>
        <thead>
            <tr>
                <th>이미지</th>
                <th>카테고리</th>
                <th>이름</th>
                <th>수량 변동</th>
                <th>상세</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${list}">
                <tr>
                    <td>
                        <div class="product-container">
                            <img src="${pageContext.request.contextPath}/stock/uploaded-images?filename=${item.imageUrl}" alt="${item.stockName}" class="product-image">
                            <c:if test="${item.stockQuantity < 10}">
                                <span class="low-stock">재고 부족</span>
                            </c:if>
                        </div>
                    </td>
                    <td>${item.stockCategory}</td>
                    <td>${item.stockName}</td>
                    <td>
                        <c:choose>
                            <c:when test="${latestChangeLogsMap[item.stockNo] != null}">
                                <c:set var="log" value="${latestChangeLogsMap[item.stockNo]}" />
                                
                                <!-- Extract old and new quantities -->
                                <c:set var="oldQuantity" value="${fn:substringAfter(log.oldValues, 'Quantity: ')}" />
                                <c:set var="newQuantity" value="${fn:substringAfter(log.newValues, 'Quantity: ')}" />
                                
                                <!-- Check if the quantity contains additional information -->
                                <c:set var="isComplexFormat" value="${fn:indexOf(oldQuantity, ',') != -1}" />
                                
                                <c:choose>
                                    <c:when test="${isComplexFormat}">
                                        <!-- Case for full data with additional text -->
                                        <c:set var="oldQuantityNumber" value="${fn:substringBefore(oldQuantity, ',')}" />
                                        <c:set var="newQuantityNumber" value="${fn:substringBefore(newQuantity, ',')}" />
                                        <c:if test="${fn:length(oldQuantityNumber) > 0 && fn:length(newQuantityNumber) > 0}">
                                            <div class="change-info">
                                                <c:out value="${oldQuantityNumber}" />
                                                <span class="arrow">→</span>
                                                <c:out value="${newQuantityNumber}" />
                                            </div>
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Case for simple Quantity data -->
                                        <c:if test="${fn:length(oldQuantity) > 0 && fn:length(newQuantity) > 0}">
                                            <div class="change-info">
                                                <c:out value="${oldQuantity}" />
                                                <span class="arrow">→</span>
                                                <c:out value="${newQuantity}" />
                                            </div>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>변동 정보 없음</c:otherwise>
                        </c:choose>
                    </td>
                    <td><a href="${pageContext.request.contextPath}/stock/detail?stockNo=${item.stockNo}">상세보기</a></td>
                    <td><a href="${pageContext.request.contextPath}/stock/delete?stockNo=${item.stockNo}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 재고 등록 버튼 추가 -->
    <div class="button-container">
        <a href="${pageContext.request.contextPath}/stock/insert" class="button">재고 등록</a>
    </div>
</body>
</html>
