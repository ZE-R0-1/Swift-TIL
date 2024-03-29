# 앱 만들기의 접근법
**첫번째 앱만들기 / 접근 방식 깨닫기**
## 앱 만들기를 어떻게 접근할 것인가
- 문제 / 해결
## 모르는 것을 어떻게 찾아서 사용할 것인가 / 코드 복사해서 사용하는 법
- 구글링
- how to play sound in swift
- how to change buttion label in swift
- how to implement tableview in swift
- stackoverflow(코드복사)
- 블로그
## 공식문서 보는 법
https://developer.apple.com/documentation/
## 타이머 구현하기 / 셀렉터(selector) 사용법
```javascript
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈때마다 무언가를 실행
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, 
                                    selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        }
    
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            number -= 1
            slider.value = Float(number) / Float(60)
            mainLabel.text = "\(number)초"
           
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            timer?.invalidate()
            // 소리를 나게 해야됨
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
```
## 선 그리기 (UIView)
UIView를 생성 후 높이를 1로 설정한다
## 사운드 플레이(앱에서 소리내는 법)
```javascript
// 소리를 나게 해야됨
AudioServicesPlayAlertSound(SystemSoundID(1322))
```
## Reference 
[Inflearn - 앨런 swift 문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8-%EC%95%B1%EB%A7%8C%EB%93%A4%EA%B8%B0)
