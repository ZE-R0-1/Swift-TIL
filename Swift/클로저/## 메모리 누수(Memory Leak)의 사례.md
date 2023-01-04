## 메모리 누수(Memory Leak)의 사례
### 강한참조 사이클로 인한 메모리누수의 사례
```javascript
class Dog {
    var name = "초코"    
    var run: (() -> Void)?    
    func walk() {
        print("\(self.name)가 걷는다.")
    }    
    func saveClosure() {
        // 클로저를 인스턴스의 변수에 저장
        run = {
            print("\(self.name)가 뛴다.")
        }
    }    
    deinit {
        print("\(self.name) 메모리 해제")
    }
}
func doSomething() {
    let choco: Dog? = Dog()
    choco?.saveClosure()       // 강한 참조사이클 일어남 (메모리 누수가 일어남)
}
doSomething()
```
## Reference
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8/dashboard)
