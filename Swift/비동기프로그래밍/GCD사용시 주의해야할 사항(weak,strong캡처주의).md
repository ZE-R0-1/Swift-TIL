## 클로저의 강한 참조 주의
### 강한참조의 경우 주의해서 사용해야함
```javascript
// 강한 참조가 일어나고, (서로가 서로를 가르키는) 강한 참조 사이클은 일어나지 않지만
// 생각해볼 부분이 있음


class ViewController: UIViewController {
    
    var name: String = "뷰컨"
    
    func doSomething() {
        DispatchQueue.global().async {
            sleep(3)
            print("글로벌큐에서 출력하기: \(self.name)")
        }
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


func localScopeFunction() {
    let vc = ViewController()
    vc.doSomething()
}


//localScopeFunction()

//글로벌큐에서 출력하기: 뷰컨
//뷰컨 메모리 해제
/**=======================================================
 - (글로벌큐)클로저가 강하게 캡처하기 때문에, 뷰컨트롤러의 RC가 유지되어
 - 뷰컨트롤러가 해제되었음에도, 3초뒤에 출력하고 난 후 해제됨
 - (강한 순환 참조가 일어나진 않지만, 뷰컨트롤러가 필요없음에도 오래 머무름)

 - 그리고 뷰컨트롤러가 사라졌음에도, 출력하는 일을 계속함
=========================================================**/
```
### 약한 참조
```javascript
class ViewController1: UIViewController {
    
    var name: String = "뷰컨"
    
    func doSomething() {
        // 강한 참조 사이클이 일어나지 않지만, 굳이 뷰컨트롤러를 길게 잡아둘 필요가 없다면
        // weak self로 선언
        DispatchQueue.global().async { [weak self] in
            guard let weakSelf = self else { return }
            sleep(3)
            print("글로벌큐에서 출력하기: \(weakSelf.name)")
        }
    }
    
    deinit {
        print("\(name) 메모리 해제")
    }
}


func localScopeFunction1() {
    let vc = ViewController1()
    vc.doSomething()
}


localScopeFunction1()

//뷰컨 메모리 해제
//글로벌큐에서 출력하기: nil
/**=======================================================
 - 뷰컨트롤러를 오래동안 잡아두지 않음
 - 뷰컨트롤러가 사라지면 ===> 출력하는 일을 계속하지 않도록 할 수 있음
   (if let 바인딩 또는 guard let 바인딩까지 더해서 return 가능하도록)
=========================================================**/
```
### 작업을 오랫동안 실행하는 함수가 있다고 가정
```javascript
func longtimePrint(name: String) -> String {
    print("프린트 - 1")
    sleep(1)
    print("프린트 - 2")
    sleep(1)
    print("프린트 - 3 이름:\(name)")
    sleep(1)
    print("프린트 - 4")
    sleep(1)
    print("프린트 - 5")
    return "작업 종료"
}


longtimePrint(name: "잡스")
```
## 동기함수를 비동기함수로 만들기
```javascript
// 작업을 오랫동안 실행하는데, 동기적으로 동작하는 함수를
// 비동기적으로 동작하도록 만들어, 반복적으로 사용하도록 만들기
// 내부적으로 다른 큐로 비동기적으로 보내서 처리

func asyncLongtimePrint(name: String, completion: @escaping (String) -> Void) {
    DispatchQueue.global().async {
        let n = longtimePrint(name: name)
        completion(n)
    }
}

//asyncLongtimePrint(name: "잡스", completion: <#T##(String) -> Void#>)

asyncLongtimePrint(name: "잡스") { (result) in
    print(result)
    
    // 메인쓰레드에서 처리해야하는 일이라면,
//    DispatchQueue.main.async {
//        print(result)
//    }
}

sleep(7)
PlaygroundPage.current.finishExecution()
```
## URLSession은 비동기 메서드
### API중에는 내부적으로 비동기처리가 된 메서드들이 존재
```javascript
let movieURL = "https://bit.ly/2QF3ID2"


// 1. URL 구조체 만들기
let url = URL(string: movieURL)!

// 2. URLSession 만들기 (네트워킹을 하는 객체 - 브라우저 같은 역할)
let session = URLSession.shared


// 3. 세션에 (일시정지 상태로)작업 부여
let task = session.dataTask(with: url) { (data, response, error) in
    if error != nil {
        print(error!)
        return
    }

    guard let safeData = data else {
        return
    }

    print(String(decoding: safeData, as: UTF8.self))

}

// 4.작업시작
task.resume()   // 일시정지된 상태로 작업이 시작하기 때문
```
URLSession 사용하기 ➡︎ 내부적으로 비동기 동작한다는 것을 알고 써야함
```javascript
print("출력 - 1")

URLSession.shared.dataTask(with: url) { (data, response, error) in
    if error != nil {
        print(error!)
        return
    }
    
    guard let safeData = data else {
        return
    }
    
    print(String(decoding: safeData, as: UTF8.self))
    
}.resume()

print("출력 - 2")

sleep(7)
PlaygroundPage.current.finishExecution()
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
