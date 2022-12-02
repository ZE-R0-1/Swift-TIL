## 1) Break
### (1) switch문   (2) 반복문(for/while 등) 에서 사용
```javascript
var a = 3

switch a {
case 1:
    break      // 실행하는 문장이 없을때, 반드시 입력 (약속)
case 2:
    print(a)
case 3:
    print("3입니다.")
case 4:
    print("안녕하세요")
default:
    break
}

// 가장 인접한 반복문을 아예 중지 ⭐️
for index in 1...10 {

    if index == 3 {
        break
    }

    print(index)
}
```
## 2) fallthrough > 아직 안배움
### switch문에서 사용
```javascript
switch a {
case 1:
    break      // 실행하는 문장이 없을때, 반드시 입력 (약속)
case 2:
    print(a)
case 3:
    print("3입니다.")
    fallthrough
case 4:
    print("안녕하세요")
default:
    break
}
// 3입니다.
// 안녕하세요
```
## 3) continue
### 반복문에서 사용(for/ while 등)
```javascript
// continue는 반복문을 다음 싸이클로 보냄
// 다음 싸이클에서 계속 지속(continue)하라는 의미
for index in 1...10 {

    if index % 2 != 0 {
        continue
    }

    print(index)
}
```
## 4) return
### 함수에서 사용
```javascript
func doSomething() {
    print("1")  // 1
    print("2")  // 2
    
    if true {
        return
    }
    
    print("3")
    print("4")
}
doSomething()
```
## 5) throw > 아직 안배움
### (에러가 발생할 수 있는) throwing 함수에서 사용
```javascript
// 향후 Error Handling 부분을 배운 후, 복습
enum APIError: Error {
    case aError
    case bError
}

func doSomething2() throws -> String {
    print("1")
    print("2")
    
    if true {
        throw APIError.aError    // 리턴과 동일한 역할(함수를 종료시킴) ===> 에러를 던지고 함수를 벗어남
    }
    
    print("3")
    print("4")
    
    return "안녕하세요"
}
```
## inout 파라미터
### 함수를 통해, 변수를 직접 수정하고 싶은 경우는 어떻게 해야할까?
함수내의 파라미터는 기본적으로 값타입이고(복사되서 전달) 임시상수이기 때문에 변경 불가 원칙
```javascript
var num1 = 123     // 전역변수
var num2 = 456     // 전역변수

func swap(a: Int, b: Int) {
//    var c = a
//    a = b
//    b = c
}

swap(a: num1, b: num2)
```
### 함수 내에서 변수를 직접 수정하도록 돕는 inout키워드 (참조로 전달)
inout 키워드(선언시),   & 사용(실행시)
```javascript
num1 = 123
num2 = 456

func swapNumbers(a: inout Int, b: inout Int) {
    var temp = a  // 123
    a = b // 456
    b = temp  // 123
}

// 함수 실행시에는 앰퍼샌드를 꼭 붙여야함
swapNumbers(a: &num1, b: &num2)
print(num1) // 456
print(num2) // 123

// 입출력 파라미터는 내부적으로 copy-in, copy-out 메모리 모델를 사용하지만, 실제 원본이 전달된다고 쉽게 생각하면 됨
// *copy-in, copy-out - 값을 복사해서 함수 바디 내부로 전달하고,
// 함수가 종료될때, 아규먼트로 전달한 변수에 복사됨(함수 바디 내부에서 외부로 복사되어 전달)
```
---
 inout파라미터 사용시 주의점
 1) 상수(let)나, 리터럴 전달하는 것 불가능
 2) 파라미터의 기본값 선언을 허용하지 않음
 3) 가변파라미터(여러개의 파라미터)로 선언하는 것 불가능
---
