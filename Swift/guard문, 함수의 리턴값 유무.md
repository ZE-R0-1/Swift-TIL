# guard문
## 가드문(guard statement)
### 불만족하는 조건을 사전에 걸러내는 조건문

if문의 단점 - 여러개의 조건이 있을때 코드의 가독성이 문제됨 ➞ guard문으로 단점 극복
if문을 만족하는 경우, 지속적인 들여쓰기로 인해 코드의 가속성이 안 좋아질 수 있음  
(실제 프로젝트에서는 코드를 알아보기 힘듦)

---
 **guard문**
 1) else문을 먼저 배치 - 먼저 조건을 판별하여 조기 종료(early exit)
 2) 조건을 만족하는 경우 코드가 다음 줄로 넘어가서 계속 실행
 3) 가드문에서 선언된 변수를 아래문장에서 사용 가능 (동일한 스코프로 취급) (guard let 바인딩 관련)
---
### 가드문의 이해
```javascript
func checkNumbersOf1(password: String) -> Bool {    
    if password.count >= 6 {       
        // 로그인을 처리하는 코드 작성
        // 1
        // 2
        // 3
        // 4
        // 5        
        return true        
    } else {        
        return false        
    }
}

func checkNumbersOf2(password: String) -> Bool {    
    // 감시하다
    guard password.count >= 6 else {
        return false                          // 종료 조건 - 함수 내에서는 return / throw
    }   
    // 로그인을 처리하는 코드 작성
    // 1
    // 2
    // 3
    // 4
    // 5
    return true
}
```
### 가드문의 사용 예시
```javascript
// 반드시 코드를 종료해야하는 조기 종료의 조건이 필요하므로, 로컬스코프(함수/반복문) 내에서만 사용 가능
func check(words: String) -> Bool {    
    guard words.count >= 5 else {       
        print("5글자 미만입니다.")
        return false                             // 종료 조건 - 함수 내에서는 return / throw
    }    
    print("\(words.count)글자입니다.")    
    return true
}
check(words: "안녕하세요")
```
# 함수의 리턴값 유무
### 함수의 정의
```javascript
// 리턴값(타입)이 없는 함수
func sayHello() {
    print("안녕하세요.")
}
//sayHello()

// 리턴값(타입)이 있는 함수
//@discardableResult
func sayHelloString() -> String {
    print("하이")
    return "안녕하세요"
}
sayHelloString()     // 실제 프로젝트에서 경고창 표시
```
### 리턴 타입이 없는 함수(Void 타입) vs 리턴타입이 있는 함수의 차이 ⭐️
```javascript
리턴 타입이 없는 함수 ➞ 결과는 Void 타입
```javascript
// 이렇게 사용하는 경우는 없음(결과값 없음)
//var hello: Void = sayhello1()
sayHello()         // 제어권
```
리턴 타입이 있는 함수 ➞ 결국 결과로 "값"이 있는 것 ➞ (일반적으로)사용
```javascript
// 함수 자체를 값으로 볼 수 있음
var hello = sayHelloString()       // 제어권 + 결과값
```
### 리턴값이 있는 함수에서 리턴값을 사용하지 않는다면
```javascript
// 기존의 방식
_ = sayHelloString()    // (결과값을 사용하지 않을때) 지금까지 많이 사용해오던 패턴

// 스위프트 5.2 부터
//@discardableResult   //어트리뷰트를 사용하도록함
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
