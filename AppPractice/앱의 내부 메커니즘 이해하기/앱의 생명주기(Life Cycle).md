# 앱의 생명주기의 컨셉 이해하기
### 앱의 생명 주기란 개념이 왜 필요할까?
- 아이폰 앱 게임 중 > 전화 옴 > 앱은 자동으로 **"통화화면으로"** 전환(실행중이던 앱은? 잠시 비활성화 상태로..)
- 게임 중이던 모든 데이터는? 저장이 안되서 날아갈 수도 있음
- 앱의 실행(메모리에 올라감)부터 > 앱이 백그라운드로 / 앱의 종료까지를 포괄적으로 표현하는 개념
- **앱의 실행이 시작되서, 앱이 종료(메모리에서 내려감)되기까지의 주기가 존재**
- 실제로는 단순하지는 않음(여러 단계가 존재)
- (상태 변화의) 해당 시점에 호출되는 함수들이 있음
- 예시) 앱이 실행중이다가, 다른 앱으로 전환되는 시점에 **(특정) 함수가 호출됨**
- 내부적인 메커니즘(특정 시점에 특점 함수가 호출)이 있기 때문에, 앱이 얘기치 않게 종료되는 시점 등 적절한 시점(함수 호출)에 잘 사용하면, 데이터를 앱에 저장한다던지 / 서버에 저장한다던지.. 등 앱의 사용성을 잘 관리할 
- 예시) 인스타그램 포스트 작성 중에, 전화가 걸려오면 데이터 중간 저장 필요, 음악 플레이 중에 전화가 걸려오면, 볼륨 줄이고, 음악 멈추기...
- https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle
- 참고(WWDC): https://developer.apple.com/videos/play/wwdc2019/258/ (앱의 생명주기/씬의 생명주기)
### AppDelegate.swift
- 앱의 대리자 역할/기존 델리게이트 패턴과 살짝 다름 - 앱이 동작하다(전화와서) 멈추거나, 그런 시점들을 파악하기 위한 대리자
- Not running(앱 실행전)) > Foreground(화면을 점유)) > Background(화면을 점유하지 않은 상태) > Suspended(대기상태)
- Not running을 제외하고 아직 메모리에 올라가 있는 상태
### SceneDelegate.swift
- sceneDidBecomeActive
- sceneWillResignActive
- sceneWillEnterForeground
- sceneDidEnterBackground
- sceneDidDisconnect
