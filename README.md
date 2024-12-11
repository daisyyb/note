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






![캡처2](https://github.com/user-attachments/assets/2bd2c66b-48ff-4879-8113-632c3ac05b52)









![캡처3](https://github.com/user-attachments/assets/351009a4-a133-47aa-b75a-c3262255f4ab)
