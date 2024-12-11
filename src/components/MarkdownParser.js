import React, { useState } from 'react';
import { marked } from 'marked';

const MarkdownParser = () => {
  const [markdownText, setMarkdownText] = useState('');

  // 마크다운 텍스트 변경 핸들러
  const handleMarkdownChange = (e) => {
    setMarkdownText(e.target.value);
  };

  // marked의 Renderer 설정
  const renderer = new marked.Renderer();

  // H1, H2, H3 클릭 시 복사 기능 추가
  renderer.heading = (text, level) => {
    const tag = `h${level}`;
    const plainText = extractPlainText(text); // 텍스트 추출 함수 사용
    return `<${tag} style="cursor: pointer;" data-copy="${plainText}">
              ${plainText}
            </${tag}>`;
  };

  // blockquote 클릭 시 복사 기능 추가
  renderer.blockquote = (quote) => {
    const plainText = extractPlainText(quote); // 텍스트 추출 함수 사용
    return `<blockquote style="cursor: pointer;" data-copy="${plainText}">
              ${plainText}
            </blockquote>`;
  };

  // 텍스트 데이터 추출 함수
  const extractPlainText = (data) => {
    // 객체인 경우 text 속성을 사용
    if (typeof data === 'object' && data.text) {
      return data.text;
    }
    // 문자열인 경우 그대로 반환
    return typeof data === 'string' ? data : JSON.stringify(data);
  };

  // 마크다운 텍스트를 HTML로 변환
  const parsedMarkdown = marked(markdownText, { renderer });

  // 클립보드에 텍스트 복사 함수
  const copyToClipboard = (text) => {
    navigator.clipboard.writeText(text).then(() => {
      alert(`클립보드에 복사되었습니다: ${text}`);
    }).catch((err) => {
      alert('복사 실패:', err);
    });
  };

  // 마크다운 HTML을 렌더링하면서 클릭 이벤트 핸들러 추가
  const handleClick = (e) => {
    const copyText = e.target.getAttribute('data-copy');
    if (copyText) {
      copyToClipboard(copyText);
    }
  };

  return (
    <div>
      <textarea
        value={markdownText}
        onChange={handleMarkdownChange}
        rows="10"
        cols="50"
        placeholder="마크다운 텍스트를 입력하세요."
      />
      <div
        dangerouslySetInnerHTML={{ __html: parsedMarkdown }}  // 마크다운 파싱된 HTML 출력
        onClick={handleClick}  // 클릭 이벤트 핸들러 추가
      />
    </div>
  );
};

export default MarkdownParser;
