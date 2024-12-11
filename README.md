![캡처1](https://github.com/user-attachments/assets/0f218ce9-21ca-433e-8c82-f2b1dd563370)

1. 구조 분해 할당은 객체나 배열 같은 데이터 묶음을 쉽게 꺼내 쓸 수 있게 해주는 JavaScript 문법입니다. 일일이 하나씩 꺼내는 대신, 한 번에 필요한 것만 가져올수 있는 방식이며 복잡한 데이터를 다룰 때 시간을 아껴주고 코드도 깔끔하게 작성이 가능합니다.

ex)

```
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
```


2.
Optional Chaining은 객체나 배열처럼 중첩된 데이터 구조를 안전하게 접근할 수 있도록 도와주는 문법입니다. 중간에 값이 null이거나 undefined인 경우 에러를 던지는 대신 그냥 undefined를 반환해줍니다. 그래서 코드가 더 깔끔하고 에러 없이 작동하게 만드는것이 가능합니다.


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

4.
Promise는 JavaScript에서 비동기 작업을 처리하기 위한 객체로, 비동기 코드의 흐름을 간단하고 예측 가능하게 만들어줍니다. 예를 들어 서버에서 데이터를 가져오거나, 파일을 읽는 등의 작업에서 일반적으로 사용됩니다.

주의할점 두가지로는 
첫번째 1. 비동기 작업의 상태 관리
React에서 Promise는 컴포넌트의 상태를 변경할 때 자주 사용됩니다. 하지만 비동기 작업이 끝난 시점에 해당 컴포넌트가 이미 언마운트(Unmount)된 경우, 상태를 업데이트하려고 하면 경고가 발생하거나 오류가 날 수 있습니다.

예방 방법:

비동기 작업이 실행되기 전에 컴포넌트가 언마운트 되었는지 확인.
useEffect에서 cleanup 함수를 사용하거나, 플래그 변수를 이용해 안전하게 처리.

두번째 2. 에러 처리를 꼭 해주기
Promise에서 에러 처리를 하지 않으면 애플리케이션이 예상치 못한 상태에 빠질 수 있어. React에서 특히 서버 요청이나 파일 읽기 등의 작업은 에러가 발생하기 쉽기 때문에 catch를 사용하거나, async/await와 try/catch를 적절히 사용하는 것이 중요합니다.

예방 방법:
```
fetch("https://api.example.com/data")
  .then((response) => {
    if (!response.ok) {
      throw new Error("데이터 요청 실패");
    }
    return response.json();
  })
  .then((data) => console.log(data))
  .catch((error) => console.error("에러 발생:", error));
```

![캡처2](https://github.com/user-attachments/assets/2bd2c66b-48ff-4879-8113-632c3ac05b52)









![캡처3](https://github.com/user-attachments/assets/351009a4-a133-47aa-b75a-c3262255f4ab)
