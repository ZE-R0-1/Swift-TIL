## 메모리 관리
### Memory Leak(메모리 누수) 현상에 대한 이해
```javascript
class Dog {
    var name: String
    var owner: Person?
    
    init(name: String) {
        self.name = name
    }    
    deinit {
        print("\(name) 메모리 해제")
    }
}

class Person {
    var name: String
    var pet: Dog?    
    init(name: String) {
        self.name = name
    }    
    deinit {
        print("\(name) 메모리 해제")
    }
}

var bori: Dog? = Dog(name: "보리")
var gildong: Person? = Person(name: "홍길동")

bori?.owner = gildong
gildong?.pet = bori

// 강한 참조 사이클(Strong Reference Cycle)이 일어남
bori = nil
gildong = nil
```
---
 - 객체가 서로를 참조하는 강한 참조 사이클로 인해
 - 변수의 참조에 nil을 할당해도 메모리 해제가 되지 않는
 - 메모리 누수(Memory Leak)의 상황이 발생

---
### Memory Leak의 해결방안
---
 - RC를 고려하여, 참조 해제 순서를 주의해서 코드 작성  
    > 신경쓸 것이 많음/실수 가능성
 
 - 1) Weak Reference (약한 참조)
 - 2) Unowned Reference (비소유 참조)

---
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
