import React, { forwardRef } from 'react';  // React와 forwardRef를 불러옵니다.

// BaseTextArea 컴포넌트 (className 제외)
const BaseTextArea = forwardRef((props, ref) => {
  const { ...rest } = props;  // props에서 나머지 속성들을 rest로 추출합니다.
  return <textarea ref={ref} {...rest} />;  // ref를 전달하고 나머지 속성들을 textarea에 적용합니다.
});

export default BaseTextArea;  // BaseTextArea 컴포넌트를 내보냅니다.

