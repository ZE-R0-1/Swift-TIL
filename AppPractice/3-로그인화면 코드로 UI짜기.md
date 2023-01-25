# 로그인화면 코드로 UI짜기
## 텍스트필드의 직접적인 사용 / 텍스트필드 프로토콜 함수의 로직 구성
- 이메일 입력하는 텍스트 뷰
  - "이메일 또는 전화번호" 안내문구
  - 로그인 - 이메일 입력 필드
- 비밀번호 입력하는 텍스트 뷰
  - 패스워드텍스트필드의 안내문구
  - 로그인 - 비밀번호 입력 필드
  - 패스워드에 "표시"버튼 비밀번호 가리기 기능
- 로그인버튼
  - 이메일텍스트필드, 패스워드, 로그인버튼 스택뷰에 배치
  - 비밀번호 재설정 버튼
  - 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
  - 오토레이아웃 향후 변경을 위한 변수(애니메이션)
  - 셋팅
  - 오토레이아웃
- 비밀번호 가리기 모드 켜고 끄기
  - 로그인 버튼 누르면 동작하는 함수
  - 리셋버튼이 눌리면 동작하는 함수
  - 앱의 화면을 터치하면 동작하는 함수
- 텍스트필드 편집 시작할때의 설정 - 문구가 위로올라가면서 크기 작아지고, 오토레이아웃 업데이트
  - 텍스트필드 편집 종료되면 백그라운드 색 변경 (글자가 한개도 입력 안되었을때는 되돌리기)
- 이메일텍스트필드, 비밀번호 텍스트필드 두가지 다 채워져 있을때, 로그인 버튼 빨간색으로 변경
  - 엔터 누르면 일단 키보드 내림
## 얼럿(alert) 사용법
```swift
@objc func resetButtonTapped() {
        //만들기
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼이 눌렸습니다.")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소버튼이 눌렸습니다.")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 실제 띄우기
        self.present(alert, animated: true, completion: nil)
    }
```
## 애니메이션 (오토레이아웃의 동적 변경)
```swift
    // 오토레이아웃 향후 변경을 위한 변수(애니메이션)
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2972877622, green: 0.2973434925, blue: 0.297280401, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2972877622, green: 0.2973434925, blue: 0.297280401, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            passwordInfoLabelCenterYConstraint.constant = -13
        }
        
        // 실제 레이아웃 변경은 애니메이션으로 줄꺼야
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
```
## Reference 
[앨런 Swift문법 마스터 스쿨](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8-%EC%95%B1%EB%A7%8C%EB%93%A4%EA%B8%B0)
