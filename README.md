![캡처1](https://github.com/user-attachments/assets/0f218ce9-21ca-433e-8c82-f2b1dd563370)

1. 구조 분해 할당은 객체나 배열 같은 데이터 묶음을 쉽게 꺼내 쓸 수 있게 해주는 JavaScript 문법입니다. 일일이 하나씩 꺼내는 대신, 한 번에 필요한 것만 가져올수 있는 방식이며 복잡한 데이터를 다룰 때 시간을 아껴주고 코드도 깔끔하게 작성이 가능합니다.

ex)

const user = {
  name: "철수",
  age: 25,
  job: "개발자",
};

// 예전 방식
const name = user.name;
const age = user.age;

// 구조 분해 할당
const { name, age } = user;

console.log(name); // "철수"
console.log(age);  // 25

2.Optional Chaining은 객체나 배열처럼 중첩된 데이터 구조를 안전하게 접근할 수 있도록 도와주는 문법입니다. 중간에 값이 null이거나 undefined인 경우 에러를 던지는 대신 그냥 undefined를 반환해줍니다. 그래서 코드가 더 깔끔하고 에러 없이 작동하게 만드는것이 가능합니다.

3.
push('a')
push는 배열의 끝에 'a'를 추가합니다.

배열: ['a']

shift는 배열의 첫 번째 요소를 제거합니다.
현재 배열의 첫 번째 요소는 'a'이므로 이를 제거합니다.

unshift('e')
unshift는 배열의 앞쪽에 'e'를 추가합니다.

최종 결과:
배열: ['e']





![캡처2](https://github.com/user-attachments/assets/2bd2c66b-48ff-4879-8113-632c3ac05b52)









![캡처3](https://github.com/user-attachments/assets/351009a4-a133-47aa-b75a-c3262255f4ab)
