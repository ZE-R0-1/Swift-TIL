## 클로저 - 이름이 없는(익명) 함수
클로저: 이름이 없는(익명) 함수
클로저와 함수는 기능은 완전히 동일한데, 형태만 다르다
함수: 이름이 있는 코드 묶음 > 다른 코드가 함수이름으로 호출하기 위함
클로저: 이름이 없는 코드 묶음 > 굳이 이름이 없어도 호출할 수 있는 형태로 사용 가능
```javascript
// 함수의 형태
func myFunction() -> Int {
  return ...
}
// 클로저의 형태
{() -> Int int
  return ...
}
```
클로저: 스위프트는 함수를 "일급객체"로 취급
함수는 타입이다.
1) "함수"를 변수에 할당할 수 있음
2) 함수를 호출할때, "함수"를 파라미터로 전달할 수 있음
3) 함수에서 "함수"를 반환할 수 있음
```javascript
// 함수의 형태에서 클로저의 형태로 변형시키기
func add(a: Int, b: Int) -> Int {
  let result = a + b
  return result
}
{(a: Int, b: Int) int
  let result = a + b
  return result
}
{(a, b) in
  let result = a + b
  return result
}
```
### 함수의 타입에 대한 표기
```javascript
// 함수의 타입 표기법
let functionA: (String) -> String      // 1)파라미터 문자열, 2)리턴형 문자열
let functionB: (Int) -> ()             // 1)파라미터 정수, 2)리턴형 없음
let functionC: (String) -> Void        // 1)파라미터 문자열, 2)리턴형 없음
```
### 기존의 함수의 형태와 클로저의 형태 비교
```javascript
// 함수의 정의
func aFunction(str: String) -> String {
    return "Hello, \(str)"
}
// 클로저의 형태
let _ = {(str: String) -> String in
    return "Hello, \(str)"
}
```
생각의 전환 ➞ **중괄호**는 **클로저(함수)**이다!
```javascript
let aClosureType = { () -> () in              // 변수에 담아서 호출하는 것도 가능
    print("안녕")
}
//let aClosureType = { print("안녕") }         // () -> ()
aClosureType()  // 안녕
```
### 함수를 1급객체(First-class Object)로 취급
---
 - 함수를 1급 객체로 취급
 
 1) 함수를 변수에 할당할 수 있다.
 2) 함수를 파라미터로 전달이 가능하다.
 3) (함수에서) 함수를 반환할 수 있다. (리턴 가능)

---
```javascript
func aFunction1(_ param: String) -> String {
    return param + "!"
}
func aFunction2(name: String) -> String {
    return name + "?!??"
}
// 함수를 변수에 할당가능(변수가 함수를 가르키게 됨)
var a: (String) -> String = aFunction1
a("안녕") // 안녕!
a = aFunction2
a("hello")  // hello?!??
// 함수(클로저)를 변수에 할당해서
let closureType = { (param: String) -> String in         // 클로저 리터럴
    return param + "!"
}
// 사용(실행)
closureType("스티브")  // 스티브!
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
