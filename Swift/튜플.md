# 튜플
## 1) 튜플(Tuples)
### 2개이상의 연관된 데이터(값)를 저장하는 Compound(복합/혼합) 타입
```javascript
let twoNumbers: (Int, Int) = (1, 2)
type(of: twoNumbers)    // (Int, Int).Type
let threeNumbers= (1, 2, 5)
type(of: twoNumbers)    // (Int, Int, Int).Type
let twoNumbers= ("홍길동", 20, "서울")
type(of: twoNumbers)    // (String, Int, String).Type
```
### 연관된 값(튜플)의 각각의 데이터 접근
```javascript
threeValues.0   // 홍길동
threeValues.1   // 20
threeValues.2   // 서울
```
### Named Typle(이름이 매겨진 튜플)
```javascript
let iOS = (language: "Swift", version: "5")
iOS.0         // Swift
iOS.1         // 5
iOS.language  // Swift
iOS.version   // 5
```
### 튜플의 분해(Decomposition)
```javascript
let (first, second, third) = threeNumbers
print(first)  // 1
print(second) // 2
print(third)  // 5
```
### 튜플의 값의 비교
```javascript
// 두개의 튜플 비교 가능 > 왼쪽 멤버부터 하나씩 비교하고, 같을 경우 다음 멤버를 비교
// 튜플은 최대 7개 요소 미만만 비교 가능
(1, "zebra") < (2, "apple") // true, 1 < 2
(3, "apple") < (3, "bird") // true, 3 == 3; a < b;
(4, "dog") == (4, "dog") // true
("blue", 1) < ("purple", 1) // true, b < p
("blue", false) < ("blue", true) // 에러, Bool 비교불가능
```
## 2) 튜플과 switch문
### 튜플의 매칭(Mathching)
```javascript
let iOs = (language: "Swift", version: "5")
if iOS.0 == "Swift" && iOS.1 == 5 {
  print("스위프트 버전 5입니다.")    // 스위프트 버전 5입니다.
}
if iOS == ("Swift", "5") {
  print("스위프트 버전 5입니다.")    // 스위프트 버전 5입니다.
}
switch iOS {
case ("Swift", "5"):
  print("스위프트 버전 5입니다.")    // 스위프트 버전 5입니다.
case ("Swift", "4"):
  print("스위프트 버전 4입니다.")  
default:
  break
}
```
### 튜플의 활용
```javascript
// 튜플의 바인딩
var coordinate = (0, 5) // 좌표
switch coordinate {
case (let distance, 0), (0, let distance):
  print("X 또는 Y축 위에 위치하며, \(distance)만큼의 거리가 떨어져 있음")
  // X 또는 Y축 위에 위치하며, 5만큼의 거리가 떨어져 있음
default:
  print("축 위에 있지 않음")
}
// 튜플의 where절 활용
coordinate = (5, 0)
switch coordinate {
case (let x, let y) where x == y:
  print("\(x), \(y)의 좌표는 y = x 1차함수의 그래프 위에 있다.")
case let (x, y) where x == -y:
  print("\(x), \(y)의 좌표는 y = -x 1차함수의 그래프 위에 있다.")
case let (x, y):
  print("\(x), \(y)의 좌표는 y = x 또는 y = -x 그래프가 아닌 임의의 점 위에 있다.")
  // (5, 0)의 좌표는 y = x 또는 y = -x 그래프가 아닌 임의의 점 위에 있다.
}
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
