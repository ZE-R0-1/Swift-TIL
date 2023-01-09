## Calendar 구조체의 이해
### 스위프트에서 기본으로 제공해주는, 달력(Calendar) 구조체 타입
```javascript
// "절대 시점(Date)"을 연대/연도/날짜/요일과 같은 "달력의 요소"로 변환을 돕는 객체 ⭐️


// 그레고리력 (Gregorian calendar) - 양력 (전세계표준 달력)
var calendar = Calendar.current   // 타입 속성 ==> 현재의 달력(양력) 반환
```
---
let calendar1 = Calendar(identifier: .gregorian)  // 직접 생성하기 (이런 방식으로 잘 사용하지는 않음)
let calendar2 = Calendar.autoupdatingCurrent      // 유저가 선택한 달력 기준(세계적 서비스를 한다면)

---
### 지역설정 ➡︎ 나라(지역)마다 날짜와 시간을 표시하는 형식과 언어가 다름
```javascript
calendar.locale    // 달력의 지역 (영어/한국어) (달력 표기 방법과 관련된 개념)
calendar.timeZone  // 타임존 ==> Asia/Seoul (UTC 시간관련된 개념)



// 필요할때 찾아서 쓰면됨
calendar.locale = Locale(identifier: "ko_KR")
//calendar.timeZone = TimeZone(identifier: "Asia/Seoul")
```
---
 - 지역설정 문자열: https://gist.github.com/xta/6e9b63db1fa662bb3910b680f9ebd458  (700여개)
 - 타임존 문자열: https://gist.github.com/mhijack/2b63b84d96802ccc719291474ac9df72 (440여개)

---
```javascript
let now = Date()

// (원하는)요소로 요소화 시키는 메서드(타입 알려주면 그것을 정수로 반환)
```
### Date의 "년/월/일/시/분/초"를 확인하는 방법
```javascript
// 1) 날짜 - 년 / 월 / 일
let year: Int = calendar.component(.year, from: now)
let month: Int = calendar.component(.month, from: now)
let day: Int = calendar.component(.day, from: now)


// 2) 시간 - 시 / 분 / 초
let timeHour: Int = calendar.component(.hour, from: now)
let timeMinute: Int = calendar.component(.minute, from: now)
let timeSecond: Int = calendar.component(.second, from: now)


// 실제 앱에서 표시할때는 위와 같은 식으로 분리해서, 레이블(Label)에 표시 가능



// 3) 요일
let weekday: Int = calendar.component(.weekday, from: now)

// 일요일 - 1
// 월요일 - 2
// 화요일 - 3
// ...
// 토요일 - 7

// 참고
// https://developer.apple.com/documentation/foundation/calendar/component/weekday
```
### Date는 Calendar(양력)의 도움을 받아야 여러가지로 활용가능
```javascript
print("\(year)년 \(month)월 \(day)일")

// 실제로 이렇게 사용하진 않고, 뒤에서 배울 DateFormatter로 활용 가능
```
### 하나의 요소가 아닌 여러개의 데이터를 얻는 방법은? (DateComponents)
```javascript
let myCal = Calendar.current


var myDateCom = myCal.dateComponents([.year, .month, .day], from: now)
//myCal.dateComponents(components: Set<Calendar.Component>, from: Date)

myDateCom.year
myDateCom.month
myDateCom.day


print("\(myDateCom.year!)년 \(myDateCom.month!)월 \(myDateCom.day!)일")
```
## 실제 프로젝트에서 활용 방식
### 달력을 기준으로, 나이계산 하기
```javascript
class Dog {
    var name: String
    var yearOfBirth: Int
    
    init(name: String, year: Int) {
        self.name = name
        self.yearOfBirth = year
    }
    
    // 나이를 계산하는 계산 속성
    var age: Int {
        get {
            let now = Date()
            let year = Calendar.current.component(.year, from: now)
            return year - yearOfBirth
        }
    }
}


let choco = Dog(name: "초코", year: 2015)
choco.age
```
### 열거형으로 요일을 만들고, 오늘의 요일을 계산하기
```javascript
// (원시값)열거형으로 선언된 요일
enum Weekday: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    // ⭐️ 타입 계산속성
    static var today: Weekday {
        let weekday: Int = Calendar.current.component(.weekday, from: Date())  // 요일을 나타내는 정수
        return Weekday(rawValue: weekday)!
    }
}




// 오늘이 무슨요일인지
let today = Weekday.today
```
### 두 날짜 사이의 일수 계산하기
```javascript
let startDate = Date()
let endDate = startDate.addingTimeInterval(3600 * 24 * 60)

let calendar2 = Calendar.current
let someDays = calendar2.dateComponents([.day], from: startDate, to: endDate).day!

print("\(someDays)일 후")
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
