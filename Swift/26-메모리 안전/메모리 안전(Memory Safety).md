## 메모리 접근에 대한 충돌(confilct) 이해하기
**멀티쓰레드(Multi Thread)의 환경에서만 메모리 충돌이 일어나는건 아님**
```swift
var stepConflict = 1


// 변수 stepConfilt에 장기적인 쓰기 접근 (입출력 파라미터)
func increment(_ number: inout Int) {
    number += stepConflict    // 변수 stepConfilt에 읽기 접근  // number = number + stepConflict
}

//increment(&stepConflict)   // 메모리에 동시접근으로 인한 문제 발생가능





/**=================================
 - 위와 같은 문제는 다른 변수를 만들어서 해결
 ===================================**/


var stepSize = 1
var copyOfStepSize = stepSize    // 명시적으로 복사본 변수를 만들어서 해결


// 변수 stepSize에 장기적인 쓰기 접근 (입출력 파라미터)
func incrementing(_ number: inout Int) {
    number += stepSize         // 변수 stepSize에 읽기 접근       // number = number + stepSize
}



incrementing(&copyOfStepSize)


// 원본을 다시 바꾸기 ⭐️
stepSize = copyOfStepSize
```
## 동일한 함수의 여러 '입-출력 매개변수'로 단일 변수를 전달하는 것도 에러
```swift
func balance(_ x: inout Int, _ y: inout Int) {  // 평균값 설정하는 함수
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore = 42
var playerTwoScore = 30


// 입출력 파라미터로 동일한 변수를 전달하고 있음
//balance(&playerOneScore, &playerOneScore)   // 에러 발생 ⭐️


balance(&playerOneScore, &playerTwoScore)   // 에러 발생하지 않음
```
