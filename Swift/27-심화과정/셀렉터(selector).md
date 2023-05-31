## #selector의 사용 예시
```swift
class ViewController: UIViewController {
    
    lazy var myButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MyButton", for: .normal)
        button.frame = CGRect(x: 0.0, y: self.view.frame.height - 150, width: view.frame.width, height: 50.0)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(ViewController.doSomething(_:)), for: .touchUpInside)

        // 셀렉터의 사용⭐️
        //myButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
    // 셀렉터는 오브젝티브C에서 인식할 수 있는 속성/메서드만 가르킬 수 있음
    @objc func doSomething(_ sender: Any) {

    }
}


//let someSelector = <#T##Selector#>
```
## #selector의 개념에 대한 이해
```swift
// 클래스, Objective-C 프로토콜에 포함된 멤버에만 적용가능(구조체 적용 불가)
// 내부적으로 Objective-C 프레임워크를 사용하고 있기 때문에
// @objc 특성을 추가해야지만 사용가능

class Dog {
    var num = 1.0
    
    @objc var doubleNum: Double {
        get {
            return num * 2.0
        }
        set {
            num = newValue / 2.0
        }
    }
    
    @objc func run() {
        print("강아지가 달립니다.")
    }
}


//let selector = <#T##Selector#>

// 문법적인 약속
// (계산)속성을 가르킬때
let eyesSelector = #selector(getter: Dog.doubleNum)    // 계산(읽기) 속성
let nameSelector = #selector(setter: Dog.doubleNum)    // 계산(쓰기) 속성


// 메서드를 가르킬때
let runSelector = #selector(Dog.run)
```
**셀렉터는 속성에 접근이나 메서드를 호출하는 것이 아님 ➞ 가르키기만 할뿐**
- 코드 영역의 메모리 주소를 가리켜서, (버튼이 눌렸을 때 해당 메서드를 실행시키기 위해) 연결시키는 기술
