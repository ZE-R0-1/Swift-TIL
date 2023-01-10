## 구조체, 클래스의 초기화의 의미
### 앞에서의 객체의 생성
```javascript
class Dog {
    var name = "강아지"    // 속성에 기본값을 넣어서 생성
    var weight = 0
    func sit() {
        print("앉았습니다.")
    }
    func layDown() {
        print("누웠습니다.")
    }
}
var bori = Dog()
bori.name
bori.weight
bori.name = "보리"
bori.name
bori.weight = 15
bori.weight
```
### 초기화 메서드 / 이니셜라이저(initializer)
**생성자(이니셜라이저)** 는 인스턴스를 만들때 사용하는 특별한 메서드
```javascript
class Dog1 {
    var name: String
    var weight: Int
    // 생성자
    init(n: String, w: Int) {
        self.name = n
        self.weight = w
    }
    func sit() {
        print("\(self.name)가 앉았습니다.")
    }
    func layDown() {
        print("\(self.name)가 누웠습니다.")
    }
}
var dog1 = Dog1(n: "뭉이", w: 12)
dog1.name
dog1.weight
dog1.sit()
dog1.layDown()
var dog2 = Dog1(n: "땡이", w: 10)
var dog3 = Dog1(n: "흰둥이", w: 25)
var dog4 = Dog1.init(n: "초코", w: 13)
```
---
 - 초기화 메서드/이니셜라이저
 - init(파라미터)
 - 모든 저장 속성(변수)을 초기화 해야함 (구조체, 클래스 동일)
 - 생성자 실행 종료시점에는 모든 속성의 초기값이 저장되어 있어야 함(초기화가 완료되지 않으면 컴파일 에러)
 - 생성자의 목적은 결국 "저장속성 초기화"
 - 클래스, 구조체, (열거형)은 모두 설계도 일뿐이고,
 - 실제 데이터(속성), 동작(메서드)을 사용하기 위해서는 ===> 초기화 과정이 반드시 필요함

---
인스턴스 초기화 완료 ➞ 메모리에 정상적으로 인스턴스가 생성
### 생성자(이니셜라이저)와 self 키워드
```javascript
class Dog2 {
    var name: String
    var weight: Int
    init(name: String, weight: Int) {
        self.name = name
        self.weight = weight
    }
    func sit() {
        print("\(self.name) 앉았습니다.")
    }
    func layDown() {
        print("\(name) 누웠습니다.")
    }
}
// 인스턴스내에서 동일한 변수명, 상수명을 사용할때
// 가르키는 것을 명확하게 하기 위해 self키워드를 사용
```
**self 키워드**는 클래스/구조체 내에서 해당 인스턴스(자기자신)를 가르킴
### 초기화의 의미 - 속성이 옵셔널 타입인 경우
```javascript
class Dog3 {
    var name: String?
    var weight: Int
    init(weight: Int) {
        //self.name = "강아지"
        self.weight = weight
    }
    func sit() {
        print("\(name) 앉았습니다.")
    }
    func layDown() {
        print("\(name) 누웠습니다.")
    }
}
var dog5 = Dog3(weight: 10)
dog5.name
print(dog5.name)
print(dog5.weight)
dog5.sit()
```
옵셔널타입을 가진 변수의 경우는 반드시 초기화값이 있을 필요는 없음 ➞ nil로 초기화되기 때문
### Identity Operators(식별 연산자)
```javascript
// 식별 연산자 - 두개의 참조가 같은 인스턴스를 가르키고 있는지를 비교하는 방법
print(dog1 === dog2)
print(dog1 !== dog2)
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
