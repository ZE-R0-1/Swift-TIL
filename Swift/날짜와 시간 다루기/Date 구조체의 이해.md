## 날짜와 시간 다루기
### UTC시간의 이해
---
 - 참고 https://www.youtube.com/watch?v=ZrOucWTqFA4

 - UTC (Coordinated Universal Time) - 협정 세계시 (원자시계기준 오차 없음)
 - 국제적인 표준 시간의 기준 / 국제 사회가 사용하는 과학적 시간의 표준 / 기존 평균태양시인 그리니치 표준시(GMT)를 대체하여 사용
   (일반적으로 GMT시간과 UTC시간을 혼용해서 사용)
   영국, 런던의 그리니치 천문대의 시간을 기준으로하는 시간
 
 - 우리나라(한국)는 런던을 기준으로 + 9시간 (빠름)

 - 우리나라
   UTC + 9  (영국기준 9시간이 빠르다) (우리나라, 일본, 러시아, 인도네시아)  "아침의 나라"
   예시) 영국 오전 3시 ====> 우리나라 오후 12시 (9시간이 더 빠른 시간) (점심)

 - 뉴욕
   UTC - 5  (영국기준 5시간이 느리다)
   예시) 영국 오전 3시 ====> 뉴욕 (전날) 오후 10시 (5시간이 더 느린 시간) (저녁)

 - 미국(5), 러시아(11) 같은 영토가 넓은 나라는 여러개의 표준시를 사용 (그러나, 중국은 1개의 표준시만 사용)

---
## Date 구조체의 이해
### 스위프트에서 기본으로 제공해주는 날짜다루는 Date 구조체 타입
```javascript
// 특정한 시점의 시간
// 특정 달력(양력, 음력, ...)이나 타임존에 영향을 받지않는 독립적인 시간



// 날짜와 시간을 다루는 Date 구조체의 인스턴스
let now = Date()    // 생성시점의 날짜와 시간을 생성해서 (기준시간으로부터) 초단위 기준값을 가지고 있음 ⭐️
print(now)          // 그냥 출력하면 항상 UTC기준의 시간으로 출력




// 내부적으로 시간을 어떻게 저장할까?

now.timeIntervalSinceReferenceDate
// 기준시간(Reference Time)이 있고, 그 시간을 기준, 초단위를 기준으로 저장
// 2001.1.1. 00:00:00 UTC시간을 기준


//now.timeIntervalSince1970
//(예전에는 1970.1.1. 00:00:00 UTC시간을 기준으로 사용)


//let oneSecond = TimeInterval(1.0)    // 1초 간격
//TimeInterval(<#T##other: Float##Float#>)


/**============================================
 - 60초(1분) * 60분(1시간) * 24시간 = 하루를 초기준으로
 - 1) 3600초 (1시간)
 - 2) 3600 * 24 = 86,400 초 (하루)
===============================================**/


let yesterday = now - 86400
print(yesterday)


now.timeIntervalSince(yesterday)    // 해당 시점으로부터 차이를 초로 (86,400초 차이)
now.distance(to: yesterday)         // 지금시점을 기준으로 그 시간까지의 거리를 초로
yesterday.distance(to: now)


now.advanced(by: 86400)             // 내일
now.addingTimeInterval(3600 * 24)
now + 86400



//let tomorrow = Date(timeIntervalSinceNow: 86400)
```
---
 - 날짜를 제대로 다루려면?

 - 1) 달력을 다루는 Calendar 구조체의 도움도 필요 (양력, 음력인지)
      참고 https://developer.apple.com/documentation/foundation/calendar/identifier
 - 2) 문자열로 변형해주는 DateFormatter 클래스의 도움도 필요
 
 - * 기본적으로 지역/타임존의 영향이 있음

---
```javascript
// 스위프트 내부에 미리 정의된 타임존 확인해보기

//for localeName in TimeZone.knownTimeZoneIdentifiers {
//    print(localeName)
//}

//TimeZone.current
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
