## 프로토콜(Protocols) 기본 문법
```javascript
// 프로토콜? 규약 (약속)  > "자격증"
// 1) 정의
protocol MyProtocol {   // 최소한의 요구사항 나열

}

// 클래스에서 상속이 있는 경우, 1) 상위 클래스를 먼저 선언 후, 2) 프로토콜 채택 선언

class FamilyClass { }
// 2) 채택 (클래스, 구조체, 열거형 다 가능)
class MyClass: FamilyClass, MyProtocol {    // 상위클래스인 FamilyClass를 먼저 선언
    // 3) (속성/메서드) 구체적인 구현
}
struct MyStruct: MyProtocol {
    // 3) (속성/메서드) 구체적인 구현
}
enum MyEnum: MyProtocol {
    // 3) (속성/메서드) 구체적인 구현
}
```
### 프로토콜의 요구사항의 종류
---
 - 프로토콜을 채택하려는 클래스, 구조체, 열거형에 최소한 이런 내용을 구현해야한다고 선언하는 부분
 - 1. 속성 요구사항
 - 2. 메서드 요구사항 (메서드/생성자/서브스크립트)

---
## 속성의 요구사항 정의하는 방법
### 속성 요구사항 정의
---
  [프로토콜 속성의 요구사항]
 - 속성의 뜻에서 var로 선언 (let으로 선언할 수 없음)
 - get, set 키워드를 통해서 읽기/쓰기 여부를 설정 (최소한의 요구사항일뿐)
 - 저장 속성/계산 속성으로 모두 구현 가능

---

[인스턴스 속성 요구사항]
- 최소한의 요구사항을 지정
- 저장 속성 / 계산 속성으로 모두 구현 가능 (프로토콜 요구사항만으로는 저장/계산 속성의 구별 불가)
- { get } > 저장 속성: let / var, 계산 속성: 읽기(get) / 읽기쓰기(get/set)
- { get set } > 저장 속성: var, 계산 속성: 읽기쓰기(get/set)

[타입(static) 속성 요구사항]
- 최소한의 요구사항을 지정
- 저장 타입 속성 / 계산 타입 속성으로 모두 구현 가능 (프로토콜 요구사항만으로는 저장/계산 속성의 구별 불가)
- 채택시 저장 타입 속성에서 static키워드로만 구현 가능(저장 속성 재정의 불가 원칙)
- 클래스에서 채택시 계산 타입 속성에서 static/class 키워드로 모두 구현 가능(타입 속성의 의미일뿐)(class 키워드는 재정의 가능)
```javascript
protocol RemoteMouse {  
    var id: String { get }                // ===> let 저장속성 / var 저장속성 / 읽기계산속성 / 읽기,쓰기 계산속성    
    var name: String { get set }          // ===> var 저장속성 / 읽기,쓰기 계산속성
    static var type: String { get set }   // ===> 타입 저장 속성 (static)
                                          // ===> 타입 계산 속성 (class)
}
// 채택하면, (최소한의)요구사항을 정확하게 따라서 구현해야함
// 인스턴스 저장/계산 속성 =========================
struct TV: RemoteMouse {    
    var id: String = "456"   
    var name: String = "삼성티비"    
    static var type: String = "리모콘"
}
let myTV = TV()
myTV.id     // 456
myTV.name   // 삼성티비
TV.type     // 리모콘
// 타입 속성 ===================================
// 1) 저장 타입 속성으로 구현
class SmartPhone: RemoteMouse {
    var id: String {
        return "777"
    }  
    var name: String {
        get { "아이폰" }
        set { }
    }    
    static var type: String = "리모콘"     // 타입 저장 속성은 (상속은 되지만) 재정의 원칙적 불가능
}


// 2) 계산 타입 속성으로 구현
class Ipad: RemoteMouse {
    var id: String = "777"    
    var name: String = "아이패드"    
    class var type: String {       // 타입 계산 속성은 재정의 가능 (class키워드 가능)
        get { "리모콘" }
        set { }
    }
}
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
