## 문자열 보간법(String Interpolation)
### 문자열 보간법의 동작원리
---
[String Interpolation(스트링 인터폴레이션)]
 - 문자열 내에서  "\(표현식 등)"
 - 상수, 변수, 리터럴값, 그리고 표현식의 값을 표현가능

---
```javascript
let name = "유나"
//print("브레이브걸스: \(name)")


let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
//print(message)
```
### 문자열 내에서 "\( )"의 동작 원리는 뭘까?
```javascript
// 그렇다면, 클래스나 구조체는?

struct Dog {
    var name: String
    var weight: Double
}

let dog = Dog(name: "초코", weight: 15.0)
print("\(dog)")      // Dog(name: "초코", weight: 15.0)  출력 형태를 애플이 지정해 놓음
print(dog)
```
### 문자열 보간법 사용시, 출력 형태(방법)을 직접 구현도 가능
---
[애플이 미리 만들어 놓은 프로토콜]
 - 아래의 프로토콜을 채택해서 구현하면 스트링 인터폴레이션을 직접구현 가능
 
   protocol CustomStringConvertible {
      var description { get }
   }

---
```javascript
//extension Dog: CustomStringConvertible {
//    var description: String {
//        return "강아지의 이름은 \(name)이고, 몸무게는 \(weight)kg 입니다."
//    }
//}



// 강아지의 이름은 초코이고, 몸무게는 15.0입니다.



/**=====================================
- \( ) ====> description 변수를 읽는 것
========================================**/
```
### Swift5에서의 문자열 보간법의 동작원리
```javascript
struct Point {
    let x: Int
    let y: Int
}


let p = Point(x: 5, y: 7)
print("\(p)")


extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Point) {
        appendInterpolation("X좌표는 \(value.x), Y좌표는 \(value.y)입니다.")
    }
}



print("\(p)")


// X좌표는 5, Y좌표는 7입니다.


/**=====================================
- \( ) ====> appendInterpolation()을 실행
========================================**/
```
### 메서드로 바뀌면서 활용도가 높아짐 (다른 파라미터 지정도 가능)
```javascript
extension String.StringInterpolation {

    mutating func appendInterpolation(_ value: Point, style: NumberFormatter.Style) {
        
        // "숫자" <====> "문자" 변환을 다루는 객체
        let formatter = NumberFormatter()
        formatter.numberStyle = style

        // 지정된 스타일로 문자열을 구성
        if let x = formatter.string(for: value.x), let y = formatter.string(for: value.y) {
            appendInterpolation("X좌표는 \(x) x Y좌표는 \(y)")
        }else  {
            appendInterpolation("X좌표는\(value.x) x Y좌표는\(value.y)")
        }
    }
    
    mutating func appendInterpolation(_ value: Dog) {
        appendInterpolation("강아지의 이름은 \(value.name)이고, 몸무게는 \(value.weight)입니다.")
    }
}


print("\(p)")

print("\(p, style: .spellOut)")     // X좌표는 five x Y좌표는 seven

print("\(p, style: .percent)")      // X좌표는 500% x Y좌표는 700%

print("\(p, style: .scientific)")   // X좌표는 5E0 x Y좌표는 7E0

//print("\(p, style: .currency)")


/**=============================================
- \( , style: ) ====> appendInterpolation(_:,style:)을 실행
================================================**/


/**===================================
(참고용) NumberFormatter.Style 열거형으로 정의

  enum Style : UInt {
      case none = 0
      case decimal = 1
      case currency = 2
      case percent = 3
      case scientific = 4
      case spellOut = 5
      case ordinal = 6
      case currencyISOCode = 8
      case currencyPlural = 9
      case currencyAccounting = 10
  }
=====================================**/
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
