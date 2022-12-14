## 함수의 오버로딩(overloading)
### 함수의 오버로딩에 대한 이해
```javascript
// 오버로드(overload): 영어로 과적하다라는 뜻
// 같은 이름의 함수에 매개변수(파라미터)를 다르게 선언하여, 하나의 함수 이름에 실제 여러개의 함수를 대응 시키는 것
// ===> 쉽게말하면: 함수의 이름의 재사용

// 스위프트는 오버로딩을 지원하는 언어
// ⭐️ 함수이름, 파라미터 수/자료형, 아규먼트 레이블, 리턴형을 모두포함해서 함수를 식별

func doSomething(value: Int) {
    print(value)
}
func doSomething(value: Double) {
    print(value)
}
func doSomething(value: String) {
    print(value)
}
func doSomething(_ value: String) {
    print(value)
}
func doSomethging(value1: String, value2: Int) {
    print(value1, value2)
}

doSomething(value: 5) // 5
doSomething(value: 3.4) // 3.4
doSomething(value: 3) // 3

// 오버로딩을 지원하지 않는 언어의 단점
// 같은 기능을 제공하는 함수를 파라미터 형식마다 이름을 다르게 구현해야하기 때문에 함수의 이름이 많아지고, 구별해서 사용하는 것이 어렵다.

// 실제 애플에서 만들어놓은 함수들에도 오버로딩을 사용한 함수들이 많음
//print(items: Any..., to: &TextOutputStream)
//print(items: Any..., separator: String, terminator: String)
//print(items: Any..., separator: String, terminator: String, to: TextOutputStream)
```
## 범위(Scope)
### Scope - 함수, if, for문 등에 해당
---
 1. 변수는 코드에서 선언이 되어야, 그 이하의 코드에서 접근 가능(선언하기 이전에는 접근 불가함) (전역변수는 예외)
 2. 상위스코프(범위)에 선언된 변수와 상수에 접근가능하며, 하위스코프(범위)에는 접근할 수 없다.
 3. (동일한 스코프에서 이름이 중복될 수 없지만, 다른 스코프에서는 이름 중복이 가능)
     가장 인접한 스코프에 있는 변수와 상수에 먼저 접근 한다.
---
### 첫번째 예제
```javascript
func greeting1() {
    print("Hello")
    
    var myName = "홍길동"
    print(myName)
    
    print(name)
    
    if true {
        print(myName)
        print(name)
    }
}
//print(myName)
//print(name)
greeting1() 
// Hello
// 홍길동

// 홍길동

var name = "잡스" // 전역변수 (메모리의 데이터 영역에 저장)
greeting1()
// Hello
// 홍길동
// 잡스
// 홍길동
// 잡스
```
### 두번째 예제
```javascript
//func doSomething() {
//    print(realName)       // 코드는 순서대로 작동하기 때문에, 선언이 되어있어야 사용 가능
//
//    var realName = "앨런"
//}
//doSomething()
```
### 세번째 예제
```javascript
func sayGreeting1() {
    print("Hello")
       
    func sayGreeting2() {
        print("Hey")
        
        if true {
            print("")
        }
    }   
    sayGreeting2()
    
}
//sayGreeting1()
//sayGreeting2()
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
