# 기본연산자(Basic Operators)
## 1) 연산자 기초
### 연산자란
---
연산자(operator)
- 값을 검사, 바꾸거나, 또는 조합하기 위해 사용하는 특수한 '기호(symbol)'나 '구절(phrase)'임  

[피연산자의 갯수에 따른 연산자 구분]
1. 단항연산자: 단일 대상의 바로  앞 또는 바로 뒤에 위치하는 연산자  
(예시) -a; +b; !a; a... 등이 존재
2. 이항연산자: 두개의 대상의 가운데 위치하여 검사 및 계산. (대부분 이항연산자 형태로 사용)  
(예시) a + b; a - b; a >= b
3. 삼항연산자: 세개의 대상을 조합하여 특수한 계산을 함. (단 한가지의 삼항연산자가 존재)  
(예시) a ? b : c
---
## 2) 기본 연산자
### 할당 연산자(Assignment Operator)
```javascript
// 할당연산자: 오른쪽의 값을 왼쪽에 대입
// 왼쪽의 값을 오른쪽의 값으로 초기화 하거나 업데이트 함)
let num2 = 10
var num1 = 5
num1 = num2 // 10
```
### 산술 연산자(Arithmetic Operator): 사칙 연산 등 기본적으로 스위프트에 내장되어 있는 기능
```javascript
var a = 456
var b = 123
a + b // 579
a - b // 333
a * b // 56088
b / a // 0
b % a // 123
```
모듈로(%)의 사용(Int일 때만 사용) > 주로 사용하는 패턴의 예시
```javascript
// 1) 첫번째 패턴
var yourWatchingTime: Int = 70  // 70분
var hour = yourWatchingTime / 60
var minute = yourWatcingTime % 60

print("당신은 \(yourWatchingTime)분. 즉, 총 \(hour)시간 \(minute)분을 시청 하셨습니다.")
// 2) 두번째 패턴
var num = 100
var array = ["1", "2", "3"] // 배열
array[0]  // "1"
array[num % 3]  // "2"
```
### 나누기 사용은 항상 주의
```javascript
a = 4
b = 5
var newResult: Double
newResult = Double(a / b) // 0
newResult = Double(a) / Double(b) // 0.8
```
### 사칙연산 및 모듈로 사용 연습
```javascript
let a1 = 6
let b1 = 2
var result: Int
result = a1 + b1
print(result)
result = a1 - b1
print(result)
result = a1 * b1
print(result)
result = a1 / b1
print(result)
result = a1 % b1
print(result)
```
### 복합 할당 연산자(Compound Assignment Operators)
```javascript
var value = 0
//value = value + 10
value += 10
//value = value - 5
value -= 5
//value = value * 2
value *= 2
//value = value / 2
value /= 2
//value = value % 2
value %= 2

value++ // 스위프트에서는 지원하지 않음
value += 1
```
### 비교연산자(Comparison Operators): 결과적으로 문장의 평가값은 참/거짓으로 도출
```javascript
a = 456
b = 123
a == b  // false
a != b  // true
a > b   // true
a < b   // false
a >= b  // true
a <= b  // false
var c = (b == 123)  // true
```
### 논리연산자(Logical Operators)
```javascript
!true   // false
!false  // true

true && true     // true
ture && false    // false
false && true    // false
false && false   // false

true || true     // true
ture || false    // true
false || true    // true
false || false   // false
```
### 연산(계산)의 우선순위(Procedence) 지정/기본적으로 곱하기 우선
---
연산의 우선순위
1. */ 곱하기/나누기
2. +- 더하기/빼기
3. <= > == != 비교
4. && || 논리
5. 삼항연산자
6. = += 할당,복합할당
---
## 2) 접근연산자
### 접근연산자 - (.)점
```javascript
Int.random(in: 1...5)
var number = Int.random(in: 1...5)
var name = "스티브"
print(name.count)
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
