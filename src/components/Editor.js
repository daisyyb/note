import React, { useRef, useState } from 'react';  // React와 useRef, useState 훅을 불러옵니다.
import BaseTextArea from './BaseTextArea';  // BaseTextArea 컴포넌트를 불러옵니다.

const Editor = () => {
  const textAreaRef = useRef(null);  // BaseTextArea 컴포넌트를 참조하기 위한 useRef 훅을 생성합니다.
  const [anagramCount, setAnagramCount] = useState(0);  // 애너그램 개수를 관리할 상태 변수입니다.

  // 애너그램을 찾는 헬퍼 함수
  const findAnagrams = (inputText) => {
    const words = inputText.split(' ');  // 입력된 텍스트를 공백을 기준으로 단어로 나눕니다.
    const wordMap = {};  // 단어의 정렬된 버전을 키로 하는 맵을 생성합니다.

    // 각 단어에 대해 정렬된 버전을 키로 사용하여 카운팅합니다.
    words.forEach((word) => {
      const sortedWord = word.split('').sort().join('');  // 단어를 문자 단위로 나누고 정렬한 후 다시 문자열로 합칩니다.
      wordMap[sortedWord] = (wordMap[sortedWord] || 0) + 1;  // 맵에서 해당 정렬된 단어의 카운트를 증가시킵니다.
    });

    let count = 0;
    // 맵의 값을 확인하여 중복되는 단어가 있을 경우 개수를 셉니다.
    Object.values(wordMap).forEach((value) => {
      if (value > 1) count += value;  // 중복되는 단어가 있으면 그 개수를 더합니다.
    });

    return count;  // 애너그램 개수를 반환합니다.
  };

  // 버튼 1: 입력 필드를 초기화하는 함수
  const clearInput = () => {
    if (textAreaRef.current) {
      textAreaRef.current.value = '';  // 텍스트 영역의 값을 빈 문자열로 설정하여 초기화합니다.
    }
  };

  // 버튼 2: 애너그램을 세고 결과를 설정하는 함수
  const countAnagrams = () => {
    if (textAreaRef.current) {
      const text = textAreaRef.current.value;  // 텍스트 영역에서 값을 가져옵니다.
      const count = findAnagrams(text);  // 입력된 텍스트에서 애너그램을 셉니다.
      setAnagramCount(count);  // 애너그램 개수를 상태에 설정합니다.
    }
  };

  return (
    <div>
      <BaseTextArea ref={textAreaRef} rows="10" cols="30" />  {/* BaseTextArea 컴포넌트를 렌더링하고, 텍스트 영역의 크기를 설정합니다. */}
      <div>
        <button onClick={clearInput}>Clear</button>  {/* 텍스트 영역을 초기화하는 버튼 */}
        <button onClick={countAnagrams}>Count Anagrams</button>  {/* 애너그램을 세는 버튼 */}
      </div>
      <div>
        {anagramCount > 0 && <p>Number of anagrams: {anagramCount}</p>}  {/* 애너그램 개수가 0보다 크면 결과를 표시합니다. */}
      </div>
    </div>
  );
};

export default Editor;  // Editor 컴포넌트를 내보냅니다.
