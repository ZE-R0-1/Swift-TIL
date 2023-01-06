## 큐(Queue/대기열)의 종류
### 1)메인큐
```javascript
//메인큐 = 메인쓰레드("쓰레드1번"을 의미), 한개뿐이고 Serial큐

let mainQueue = DispatchQueue.main
```
### 2) 글로벌큐
```javascript
// 6가지의 Qos를 가지고 있는 글로벌(전역) 대기열

let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
let userInitiatedQueue = DispatchQueue.global(qos: .userInitiated)
let defaultQueue = DispatchQueue.global()  // 디폴트 글로벌큐
let utilityQueue = DispatchQueue.global(qos: .utility)
let backgroundQueue = DispatchQueue.global(qos: .background)
let unspecifiedQueue = DispatchQueue.global(qos: .unspecified)
```
### 3) 프라이빗(커스텀)큐
```javascript
//기본적인 설정은 Serial, 다만 Concurrent설정도 가능

let privateQueue = DispatchQueue(label: "com.inflearn.serial")

sleep(5)

PlaygroundPage.current.finishExecution()
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
