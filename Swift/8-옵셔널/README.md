# Oprionals(옵셔널)
### 타입의 기본 개념에 대한 이해
```javascript
// 스위프트는 왜 옵셔널이라는 개념을 도입했을까?
// 모든 프로그래밍에서 아래와 같은 상황은 항상 골치거리임
var yourName: String        // 선언
//yourName = "홍길동"           // 값을 저장하지 않는다면..
print(yourName)   // (만약 저장과정이 없다면) 메모리에 저장된 값이 없는데 접근 ===> 🔸"에러"
```
### 타입(Type)
```javascript
// 지금까지의 타입 선언
let name: String = "Jobs"        // 명시적
let newName = "Musk"             // 암시적
var myAge = 20                   // 암시적
let myGrade: Double = 3.54       // 명시적
```
### 옵셔널 타입(Optional Type)
```javascript
// 모든 타입의 뒤에 ? 물음표를 붙이면 옵셔널 타입이 된다.
var num: Int? = 3
var yourAge: Int? = nil
var yourGrade: Double? = nil
var name1: String? = "Jobs"
num = nil
name1 = nil
// 값이 없어도 되는 타입으로 선언 했기 때문에, 값이 없어도 괜찮음
```
**nil** - 값이 없음을 나타내는 키워드 (실제 값이 없음이 아님)
### 옵셔널, 옵셔널 타입의 기본 개념에 대한 이해
```javascript
// 메모리 공간에 "임시적인 타입"을 넣어놓으면 어떨까?
var optionalName: String?
//optionalName = "홍길동"
print(optionalName)   // 에러가 나지 않음 (옵셔널은 값이 없다는 것을 나타내는 키워드)
```
---
 옵셔널 타입 선언의 기본 규칙
 1) nil 대입 가능
 2) 자동 초기화 (값을 넣지 않을 시에 nil로 초기화) ⭐️
---
### 정식문법 표기
```javascript
let num1: Int? = 2             // 간편표기
let num2: Optional<Int> = 0    // 정식문법
```
### 옵셔널 타입 연습
```javascript
//var optionalNum = nil         // 불가능한 형태
var optionalNum: Int? = nil     // (추론할 형식이 없기 때문에 반드시 타입 어노테이션으로 초기화해야됨)
optionalNum = 10
// 값이 없을 수도 있는 (임시적인)타입이야
print(optionalNum)      // Optional(10)
let str: String = "Swift"
var optionalStr: String? = nil      //옵셔널 스트링 타입 ====> (값이 없을 수도 있는 타입이다)
var a: Int? = 7  // 옵셔널 인트
var b = a        // 값을 복사해서 담는 다면 타입은?
print(b)  // Optional(10)
var c: Int = 5
b = c     // Int를 Int?타입에 담을 수는 있다. (어쨌든 타입이 Int? 타입으로 바뀌어서 담김)
print(b)  // Optional(5)
```
### 옵셔널 타입끼리의 연산은 불가능
옵셔널 타입끼리의 계산은 당연히 불가능
```javascript
var numA: Int? = 3
var numB: Int? = 7
//print(numA + numB)
```
## 옵셔널 타입 사용하기
### 옵셔널 타입: 값이 없을 수도 있는 경우를 포함하는(감싸고) 있는 임시적 타입
```javascript
var num: Int?
var str: String? = "안녕하세요"
print(num)  // nil
print(str)  // Optional("안녕하세요")
```
## 옵셔널값을 추출하는 4가지 방법
### 1) 강제로 값을 추출(Forced Unwrapping): 값이 있다는 것이 확실할때 사용
```javascript
// 강제 추출연산자 !를 옵셔널표현식 뒤에 붙여서 강제로 옵셔널값을 추출
print(str!) // 안녕하세요
//print(num!)       // 에러
```
### 2) if문으로 nil이 아니라는 것 확인한 후, 강제로 벗기기
```javascript
if str != nil {
    print(str!) // 안녕하세요
}
```
### 3) 옵셔널 바인딩 (if  let 바인딩) ⭐️⭐️⭐️
옵셔널 바인딩 - 바인딩이 된다면, 특정 작업을 하겠다는 의미
```javascript
if let s = str {    // s라는 상수에 담긴다면    // nil
    print(s)  // 안녕하세요
}
var optionalName: String? = "홍길동"
if let name = optionalName {
    print(name) // 홍길동
}
// 실제 앱을 만들때 guard let 바인딩 많이 사용
func doSomething(name: String?) {
    guard let n = name else { return }
    print(n)  
}
doSomething(name: "hello")  // // hello
```
### 4) 닐 코얼레싱 (Nil-Coalescing) 연산자를 사용하는 방법
**코얼레싱(coalesce)**: 영어로 (더 큰 덩어리로) 합치다는 뜻
```javascript
// 옵셔널 타입에 대하여, 디폴트(기본)값을 제시할 수 있을 때 사용
// (직접 값을 벗겨서 사용하는 것은 아니고, 디폴트값 제시를 통해 옵셔널 가능성을 없애는 방법)
// String? ====> String
var serverName: String? = "홍길동"
var userName = serverName ?? "미인증사용자"    // String타입
var hello = "인사하겠습니다. " + (str ?? "Say, Hi")
print(hello)  // 인사하겠습니다. 안녕하세요
str = nil
print(str ?? "Say, Hi") // Say, Hi
// 백그라운드 기본 색상이 선택이 안되어 있으면 ====> 회색
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
