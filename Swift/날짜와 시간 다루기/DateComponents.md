## 실제 프로젝트에서 활용 방식
### DateComponents를 활용해, 원하는 특정날짜/시간 생성하기
```javascript
var components = DateComponents()    // 구조체 (날짜/시간의 요소들을 다룰 수 있는)
components.year = 2021
components.month = 1
components.day = 1

components.hour = 12
components.minute = 30
components.second = 0


let specifiedDate: Date = Calendar.current.date(from: components)!
print(specifiedDate)





// 조금 더 세련된 방식으로 구현
// 구조체의 확장이용해서 Date에 생성자 구현

extension Date {
    // 구조체 실패가능 생성자로 구현
    init?(y year: Int, m month: Int, d day: Int) {
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        guard let date = Calendar.current.date(from: components) else {
            return nil  // 날짜 생성할 수 없다면 nil리턴
        }
        
        self = date      //구조체이기 때문에, self에 새로운 인스턴스를 할당하는 방식으로 초기화가능
    }
}




let someDate = Date(y: 2021, m: 1, d: 1)      // 특정날짜(시점) 객체 생성
let someDate2 = Date(y: 2021, m: 7, d: 10)
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
