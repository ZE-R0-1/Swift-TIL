## KeyValuePairs
### 딕셔너리와 유사한 형태이지만, 배열처럼 순서가 있는 컬렉션
---
 스위프트 5.2 버전에 등장
 딕셔너리와 비슷한 형태지만, "순서"가 있는 컬렉션
 key값이 해셔블(hashable)일 필요없음 (검색 알고리즘상 빠르지 않음)
 key값이 동일한 것도 가능

---
```javascript
let introduce: KeyValuePairs = ["first": "Hello", "second": "My Name", "third":"is"]
```
### KeyValuePairs의 기본 기능
```javascript
introduce.count // 3
introduce.isEmpty // false
```
### 요소에 접근
```javascript
// 배열처럼, 인덱스로 접근 가능
// 요소에서는 튜플방식으로 접근
introduce[0]  // first
//print("\(introduce[0].key)는 \(introduce[0].value) 입니다.")
//print("\(introduce[1].key)는 \(introduce[1].value) 입니다.")
//print("\(introduce[2].key)는 \(introduce[2].value) 입니다.")
```
### 반복문과의 결합
```javascript
for value in introduce {
    print("\(value.key)는 \(value.value) 입니다.")
}
// first는 Hello 입니다.
// second는 My Name 입니다.
// third는 is 입니다.
```
append / remove 같은 기능이 없음  
딕셔너리이지만, 저장된 순서가 중요할 경우, 또는 데이터가 반복될 경우만 임시적/제한적으로 사용
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
