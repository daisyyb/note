

import React, { Component, createRef } from "react";

// BaseTextArea 컴포넌트
class BaseTextArea extends Component {
  render() {
    const { className, ...restProps } = this.props; // className을 제거
    return <textarea {...restProps} />;
  }
}

// Editor 컴포넌트
class Editor extends Component {
  constructor(props) {
    super(props);
    this.textAreaRef = createRef(); // textarea에 대한 ref 생성
    this.state = {
      anagramCount: 0,
    };
  }

  clearText = () => {
    // textarea의 값을 삭제
    if (this.textAreaRef.current) {
      this.textAreaRef.current.value = "";
    }
  };

  countAnagrams = () => {
    if (this.textAreaRef.current) {
      const text = this.textAreaRef.current.value;
      const words = text.split(/\s+/).filter((word) => word.length > 0);

      // 단어별 애너그램 검사
      const sortedWords = words.map((word) => word.split("").sort().join(""));
      const wordMap = {};

      sortedWords.forEach((word) => {
        wordMap[word] = (wordMap[word] || 0) + 1;
      });

      const anagramCount = Object.values(wordMap).filter((count) => count > 1)
        .length;

      this.setState({ anagramCount });
    }
  };

  render() {
    return (
      <div>
        <BaseTextArea ref={this.textAreaRef} placeholder="Enter text here..." />
        <div>
          <button onClick={this.clearText}>Clear Text</button>
          <button onClick={this.countAnagrams}>Count Anagrams</button>
        </div>
        <p>Number of anagram groups: {this.state.anagramCount}</p>
      </div>
    );
  }
}

export default Editor;

  