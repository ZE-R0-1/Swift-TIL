# 뷰컨트롤러의 생명주기(Life Cycle)
### 뷰 컨트롤러의 생명 주기의 컨셉 이해하기
- **뷰 컨트롤러의 생명 주기란 개념이 왜 필요할까?**
- **viewDidLoad()** (앱의 화면에 들어오면, 가장 먼저 실행시키는 함수)
- **내부적인 메커니즘** (운영체제에 의해서, 자동으로 호출되는 함수들이 있음))
- 앱의 실행중 화면이 감춰졌다가(다음 화면으로 넘어갔다가), 화면이 다시 보이기도 함
- 예시) 다음화면으로 갔다가 다시 돌아오면, (변경사항 업데이트를 위해) 서버에서 데이터를 다시 받아와야할 수도 있음
### (화면의 전환) 해당 시점에 호출되는 함수들이 있음
- loadView(뷰가 바꿀 수 있는 시점/코드로 뷰를 짠다면)
- viewDidLoad(뷰가 생성되었을때 한번만 호출)
- viewWillAppear(실제 스크린에 뷰가 나타나기 전에 호출)
- viewDidAppear(실제 스크린 뷰가 나타난 후에 호출)
- viewWillDisappear(실제 스크린에 뷰가 사라지기 전에 호출)
- viewDidDisappear(실제 스크린에 뷰가 사라진 후에 호출/메모리에서 없어진 것은 아님)
