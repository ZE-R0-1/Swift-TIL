## 메서드 디스패치(Method Dispatch)
컴파일 타임  
Direct Dispatch(직접/Static)
- 컴파일 시점에 코드 자체에 함수의 메모리 주소 삽입 또는 함수의 명령 코드를 해당 위치에 코드 심음(in-line)
- 가장 빠름(0.0 - 2.13ns)
- 밸류 타입(구조체/열거형)에 사용
- 상속 / 다형성의 장점을 누릴 수 없음

런타임  
Table Dispatch(동적/Dynamic)
- 함수의 포인터를 배열형태 보관후 실행
- 중간(3.23ns)
- 클래스 / 프로토콜에서 사용

Message Dispatch(메세지)
- 상속구조를 모두 훑은 뒤에, 실행할 메서드 결정
- 가장 느림(5.82ns)
- 주로 Objective-C클래스에서 사용 
- Objective-C런타임에 의존

구분 | 본 체 (Initial Declaration) | Extension | 비고
------------ | ------------- | ------------ | -------------
Value Type(Struct) | Direct Dispatch | Direct Dispatch | -
Protocol | Table Dispatch(Witness) | Direct Dispatch(메서드 디폴트 구현 제공) | 본체의 요구사항 메서드를 Witness Table로 구현(프로토콜을 채택한 타입마다 테이블을 만듦)
Class | Table Dispatch(Virtual)*final키워드 - Direct* | Direct Dispatch(상속시 재정의 불가 원칙) *@objc dynamic - Message* | *@objc dynamic키워드*를 통해, Message Dispatch로 바뀌면 extension내의 메서드 재정의 가능
@objc dynamic | Message Dispatch | Message Dispatch | -
### 1 - 직접 디스패치 Direct Dispatch (Static)
```javascript
struct MyStruct {
    func method1() { print("Struct - Direct method1") }
    func method2() { print("Struct - Direct method2") }
}
let myStruct = MyStruct()
myStruct.method1()
myStruct.method2()
```
### 2 - 테이블 디스패치 Table Dispatch (동적 디스패치)
```javascript
class FirstClass {
    func method1() { print("Class - Table method1") }
    func method2() { print("Class - Table method2") }
}
================================================
 func method1() { print("Class - Table method1") }
 func method2() { print("Class - Table method2") }
================================================
// 자식클래스에서 테이블을 따로 보유
class SecondClass: FirstClass {
    override func method2() { print("Class - Table method2-2") }
    func method3() { print("Class - Table method3") }
}
================================================
 func method1() { print("Class - Table method1") }
 func method2() { print("Class - Table method2-2") }
 func method3() { print("Class - Table method3") }
================================================
let first = FirstClass()
first.method1()   // Class - Table method1
first.method2()   // Class - Table method2
let second = SecondClass()
second.method1()  // Class - Table method1
second.method2()  // Class - Table method2-2
second.method3()  // Class - Table method3
```
### 3 - 메세지 디스패치 Message Dispatch (메세지 디스패치)
```javascript
class ParentClass {
    @objc dynamic func method1() { print("Class - Message method1") }
    @objc dynamic func method2() { print("Class - Message method2") }
}
================================================
 func method1() { print("Class - Message method1") }
 func method2() { print("Class - Message method2") }
================================================
class ChildClass: ParentClass {
    @objc dynamic override func method2() { print("Class - Message method2-2") }
    @objc dynamic func method3() { print("Class - Message method3") }
}
================================================
 super class
 func method2() { print("Class - Message method2-2") }   // 재정의한 메서드는 다시 주소가짐
 func method2() { print("Class - Message method3") }
================================================
let child = ChildClass()
child.method1() // Class - Message method1
child.method2() // Class - Message method2-2
child.method3() // Class - Message method3
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
