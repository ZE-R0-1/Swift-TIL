# 함수
## 함수(Function)
### "특정한 작업(기능)"을 수행하는 코드의 묶음에 (식별할 수 있는 특정한) 이름을 부여하여 사용하는 것
```javascript
// 함수는 항상 2단계로 실행
// 1) 함수 정의문
func sayhello() {
    print("Hello, world!")
    print("Hello, Swift!")
    print("Hello, what's up, bro!")
}
// 2) 함수 실행문(call)
sayhello()
```
### 함수를 왜 사용할까? 함수 사용의 이유
---
 1) 반복되는 동작을 단순화해서 재사용 가능
 2) 코드를 논리적 단위로 구분 가능
 3) 코드 길이가 긴 것을 단순화해서 사용 가능
 4) 미리 함수를 잘 만들어 놓으면, 개발자는 사용만 하면 됨(내부적 내용을 몰라도 사용 가능)
---
### 함수의 실행문(call)에 대한 인지
```javascript
print("Hello")
sayhello()
// 소괄호 ()는 함수의 실행
// 소문자로 시작하고, 뒤에 () 소괄호(퍼렌서시스)가 오면 이것은 함수의 실행문이라는 것을 인지해야 함
```
## 함수의 형태
### 1) 함수가 인풋(input)이 있는 경우
```javascript
// 함수 정의문
func saySomething(name: String) {
    print("안녕하세요 \(name) 님")
}
// 함수 실행문(call)
saySomething(name: "스티브")
var name = "Jobs"
saySomething(name: name)
```
### 2) 함수가 아웃풋(output)이 있는 경우
```javascript
// 아웃풋 앞에 return이라는 키워드를 사용해야 한다.
func sayHelloString() -> String {
    return "안녕하세요"
}
sayHelloString()  // 안녕하세요
print(sayHelloString() + " 잡스 님")
// 함수를 호출하는 것도 표현식이 될 수 있다.(리턴형이 있는 경우)
// (표현식의 결과는 함수가 리턴하는 값)
var name1 = sayHelloString()
```
### 3) 인풋과 아웃풋이 모두 있는 경우
```javascript
// 함수 정의문
func plusFuntion(a: Int, b: Int) -> Int {
    let c = a + b
    return c       // 아웃풋이 있는 경우, 리턴키워드를 사용해야함
}
// 함수 실행문(call)
plusFuntion(a: 3, b: 4) // 7
print(plusFuntion(a: 5, b: 6))  // 11

// 함수 정의문
func someFuntions(x: Int) -> Int {
    var y = 2 * x + 3
    return y
}
// 함수 실행문(call)
someFuntions(x: 2)  // 7

// 함수 정의문
func sayHello1(a: String) -> String {
    var say = "안녕 반가워. \(a)야. 나는 스위프트라고 해."
    return say
}
// 함수 실행문(call)
sayHello1(a: "아이유")
sayHello1(a: "GD")
print(sayHello1(a: "스티브잡스"))

// 함수 정의문
func number5() -> Int {
    return 5
}
// 함수 실행문(call)
number5()
print(number5())  // 5
```
### Void 타입의 이해 (아웃풋이 없는 경우)
```javascript
func sayhello1() {
    print("Hello, Swift!")
}
func sayhello2() -> Void {
    print("Hello, Swift!")
}
func sayhello3() -> () {
    print("Hello, Swift!")
}
```
### 리턴 타입이 없는 함수(Void 타입) vs 리턴타입이 있는 함수의 차이
```javascript
// 리턴 타입이 없는 함수 ➞ 결과는 Void 타입
sayhello1()         // 제어권
// 이렇게 사용하는 경우는 없음
//var hello: Void = sayhello1()
// 리턴 타입이 있는 함수 ➞ 결국 결과로 "값"이 있는 것 ➞ (일반적으로)사용
// 함수 자체를 값으로 볼 수 있음
print(sayHelloString())       // 제어권 + 결과값
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨()](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
