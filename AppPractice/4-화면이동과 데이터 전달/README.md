# 앱의 화면이동 방법
### 화면이동 방법의 여러가지 방법과 데이터 전달
[1) 코드로 화면 이동](https://github.com/ZE-R0-1/Swift-TIL/blob/main/AppPractice/4-%ED%99%94%EB%A9%B4%EC%9D%B4%EB%8F%99%EA%B3%BC%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%EC%A0%84%EB%8B%AC/1.%20%EC%BD%94%EB%93%9C%EB%A1%9C%20%ED%99%94%EB%A9%B4%20%EC%9D%B4%EB%8F%99.md)  
(다음화면)뷰컨트롤러 객체생성 > present  
[2) 코드로 스토리보드 객체를 생성해서, 화면 이동](https://github.com/ZE-R0-1/Swift-TIL/blob/main/AppPractice/4-%ED%99%94%EB%A9%B4%EC%9D%B4%EB%8F%99%EA%B3%BC%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%EC%A0%84%EB%8B%AC/2.%20%EC%BD%94%EB%93%9C%EB%A1%9C%20%EC%8A%A4%ED%86%A0%EB%A6%AC%EB%B3%B4%EB%93%9C%20%EA%B0%9D%EC%B2%B4%EB%A5%BC%20%EC%83%9D%EC%84%B1%ED%95%B4%EC%84%9C%2C%20%ED%99%94%EB%A9%B4%20%EC%9D%B4%EB%8F%99.md)!!!!  
(스토리보드를 통해)뷰컨트롤러 객체 생성 > present  
[3) 스토리보드에서 화면 이동(간접 세그웨이)](https://github.com/ZE-R0-1/Swift-TIL/blob/main/AppPractice/4-%ED%99%94%EB%A9%B4%EC%9D%B4%EB%8F%99%EA%B3%BC%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%EC%A0%84%EB%8B%AC/3.%20%EC%8A%A4%ED%86%A0%EB%A6%AC%EB%B3%B4%EB%93%9C%EC%97%90%EC%84%9C%20%ED%99%94%EB%A9%B4%20%EC%9D%B4%EB%8F%99(%EA%B0%84%EC%A0%91%20%EC%84%B8%EA%B7%B8%EC%9B%A8%EC%9D%B4).md)  
Segue 만들기(스토리보드)(화면이동을 담당하는 객체) > performSegue(조건 설정 가능) > (자동호출) > prepare(데이터전달)  
[4) 스토리보드에서의 화면 이동(직접 세그웨이)](https://github.com/ZE-R0-1/Swift-TIL/blob/main/AppPractice/4-%ED%99%94%EB%A9%B4%EC%9D%B4%EB%8F%99%EA%B3%BC%20%EB%8D%B0%EC%9D%B4%ED%84%B0%20%EC%A0%84%EB%8B%AC/4.%20%EC%8A%A4%ED%86%A0%EB%A6%AC%EB%B3%B4%EB%93%9C%EC%97%90%EC%84%9C%EC%9D%98%20%ED%99%94%EB%A9%B4%20%EC%9D%B4%EB%8F%99(%EC%A7%81%EC%A0%91%20%EC%84%B8%EA%B7%B8%EC%9B%A8%EC%9D%B4).md)  
Segue 만들기(스토리보드-직접연결)(화면이동을 담당하는 객체/버튼에서 직접실행(performSegue) > (자동호출) > shouldPerformSegue(조건에 따라 다음화면 이동할지/말지) > (자동호출) > prepare(데이터전달)  
## Reference 
[Inflearn - 앨런 swift 문법 마스터 스쿨(앱강의)](https://www.inflearn.com/course/%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8-%EB%AC%B8%EB%B2%95-%EB%A7%88%EC%8A%A4%ED%84%B0-%EC%8A%A4%EC%BF%A8-%EC%95%B1%EB%A7%8C%EB%93%A4%EA%B8%B0)
