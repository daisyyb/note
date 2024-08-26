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
	background-color: #ffffff; /* 폼 배경색을 흰색으로 설정하여 깔끔하게 보이도록 */
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
	color: white;
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

/* 삭제 버튼 스타일 */
.delete-button {
	background-color: #f8a5b0; /* 버튼의 배경색을 부드러운 핑크색으로 설정 */
	color: white;
	border: none;
	padding: 6px 12px; /* 버튼의 상하 및 좌우 여백 조정 (작게 설정) */
	border-radius: 5px;
	font-size: 14px; /* 버튼 텍스트 크기 조정 (작게 설정) */
	cursor: pointer;
	transition: background-color 0.3s ease;
	display: inline-block;
	text-align: center;
	line-height: 1.5; /* 버튼의 높이와 텍스트 정렬 조정 */
	width: auto; /* 버튼 너비를 자동으로 조정 */
	height: auto; /* 버튼 높이를 자동으로 조정 */
}

.delete-button:hover {
	background-color: #f48fb1; /* 버튼 호버 시 배경색을 약간 어두운 핑크색으로 설정 */
}

/* 상품 이미지 스타일 */
.product-image {
    max-width: 100px; /* 이미지 최대 너비 설정 */
    max-height: 120px; /* 이미지 최대 높이 설정 */
    height: auto; /* 이미지의 비율을 유지하며 높이 자동 조정 */
    border-radius: 5px; /* 이미지의 모서리를 둥글게 */
}

</style>
</head>
<body>
	<h1>재고 목록</h1>
	<form action="${pageContext.request.contextPath}/stock/list"
		method="get">
		<label for="column">검색 조건:</label> 
		<select id="column" name="column">
			<option value="stock_category"
				${column == 'stock_category' ? 'selected' : ''}>카테고리</option>
			<option value="stock_name"
				${column == 'stock_name' ? 'selected' : ''}>이름</option>
		</select> 
		<input type="text" name="keyword" placeholder="검색어 입력"
			value="${keyword}">
		<button type="submit">검색</button>
	</form>

	<form id="deleteForm"
		action="${pageContext.request.contextPath}/stock/deleteMultiple"
		method="post">
		<table>
			<thead>
				<tr>
					<th>이미지</th>
					<th>카테고리</th>
					<th>이름</th>
					<th>변경 전 수량</th> <!-- 변경 전 수량 추가 -->
					<th>변경 후 수량</th> <!-- 변경 후 수량 추가 -->
					<th>수량</th>
					<th>상세</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}">
					<tr>
						<td><img
							src="${pageContext.request.contextPath}/stock/uploaded-images?filename=${fn:escapeXml(item.imageUrl)}"
							alt="${item.stockName}" class="product-image">
						</td>
						<td>${item.stockCategory}</td>
						<td>${item.stockName}</td>
						<td>
							<c:choose>
								<c:when test="${latestChangeLogsMap[item.stockNo] != null}">
									${latestChangeLogsMap[item.stockNo].oldQuantity}
								</c:when>
								<c:otherwise>없음</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${latestChangeLogsMap[item.stockNo] != null}">
									${latestChangeLogsMap[item.stockNo].newQuantity}
								</c:when>
								<c:otherwise>없음</c:otherwise>
							</c:choose>
						</td>
						<td>${item.stockQuantity}</td>
						<td><a
							href="${pageContext.request.contextPath}/stock/detail?stockNo=${item.stockNo}">상세보기</a></td>
						<td><a
							href="${pageContext.request.contextPath}/stock/delete?stockNo=${item.stockNo}"
							onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>

	<div class="button-container">
		<a href="${pageContext.request.contextPath}/stock/insert"
			class="delete-button">재고 등록</a>
	</div>
</body>
</html>
