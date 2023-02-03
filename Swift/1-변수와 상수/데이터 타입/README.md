# 스위프트의 데이터 타입(Data Types)
## 1) 데이터 타입(Data Types)의 이해
### 타입이 왜 필요할까?
```javascript
var i: Int = 4
var j: Int = 3
// i = 3.4  // 소수점 타입 할당이 안됨
var k = i + j
print(k)  // 7
// 타입은 메모리 공간의 크기와 연관이 있다
```
### 스위프트(swift)의 데이터 타입
---
Swift에서 사용하는 데이터 타입
 1) Int: 정수(Integer)
 2) Float : 실수(부동소수점) 6자리 소수점
 3) Double : 실수(부동소수점) 15자리 소수점
 4) Character : 문자(글자 한개)
 5) String : 물자열
 6) Bool : 참과 거짓
 7) 기타 : UInt, UInt64, UInt32, UInt8: 0, 양의 정수
---
```javascript
var b: Int = 7
var c: Double = 3
let chr: Character = "1"
type(of: chr) // Character.Type
let chr2: Character = " " // 빈문자는 에러, 공백문자는 저장가능
let str: String = ""  // 빈문자열 저장가능
let str1: String = "안녕하세요"
```
## 2) 타입 주석
### 변수를 선언하면서, 타입도 명확하게 지정하는 방식
```javascript
var number: Int // 1) 변수를 선언 (타입 선언)
number = 10     // 2) 값을 저장 (초기화)
print(number)   // 3) 값을 읽기

// 자료형을 명확하게 지정
var a1: Int = 3
var b1: Int = 4

// 타입 선언과 초기화
var value: Double = 5.345
value = 12.3  // 값 바꾸기
var value2 = value  // 12.3
```
## 3) 타입 추론(Type Inference)
### 타입을 지정하지 않아도, 컴파일러가 타입을 유추해서 (알아서 알맞는 타입으로 저장하는) 방식
```javascript
// 값을 보고, 어떤 타입인지를 컴파일러가 추론해서 사용함
var nmae = "홍길동"
type(of: name)  // String.Type

var num1 = 2
var num2 = 1.2
var num3: String = "Hello"
var num4 = true
type(of: num4)  // Bool.Type
```
## 4) 타입 안정성(Type Safety)
### 스위프트는 데이터 타입을 명확하게 구분하여 사용하는 언어
스위프트는 다른 타입끼리 계산할 수 없다
```javascript
let num5 = 7
let num6: Double = num5 // num5의 데이터 타입이 Int형이므로 호환되지않음
let d = 12
let e = 3.14
let result = d + e  // 정상적인 계산 불가능
// 소수 + 정수를 더할수 없다
// "안녕" + 5 를 더할수 없다
```
## 5) 타입(형) 변환(Type Conversion)
### 타입을 변환해서 사용할 수 있는 방법은 있다
```javascript
// 기존에 메모리에 저장된 값을 다른 형식으로 바꿔서, 새로운 값을 생성해서 다른 메모리 공간에 다시 저장
let str2 = "123"
let number1 = Int(str2)
print(number1)  // Optional(123)
let str3 = "123.4"
let number2 = Int(str3) // 타입컨버전이 실패했을때 -> nil(값이 없음)이 리턴될 수 있다
print(number2)  // nil
let n = 2
let n2 = Double(n)
print(n2) // 2.0
let n3: Int = Int(123.4)
print(n3) // 123
```
## Reference
[인프런 - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
