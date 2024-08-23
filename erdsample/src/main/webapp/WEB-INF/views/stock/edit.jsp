<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- JSTL fmt 라이브러리 추가 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>재고 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fce4ec; /* 부드러운 핑크색 배경 */
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 20px auto; /* 수평 가운데 정렬 */
            padding: 20px;
            background-color: #ffffff; /* 폼 배경색 흰색 */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #f8a5b0; /* 부드러운 핑크색 헤더 텍스트 */
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column; /* 레이블과 입력 필드를 수직으로 정렬 */
        }

        .form-group label {
            font-weight: bold;
            color: #555; /* 레이블 색상 */
            margin-bottom: 5px; /* 레이블과 입력 필드 사이의 여백 */
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="date"],
        .form-group input[type="file"] {
            padding: 10px;
            border: 1px solid #ddd; /* 연한 회색 테두리 */
            border-radius: 5px;
            font-size: 16px;
            width: 95%; /* 입력 필드를 컨테이너의 전체 너비로 설정 */
        }

        button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            background-color: #f8a5b0; /* 부드러운 핑크색 배경 */
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px; /* 버튼 위쪽 여백 */
        }

        button:hover {
            background-color: #f48fb1; /* 버튼 호버 시 약간 어두운 핑크색 */
        }

        .image-preview {
            max-width: 110px; /* 이미지 최대 너비 */
            max-height: outo; /* 이미지 최대 높이 */
            border-radius: 5px; /* 이미지 모서리를 둥글게 */
            margin-bottom: 10px; /* 이미지와 다른 요소 간의 여백 */
        }

        .current-expiration-date {
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
            text-align: left; /* 텍스트 왼쪽 정렬 */
        }

        a {
            display: block;
            text-align: center;
            color: #f8a5b0; /* 링크 색상 */
            text-decoration: none;
            font-weight: bold;
            margin-top: 10px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>재고 수정</h1>
        <form action="${pageContext.request.contextPath}/stock/edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="stockNo" value="${dto.stockNo}">

            <div class="form-group">
                <label for="stockCategory">카테고리:</label>
                <input type="text" id="stockCategory" name="stockCategory" value="${dto.stockCategory}" required>
            </div>

            <div class="form-group">
                <label for="stockName">이름:</label>
                <input type="text" id="stockName" name="stockName" value="${dto.stockName}" required>
            </div>

            <div class="form-group">
                <label for="stockQuantity">수량:</label>
                <input type="number" id="stockQuantity" name="stockQuantity" value="${dto.stockQuantity}" required>
            </div>

            <div class="form-group">
                 <label class="current-expiration-date">
                    현재 유통 기한: 
                    <fmt:formatDate value="${dto.expirationDate}" pattern="yyyy-MM-dd" />
                </label>
	
				<!-- 이거  왜 돌아가는지 모르겠음 ㅅㅂ -->
                <label for="expirationDate">새 유통 기한:</label>
                <input type="date" id="expirationDate" name="expirationDate" value="${dto.expirationDate != null ? fn:escapeXml(dto.expirationDate) : ''}" required>
            </div>

            <div class="form-group">
                <label>현재 이미지:</label>
                <img src="${pageContext.request.contextPath}/stock/uploaded-images?filename=${fn:escapeXml(dto.imageUrl)}"
                     alt="현재 이미지" class="image-preview">
            </div>

            <div class="form-group">
                <label for="image">새 이미지 업로드 (필수, 수정예정):</label>
                <input type="file" id="image" name="image" accept="image/*">
            </div>

            <button type="submit">수정</button>
        </form>
        <a href="${pageContext.request.contextPath}/stock/list">목록으로 돌아가기</a>
    </div>
</body>
</html>
