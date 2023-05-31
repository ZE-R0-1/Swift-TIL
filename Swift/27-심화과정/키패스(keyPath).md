## keyPath의 개념에 대한 이해
```swift
class Dog {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let dog1 = Dog(name: "초코")

dog1.name
"dog1.name"    // 이런식으로 접근하면 안될까?

// 위의 코드에서 굳이 필요성을 느끼지 못할 수 있지만,
class School {
    var name: String
    var affiliate: SmallSchool
    
    init(name: String, affiliate: SmallSchool) {
        self.name = name
        self.affiliate = affiliate
    }
}

class SmallSchool {
    var classMember: Person
    init(classMember: Person) {
        self.classMember = classMember
    }
}

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

// 예전방식으로 구현하려고 한다면========
//class Person: NSObject {
//    @objc var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
// ==============================

let person1 = Person(name: "홍길동")
let smallSchool1 = SmallSchool(classMember: person1)
let school1 = School(name: "슈퍼고", affiliate: smallSchool1)

// 만약에 접근하기위해, 써야하는 코드가 늘어난다면...
let gildogsName = school1.affiliate.classMember.name
```
## 결론 - Swift5의 방식 (Swift5 - keyPath 표현식)
```swift
// 스위프트5의 방식

let namePath = \School.affiliate.classMember.name      // 미리 경로를 지정 (keyPath)

school1[keyPath: namePath]     // 딕셔너리방식(서브스크립트)로 접근



/**================================================================================
 keyPath 타입 (외울 필요 없음)
 - AnyKeyPath                             : 어떤 속성인지 특정되지 않음(보통, 함수 파라미터형식으로만 사용)
 - PartialKeyPath<Root>                   : 타입에 대한 키패스(예를 들어 배열 같은 것으로 묶을때 사용)
 - KeyPath<Root, Value>                   : 타입과 (읽기)속성에 대한 키패스(구조체)
 - WritableKeyPath<Root, Value>           : 타입과 읽기/쓰기 가능한 속성에 대한 키패스(구조체)
 - ReferenceWritableKeyPath<Root, Value>  : 클래스의 타입과 읽기/쓰기 가능한 속성에 대한 키패스
===================================================================================**/
```
## 예전 버전, 그리고 Objective-C의 방식 - #keyPath(타입.속성)방식
```swift
/**==============================================
 - NSObject클래스를 상속해야함(구조체 지원 안함)
 - NSObject에 value(forKey:)메서드가 구현이 되어있기 때문
 - 속성에도 @objc를 붙여야함
 
 - 사용시, 구체적타입으로 다시 타입캐스팅해서 사용해야함
================================================**/
//let person2 = Person(name: "임꺽정")
//person2.name
//
//
//let gjName = person2.value(forKey: "name") as? String
//let gjName2 = person2.value(forKeyPath: #keyPath(Person.name)) as? String
//
//
//let path = #keyPath(Person.name)
//let gjName3 = person2.value(forKeyPath: path) as? String
```
