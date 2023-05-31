## Swift API Availability
```swift
// 새로운 업데이트 사항에 따라서, iOS 예전버전에서는 코드로 인해 크래시가 발생할 수 있음
// 그래서 해당 코드에 대해 어떤 버전이상만 적용가능하다는 힌트를 컴파일러에 주는 것

// @available은 타입 또는 메서드에 붙일때
// #available는 조건문에서 사용

@available(iOS 11.0, *)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @available(iOS 11.0, *)
    func doSomething() {
        // (if, while, guard문으로도 사용 가능)
        if #available(iOS 11.0, *) {
            // iOS 11버전이상인 경우 적용 시킬 코드를 작성
            
        } else {
            // iOS 11버전미만인 경우 적용 시킬 코드를 작성
        }
        
    }

}



/**==============================
 (참고) iOS 등버전, Swift버전에 따라
 - iOS
 - iOSApplicationExtension
 - macOS
 - macOSApplicationExtension
 - watchOS
 - watchOSApplicationExtension
 - tvOS
 - tvOSApplicationExtension
 - swift
 ================================**/
// 참고: https://nshipster.com/available/
```
