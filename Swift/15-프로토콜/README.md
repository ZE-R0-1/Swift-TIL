## 프로토콜(Protocols)
### 클래스와 상속의 단점
1. 하나의 클래스만 상속가능 (다중 상속 불가능)
2. 기본적인 상위클래스의 메모리 구조를 따라갈 수 밖에 없음  (필요하지 않은 속성/메서드도 상속됨)
3. 클래스(레퍼런스 타입)에서만 가능

프로토콜은 이러한 단점을 보완하여 추가기능 - 메서드를 각 클래스에 넣어줄 수 있다
### 프로토콜의 기본 문법
```javascript
1) 정의
protocol MyProtocol { // 프로토콜(즉, 규약)을 만들어 필요한 요구사항만 담음
  func doing( ) -> Int 
}
2) 채택 및 구현
class Class: MyProtocol { // 프로토콜을 채택(클래스, 구조체, 열거형에서 채택 가능)
  func doing() -> Int {
    return 7  // 프로토콜에서 요구사항을 직접 구현(속성/메서드)
  }
}
// 상속이 있는 경우의 문법
class Person: Student, MyProtocol { ... }
// 상속하려는 클래스 먼저 선언
```
### 프토토콜의 필요성에 대한 인식
```javascript
// 정의
protocol SomeProtocol {     // 요구사항을 정의 (자격증의 필수 능력만 정의)
    func playPiano()
}
// 채택 및 구현
// 구조체에서 채택
struct MyStruct: SomeProtocol {       // 이제 자격증의 능력이 생긴 것임
    func playPiano() {
        // 구체적인 구현
    }
}
// 클래스에서 채택
class MyClass: SomeProtocol {        // 이제 자격증의 능력이 생긴 것임
    func playPiano() {
        // 구체적인 구현
    }
}
```
### 프토토콜의 필요성에 대한 인식 - 클래스와 상속의 단점 ⭐️
```javascript
// 예제
class Bird {    
    var isFemale = true    
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }    
    func fly() {
        print("새가 하늘로 날아간다.")
    }
}
class Eagle: Bird {   
    // isFamale
    // layEgg()
    // fly()    
    func soar() {
        print("공중으로 치솟아 난다.")
    }
}
class Penguin: Bird {    
    // isFamale
    // layEgg()    
    // fly()       // 상속 구조에서는 펭귄이 어쩔 수 없이 날개됨 ⭐️   
    func swim() {
        print("헤엄친다.")
    }
}
// struct가 될 수도 없고(클래스로만 구현가능), 무조건 Bird를 상속해야만 함
class Airplane: Bird {    
    // isFamale
    // layEgg()         // 상속 구조에서는 비행기가 알을 낳게됨 ⭐️    
    override func fly() { // fly 재정의
        print("비행기가 엔진을 사용해서 날아간다")
    }
}
// 플라잉 박물관을 만듦
struct FlyingMuseum {
    func flyingDemo(flyingObject: Bird) {
        flyingObject.fly()
    }
}
let myEagle = Eagle()
myEagle.fly()     // 새가 하늘로 날아간다.
myEagle.layEgg()  // 새가 알을 낳는다.
myEagle.soar()    // 공중으로 치솟아 난다.
let myPenguin = Penguin()
myPenguin.layEgg()  // 새가 알을 낳는다.
myPenguin.swim()    // 헤엄친다
myPenguin.fly()     // 문제발생 > 펭귄이 날개 됨(무조건적인 멤버 상속의 단점)
let myPlane = Airplane()
myPlane.fly()       // 비행기가 엔진을 사용해서 날아간다
myPlane.layEgg()    // 문제발생 > 비행기가 알을 낳음
let museum = FlyingMuseum()     // 타입 정의 ===> 오직 Bird 클래스 밖에 안됨
museum.flyingDemo(flyingObject: myEagle)    // 새가 하늘로 날아간다.
museum.flyingDemo(flyingObject: myPenguin)  // 새가 하늘로 날아간다.
museum.flyingDemo(flyingObject: myPlane)    // 비행기가 엔진을 사용해서 날아간다
// Bird를 상속해야만 사용 가능
```
---
 - 프로토콜은 위와 같은 상황을 해결해주는 해결책이다.

 - 1) "fly()"라는 동작을 따로 분리해내어서, 굳이 상속을 하지 않고도 사용가능하게 만들려면?
 - 2) 꼭 클래스가 아닌, 구조체에서도 "fly()"기능을 동작하게 하려면?

---
### 프토토콜의 도입 - 클래스와 상속의 단점을 보완 ⭐️
```javascript
// "fly()"라는 기능을 따로 분리해 내기
protocol CanFly {
    func fly()      // 구체적인 구현은 하지 않음 ===> 구체적인 구현은 자격증을 채택한 곳에서
}
class Bird1 {   
    var isFemale = true   
    func layEgg() {
        if isFemale {
            print("새가 알을 낳는다.")
        }
    }
}
class Eagle1: Bird1, CanFly {    // "CanFly" 자격증을 채택    
    // isFemale
    // layEgg()   
    func fly() {
        print("독수리가 하늘로 날라올라 간다.")
    }    
    func soar() {
        print("공중으로 활공한다.")
    }
}
class Penguin1: Bird1 {   
    // isFemale
    // layEgg()    
    func swim() {
        print("물 속을 헤엄칠 수 있다.")
    }
}
// 구조체에서 채택도 가능
struct Airplane1: CanFly {
    func fly() {
        print("비행기가 날아간다")
    }
}
// 박물관을 만듦
struct FlyingMuseum1 {
    func flyingDemo(flyingObject: CanFly) {     // 중요한 기능 > 프로토콜을 타입으로 인식
        flyingObject.fly()
    }
}
let myEagle1 = Eagle1()
myEagle1.fly()    // 독수리가 하늘로 날라올라 간다.
myEagle1.layEgg() // 새가 알을 낳는다.
myEagle1.soar()   // 공중으로 활공한다.
let myPenguin1 = Penguin1()
myPenguin1.layEgg()   // 새가 알을 낳는다.
myPenguin1.swim()     // 물 속을 헤엄칠 수 있다.
//myPenguin1.fly()    // 더이상 펭귄이 날지 않음
let myPlane1 = Airplane1()
//myPlane1.layEgg()   // 더이상 비행기가 알을 낳지 않음
myPlane1.fly()        // 비행기가 날아간다
let museum1 = FlyingMuseum1()
museum1.flyingDemo(flyingObject: myEagle1)    // 독수리가 하늘로 날라올라 간다.
//museum1.flyingDemo(flyingObject: myPenguin1)// 더이상 "CanFly"자격증이 없는 펭귄은 날지 못함
museum1.flyingDemo(flyingObject: myPlane1)    // 비행기가 날아간다.
// 예제 출처 (유데미 - 안젤라 님 강의)
// https://www.udemy.com/course/ios-13-app-development-bootcamp/
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
