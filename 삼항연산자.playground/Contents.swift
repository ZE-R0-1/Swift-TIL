import UIKit

var a = 10

if a > 12 {
    print("1")
} else {
    print("2")
}

// 3항 연산자
// 조건에 따라 선택이 두가지인 경우 > 삼항연산자
a > 12 ? print("1") : print("2")

var name = a > 12 ? "스티브" : "팀쿡"

if a > 12 {
    name = "스티브"
} else {
    name = "팀쿡"
}
