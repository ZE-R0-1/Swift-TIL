## 프로토콜의 메서드 디스패치(Witness Table)
### Table Dispatch (Virtual Table / Witness Table)
프로토콜 - Witness Table
```javascript
protocol MyProtocol {
    func method1()    // 요구사항 - Witness Table
    func method2()    // 요구사항 - Witness Table
}
extension MyProtocol {
    // 요구사항의 기본 구현 제공
    func method1() { print("Protocol - Witness Table method1") }
    func method2() { print("Protocol - Witness Table method2") }    
    // 필수 요구사항은 아님 ==> Direct Dispatch
    func anotherMothod() {
        print("Protocol Extension - Direct method")
    }
}
!!클래스 - Virtual Table!!
class FirstClass: MyProtocol {
    func method1() { print("Class - Virtual Table method1") }
    func method2() { print("Class - Virtual Table method2") }
    func anotherMothod() { print("Class - Virtual Table method3") }
}
==============================================================
[Class Virtual Table]
- func method1() { print("Class - Virtual Table method1") }
- func method2() { print("Class - Virtual Table method2") }
- func anotherMothod() { print("Class - Virtual Table method3") }
==============================================================
==============================================================
[Protocol Witness Table]
- func method1() { print("Class - Virtual Table method1") }   // 요구사항 - 우선순위 반영⭐️
- func method2() { print("Class - Virtual Table method2") }   // 요구사항 - 우선순위 반영⭐️
==============================================================
let first = FirstClass()
first.method1()           // Class - Virtual Table method1
first.method2()           // Class - Virtual Table method2
first.anotherMothod()     // Class - Virtual Table method3
let proto: MyProtocol = FirstClass()
proto.method1()           // Class - Virtual Table method1  (Witness Table)
proto.method2()           // Class - Virtual Table method2  (Witness Table)
proto.anotherMothod()     // Protocol Extension - Direct method
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
