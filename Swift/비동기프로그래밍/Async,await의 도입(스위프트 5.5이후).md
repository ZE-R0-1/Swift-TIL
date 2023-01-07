### 작업을 오랫동안 실행하는 비동기 함수가 있다고 가정
```javascript
func longtimePrint(completion: @escaping (Int) -> Void) {
    DispatchQueue.global().async {
        print("프린트 - 1")
        sleep(1)
        print("프린트 - 2")
        sleep(1)
        print("프린트 - 3")
        sleep(1)
        print("프린트 - 4")
        sleep(1)
        print("프린트 - 5")
        completion(7)
    }
}
```
## Async/await의 도입
### Swift 5.5버전 이후 ~
콜백함수 처리방식의 단점
```javascript
// 여러개의 비동기함수를 이어서 처리할때, 코드의 처리가 불편
// 비동기함수의 일이 종료되는 시점을 연결하기 위해, 끊임없는 콜백함수의 연결이 필요
// 코드는 계속 들여쓰기.. 들여쓰기.. 들여쓰기..

func linkedPrint(completion: @escaping (Int) -> Void) {
    longtimePrint { num in
        // 코드처리
        longtimePrint { num in
            // 코드처리
            longtimePrint { num in
                // 코드처리
                longtimePrint { num in
                    // 코드처리
                    completion(num)    // 모든 비동기함수의 종료시점을 알려줌
                }
            }
        }
    }
}
```
Async/await 방식의 도입 / Swift 5.5 ~
```javascript
// 콜백함수를 계속 들여쓰기 할 필요없이 반환시점을 기다릴수 있어, 깔끔한 코드의 처리가 가능
// Async/await 함수의 설계
// 내부에 따로 DispatchQueue로 보낼 필요는 없음
//func longtimeAsyncAwait() async -> Int {
//    print("프린트 - 1")
//    sleep(1)
//    print("프린트 - 2")
//    sleep(1)
//    print("프린트 - 3")
//    sleep(1)
//    print("프린트 - 4")
//    sleep(1)
//    print("프린트 - 5")
//    return 7
//}

// Async/await 함수의 사용

//func linkedPrint2() async -> Int {
//    _ = await longtimeAsyncAwait()
//    _ = await longtimeAsyncAwait()
//    _ = await longtimeAsyncAwait()
//    _ = await longtimeAsyncAwait()
//    return 7
//}

sleep(7)
PlaygroundPage.current.finishExecution()

//참고 https://github.com/apple/swift-evolution/blob/main/proposals/0296-async-await.md
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
