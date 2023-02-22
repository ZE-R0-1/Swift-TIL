# Loops (반복문)
### 반복문의 종류
1) For 반복문  
2) While 반복문  
  (1) while  
  (2) repeat-while
## 1) for문
### For문의 기본 형태
```javascript
//스위프트 스타일의 문법은 직관적이고 쉽게 작성이 가능하도록 되어있음
for index in 1...5 {        
//let index = 1, let index = 2, let index = 3, let index = 4, let index = 5
    print("For문 출력해보기: \(index)")
}
for index in 1...4 {
    print("\(index)에 5를 곱하면 \(index * 5)")
}
var number = 10
for i in 1...number {
    print(i)
}
```
### 와일드 카드 패턴
와일트 카드 패턴 _(언더바)은 스위프트에서 생략의 의미
```javascript
for _ in 0...10 {
    print("hello")
}
//let _ = "문자열"
(1...10).reversed()
let a = (1...10).reversed()
print(a)
```
### 배열 등 컬렉션 타입에서도 사용 가능
```javascript
// 컬렉션에서 각 아이템을 차례 차례 한번씩 뽑아서 중괄호 안에서 사용
let list = ["Swift", "Programming", "Language"]
for str in list {
    print(str)
}
```
### 문자열에서도 사용 가능
```javascript
// 문자열에서 각 문자를 차례 차례 한개씩 뽑아서 중괄호 안에서 사용
for chr in "Hello" {
    print(chr)
    //print(chr, terminator: " ")     //다음줄로 넘어가지 말고, 한칸을 띄워라
    // H e l l o
}
```
### 특정한 함수 활용 가능
```javascript
// 역순으로 바꾸기
for number in (1...5).reversed() {
    print(number)
}
//홀수 또는 홀수만 뽑아내기
for number in stride(from: 1, to: 15, by:2) {     //마지막 숫자는 포함하지 않음
    print(number)
}
```
stride: 성큼성큼 걷다
```javascript
let range = stride(from: 1, to: 15, by: 2)     //  StrideTo<Int>
print(range)
// 1, 3, 5, 7, 9, 11, 13
for i in range {
    print(i)
}
let range1 = stride(from: 1, through: 15, by: 2)     // StrideThrough<Int>
print(range1)
// 1, 3, 5, 7, 9, 11, 13, 15
for i in range1 {
    print(i)
}
let range2 = stride(from: 10, through: 2, by: -2)      //   StrideThrough<Int>
print(range2)
// 10, 8, 6, 4, 2
for i in range2 {
    print(i)
}
```
## for문 주의점
### for문에서 선언하는 변수(상수)에 대한 정확한 이해
---
for문의 임시 상수
1) for문이 진행되는 동안 사용이 되는 임시적인 상수(let)이다.
2) for문에서 선언하는 변수(상수)는 for문 내에서만 사용이 가능하다.
---
```javascript
var name = "홍길동"
for name in 1...5 {
    print(name)
}

for _ in 1...5 {
    print(name)
}
```
---
 일반적인 변수 (범위 - 스코프)
 1) for문 내부에서는 외부에 선언된 변수에는 접근이 가능하다.
 2) for문 내부에서 새롭게 선언한 변수에는 외부에서 접근이 불가능하다.
---
```javascript
var sum = 0
for i in 1...10 {
    sum += i
}
print(sum)
for index in 1...5 {
    print("For문 출력해보기: \(index)")
    print(name)
    var realName = "잡스"
    print(realName)
}
//print(realName)
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
