## Substring
### 서브 스트링(Substring)의 개념
```javascript
var greeting = "Hello, world!"

let index: String.Index = greeting.firstIndex(of: ",") ?? greeting.endIndex    // ,(콤마)의 인덱스
let beginning: String.SubSequence = greeting[..<index]// 처음부터 인덱스까지

// "Hello"   // 타입 확인해보기 ⭐️  String.SubSequence 타입


/**======================================================
 - prefix(...)메서드 등의 사용시
 - "Hello"란 beginning문자열은 greeting 문자열의 메모리공간을 공유
 - 스위프트 내부적으로 최적화되어 있음
 - 수정 등이 일어나기 전까지 메모리 공유
 - 오랜기간 저장하기 위해서는, 새롭게 문자열로 저장할 필요
 ========================================================**/


var word: String.SubSequence = greeting.prefix(5)

word     // String.SubSequence 타입
// "Hello"


greeting = "Happy"    // 원본을 바꾸는 순간 Substring 문자열들은 새로운 문자열 공간을 만들어서 저장

print(beginning)
print(word)



word = greeting.suffix(3)

word     // String.SubSequence 타입
// "ppy"




// 아니면 명시적으로 문자열로 변환해서 저장 가능 (서브스트링에서 벗어남)
let newString: String = String(word)
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
