## ARC(Automatic Reference Counting)를 통한 메모리 관리
### MRC(Manual RC) vs ARC(Automatic RC)
```javascript
// MRC(수동 RC관리)와 ARC(자동 RC)
class Dog {
    var name: String
    var weight: Double 
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }  
    deinit {
        print("\(name) 메모리 해제")
    }
}

var choco: Dog? = Dog(name: "초코", weight: 15.0)  //retain(choco)   RC: 1
var bori: Dog? = Dog(name: "보리", weight: 10.0)   //retain(bori)    RC: 1

choco = nil   // RC: 0  // 초코 메모리 해제
//release(choco)
bori = nil    // RC: 0  // 보리 메모리 해제
//release(bori)
```
---
 - 예전 언어들은 모든 메모리를 수동 관리했음
 - 실제로 개발자가 모든 메모리 해제 코드까지 삽입해야함 (실수할 가능성 높음)
 

 - retain() 할당 > release() 해제
    (RC  +1)      (RC  -1)

 - 개발자는 실제 로직 구현 포함, 메모리 관리에 대한 부담이 있었음 ⭐️


 - 따라서, 현대적 언어들은 대부분 자동 메모리 관리 모델을 사용
 - 스위프트의 경우, 컴파일러가 실제로
   retain() 할당 > release() 해제 코드를 삽입한다고 보면됨
 - 컴파일러가 메모리 관리코드를 자동으로 추가해 줌으로써, 프로그램의 메모리 관리에 대한 안정성 증가


 - 단지 아래와 같은 메커니즘의 실행을 수동(Manual)으로 할 것인지,
   자동(Automatic)으로 할 것인지의 차이

 [ARC모델의 기반: 소유정책과 참조카운팅]
   1.소유정책 - 인스턴스는 하나이상의 소유자가 있는 경우 메모리에 유지됨
             (소유자가 없으면, 메모리에서 제거)
   2.참조카운팅 - 인스턴스(나)를 가르키는 소유자수를 카운팅

 - (쉽게 말하면, 인스턴스를 가르키고 있는 RC가 1이상이면 메모리에 유지되고, 0이되면 메모리에서 제거됨)

---
### ARC(Automatic Reference Counting)
```javascript
var dog1: Dog?
var dog2: Dog?
var dog3: Dog?

dog1 = Dog(name: "댕댕이", weight: 7.0)     // RC + 1   RC == 1
dog2 = dog1                               // RC + 1   RC == 2
dog3 = dog1                               // RC + 1   RC == 3

dog3?.name = "깜둥이"
dog2?.name
dog1?.name

dog3 = nil                                // RC - 1   RC == 2
dog2 = nil                                // RC - 1   RC == 1
dog1 = nil                                // RC - 1   RC == 0    // 메모리 해제
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
