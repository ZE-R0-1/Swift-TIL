## 2) While문
### While문의 기본 형태
```javascript
var sum = 0
var num = 1
while num <= 50 {   // 조건이 만족하는 동안 계속 반복
    sum += num
    num += 1      // 이런 조건이 필요 (위의 조건식을 변화시키지 않으면 무한 반복하게됨)
}
print("총 합의 출력: ", sum)
// 조건을 주의해서 짜야함
```
무한반복(루프)을 주의
---
for문과 비교
1) 반복이 시작되기 전에, 반복 횟수가 정해져 있지 않을때 사용 (조건에 의해 반복)
2) 조건이 거짓이 될 때까지 일련의 명령문 수행
(반드시 while문 내부에서 조건을 변화시키는 일이 일어나야함)
---
## 3) repeat-While문
### repeat-While문의 기본 형태
```javascript
var i = 1

repeat {
    print("\(3) * \(i) = \(3 * i)")
    i += 1
} while i <= 9
// 일단 한번은 실행하고 나서, 조건을 판단해서 실행
// (조건(컨디션)이 마지막에 있음)
// 루프를 통과하는 각 패스의 끝 부분에서 조건을 평가
```
### while문과 repeat-While문의 차이
```javascript
var number = 5
var sumOfNum = 0
while number < 5 {
    sumOfNum += number
    number += 1
}
number      // 5
sumOfNum    // 0

// repeat-while문은 코드를 먼저 실행한 다음 조건을 확인
number = 5
sumOfNum = 0
repeat {
    sumOfNum += number
    number += 1
} while number < 5
number      // 6
sumOfNum    // 5
```
# 제어전송문
### 반복문에서 쓰이는 제어전송문(Control Transfer Statement)
## 1) continue
```javascript
for num in 1...20 {
    if num % 2 == 0 {   // num 2의 배수
        continue
    }
    print(num)
}
```
## 2) break
```javascript
for num in 1...20 {
    if num % 2 == 0 {
        break
    }
    print(num)
}
```
### 주의할점 - 중첩 사용시의 적용 범위
```javascript
for i in 0...3 {
    print("OUTER \(i)")
    for j in 0...3 {
        if i > 1 {
            print("  j :", j)
            continue
            //break
        }
        print("  INNER \(j)")
    }
}
// 가장 인접한 범위의 반복문에 여향을 미침
```
## 3) Labeled Statements
### 레이블이 매겨진 문장(Labeled Statements)과 continue, break의 사용
```javascript
OUTER: for i in 0...3 {
    print("OUTER \(i)")
    INNER: for j in 0...3 {
        if i > 1 {
            print("  j :", j)
            continue OUTER
            //break OUTER
        }
        print("  INNER \(j)")
    }  
}
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
