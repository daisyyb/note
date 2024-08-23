<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>등록 완료</title>
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

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px;
            background-color: #ffffff; /* 컨테이너 배경색을 흰색으로 설정 */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 20px auto;
        }

        p {
            font-size: 18px;
            color: #555555;
            margin: 20px 0;
        }

        a {
            color: #f8a5b0; /* 링크 색상을 부드러운 핑크색으로 설정 */
            text-decoration: none;
            font-weight: bold;
            padding: 10px 20px;
            background-color: #ffffff; /* 링크 배경색을 흰색으로 설정 */
            border: 1px solid #f8a5b0; /* 링크 테두리를 부드러운 핑크색으로 설정 */
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        a:hover {
            background-color: #f8a5b0; /* 링크 호버 시 배경색을 부드러운 핑크색으로 설정 */
            color: #ffffff; /* 링크 호버 시 텍스트 색상을 흰색으로 설정 */
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h1>재고 등록 완료</h1>
    <div class="container">
        <p>재고가 성공적으로 등록되었습니다.</p>
        <a href="list">목록으로 돌아가기</a>
    </div>
</body>
</html>
