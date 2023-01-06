## UI업데이트는 메인쓰레드에서
### 유저인터페이스(즉, 화면)와 관련된 작업은 메인쓰레드에서 진행해야 함
```javascript
var imageView: UIImageView? = nil

let url = URL(string: "https://bit.ly/32ps0DI")!

// URL세션은 내부적으로 비동기로 처리된 함수임.
URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    if error != nil{
        print("에러있음")
    }
    
    guard let imageData = data else { return }
    
    // 즉, 데이터를 가지고 이미지로 변형하는 코드
    let photoImage = UIImage(data: imageData)
    
    // 🎾 이미지 표시는 DispatchQueue.main에서 🎾
    DispatchQueue.main.async {
        imageView?.image = photoImage
    }
    
    
}.resume()
```
UI와 관련된 일은 다시 메인쓰레드로 보내야 함
```javascript
DispatchQueue.global().async {
    
    // 비동기적인 작업들 ===> 네트워크 통신 (데이터 다운로드)
    
    DispatchQueue.main.async {
        // UI와 관련된 작업은 
    }
}

sleep(4)

PlaygroundPage.current.finishExecution()
```
## 올바른 비동기함수의 설계
### 리턴(return)이 아닌 콜백함수를 통해, 끝나는 시점을 알려줘야 한다.
함수(메서드)를 아래처럼 설계하면 절대 안된다.
```javascript
func getImages(with urlString: String) -> UIImage? {
    
    let url = URL(string: urlString)!
    
    var photoImage: UIImage? = nil
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error != nil {
            print("에러있음: \(error!)")
        }
        // 옵셔널 바인딩
        guard let imageData = data else { return }
        
        // 데이터를 UIImage 타입으로 변형
        photoImage = UIImage(data: imageData)
        
    }.resume()

    return photoImage    // 항상 nil 이 나옴
}

getImages(with: "https://bit.ly/32ps0DI")    // 무조건 nil로 리턴함 ⭐️
```
올바른 함수(메서드)의 설계 - 콜백함수의 사용법
```javascript
func properlyGetImages(with urlString: String, completionHandler: @escaping (UIImage?) -> Void) {
    
    let url = URL(string: urlString)!
    
    var photoImage: UIImage? = nil
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if error != nil {
            print("에러있음: \(error!)")
        }
        // 옵셔널 바인딩
        guard let imageData = data else { return }
        
        // 데이터를 UIImage 타입으로 변형
        photoImage = UIImage(data: imageData)
        
        completionHandler(photoImage)
        
    }.resume()
    
}

// 올바르게 설계한 함수 실행
properlyGetImages(with: "https://bit.ly/32ps0DI") { (image) in
    
    // 처리 관련 코드 넣는 곳...
    
    DispatchQueue.main.async {
        // UI관련작업의 처리는 여기서
    }
    
}

sleep(5)

PlaygroundPage.current.finishExecution()
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
