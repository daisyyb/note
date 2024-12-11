import React from 'react';
import Editor from './components/Editor';
import MarkdownParser from './components/MarkdownParser'; // MarkdownParser 컴포넌트를 임포트합니다.

const App = () => {
  return (
    <div>
      <h1>애너그램 테스트</h1>
      <Editor />
      <hr/>
      <h1>마커 테스트</h1>
      <MarkdownParser/>

    </div>
  );
};

export default App;