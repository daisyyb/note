<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            font-size: 24px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 20px; /* 필드 간의 여백을 늘려서 더 깔끔하게 */
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* 모든 레이블과 필드를 왼쪽에 맞춤 */
        }

        .form-group label {
            font-weight: bold;
            color: #555; /* 레이블 색상 */
            margin-bottom: 8px; /* 레이블과 입력 필드 사이의 여백 */
            font-size: 16px;
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="date"],
        .form-group input[type="file"] {
            padding: 10px;
            border: 1px solid #ddd; /* 연한 회색 테두리 */
            border-radius: 5px;
            font-size: 16px;
            width: 100%; /* 입력 필드를 컨테이너의 전체 너비로 설정 */
            box-sizing: border-box; /* 패딩과 테두리를 포함하여 너비 계산 */
        }

        button {
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            background-color: #f8a5b0; /* 부드러운 핑크색 배경 */
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            align-self: center; /* 버튼을 중앙에 배치 */
        }

        button:hover {
            background-color: #f48fb1; /* 버튼 호버 시 약간 어두운 핑크색 */
        }

        .image-preview {
            max-width: 150px; /* 이미지 최대 너비를 늘려서 보기 쉽게 */
            max-height: auto;
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
            margin-top: 20px; /* 링크 위쪽 여백을 늘려 더 깔끔하게 */
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // 사용자가 이미지를 업로드하면 즉시 미리보기 표시
            $('#image').change(function() {
                let reader = new FileReader();
                reader.onload = function(e) {
                    $('#imagePreview').attr('src', e.target.result); // 미리보기 이미지 설정
                    $('#imagePreview').show(); // 미리보기 이미지 표시
                }
                reader.readAsDataURL(this.files[0]); // 파일 읽기
            });

            $('form').submit(function(event) {
                // 수정 확인 대화상자 표시
                if (!confirm('정말 수정하시겠습니까? 변동 사항을 잘 확인하세요.')) {
                    event.preventDefault(); // 사용자가 취소를 클릭하면 폼 제출을 막음
                }

                // 각 필드가 비어 있으면 기존 값 유지
                if ($('#stockCategory').val().trim() === '') {
                    $('#stockCategory').val('${fn:escapeXml(dto.stockCategory)}');
                }
                if ($('#stockName').val().trim() === '') {
                    $('#stockName').val('${fn:escapeXml(dto.stockName)}');
                }
                if ($('#stockQuantity').val().trim() === '') {
                    $('#stockQuantity').val('${dto.stockQuantity}');
                }
                if ($('#expirationDate').val().trim() === '') {
                    $('#expirationDate').val('${dto.expirationDate}');
                }

                // 새 이미지가 업로드되지 않은 경우 기존 이미지 URL 전송
                if ($('#image').val().trim() === '') {
                    $('#imageUrl').val('${fn:escapeXml(dto.imageUrl)}');
                }
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>재고 수정</h1>
        <form action="${pageContext.request.contextPath}/stock/edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="stockNo" value="${dto.stockNo}">
            <input type="hidden" id="imageUrl" name="imageUrl" value="${fn:escapeXml(dto.imageUrl)}"> <!-- 이미지 URL을 위한 히든 필드 -->

            <div class="form-group">
                <label for="stockCategory">카테고리</label>
                <input type="text" id="stockCategory" name="stockCategory" value="${dto.stockCategory}" required>
            </div>

            <div class="form-group">
                <label for="stockName">이름</label>
                <input type="text" id="stockName" name="stockName" value="${dto.stockName}" required>
            </div>

            <div class="form-group">
                <label for="stockQuantity">수량</label>
                <input type="number" id="stockQuantity" name="stockQuantity" value="${dto.stockQuantity}" required>
            </div>

            <div class="form-group">
                <label class="current-expiration-date">
                    현재 유통 기한: 
                    <fmt:formatDate value="${dto.expirationDate}" pattern="yyyy-MM-dd" />
                </label>
                <label for="expirationDate">수정할 유통기한을 입력하세요 (선택)</label>
                <input type="date" id="expirationDate" name="expirationDate" value="${dto.expirationDate != null ? fn:escapeXml(dto.expirationDate) : ''}">
            </div>

            <div class="form-group">
                <label>현재 이미지(.png 권장) 업로드 사진을 미리 확인하세요</label>
                <img src="${pageContext.request.contextPath}/stock/uploaded-images?filename=${fn:escapeXml(dto.imageUrl)}"
                     alt="현재 이미지" class="image-preview" id="imagePreview">
            </div>

            <div class="form-group">
                <label for="image">새 이미지 업로드 (선택)</label>
                <input type="file" id="image" name="image" accept="image/*">
            </div>

            <button type="submit">수정</button>
        </form>
        <a href="${pageContext.request.contextPath}/stock/list">목록으로 돌아가기</a>
    </div>
</body>
</html>
