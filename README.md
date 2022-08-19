## 🚲 따릉이 with Network

### ✏️ New Knowledge

1. 카카오 OAuth (Sequance Diagram)
2. Unsplash API
3. KingFisher & SDK Web Image
    * 비동기 느려짐 처리
4. JWT 처리과정
    * 소셜로그인 결과 → Access 토큰 → 서비스 서버에 보내주기 → 소셜로그인 제공업체 → OK → 서버 → 그 서버의 AccessToken(JWT)를 줌 → 클라이언트는 헤더에 넣음 
5. xcode run_info → Relase 모드로 실행해보기 
6. Loading Indicator
7. Debouncing
    * 3초 -> 1번 눌리는 기능
8. differableColletionView
9. Paging (무한스크롤) 
10. git lfs / bfg

---
### API 처음 접할 때의 순서

1. API Guide 읽기(API doc)
2. post man에 url 넣어서 테스트 왼쪽 workspace 만들기 (서버 문제일 수도 있음)
3. Alamofire 설치 (깃허브 읽어보기)
4. Swift Package Manger - file added packge up to Next Major version
5. github 문서 usage에 사용법 다 있음
6. 🔥다른 파일에 만든 것 생성과 호출하기 /// 세개 쓰면 Doc 생성됨
7. Body에 있는 코드화 된 json 데이터를 디코드 해주어야함 (구조체 만들어서)
8. struct WeatherResponce: Decodable 안에서 [노가다 작업,](https://app.quicktype.io/) but 한번 해보기
    * Xcode 정렬 단축키 → control + i
9. escaping closure_weak self & main.async으로 해줘야 !
10. swift result : 애초에 success , failure로 나뉜다.

---

### 📱 Final Result



---

### 🧠 Gotten & Used Component

1. API GET 
2. Naver Map
3. git lfs
4. git ignore
5. Google OAuth

---

### 🗣 Grammar 

- 익스탠션 : [https://jusung.gitbook.io/the-swift-language-guide/language-guide/20-extensions](https://jusung.gitbook.io/the-swift-language-guide/language-guide/20-extensions)
- 프로토콜 : [https://jusung.gitbook.io/the-swift-language-guide/language-guide/21-protocols](https://jusung.gitbook.io/the-swift-language-guide/language-guide/21-protocols)
- 익스텐션, 프로토콜 : [https://blog.yagom.net/529/](https://blog.yagom.net/529/)
- 위 두 개념에 대한 실습 블로그글 : [https://swift-it-world.tistory.com/21](https://swift-it-world.tistory.com/21)
- Delegate : [https://zeddios.tistory.com/8](https://zeddios.tistory.com/8)

---

### 🧑‍💻 Ref. link

- 센치한 개발자님 강의 : [https://youtu.be/5ejngRFNy_k](https://youtu.be/5ejngRFNy_k)
- 공식문서(UITableView) : [https://developer.apple.com/documentation/uikit/uitableview](https://developer.apple.com/documentation/uikit/uitableview)
- 공식문서(UITableViewCell) : [https://developer.apple.com/documentation/uikit/uitableviewcell](https://developer.apple.com/documentation/uikit/uitableviewcell)
- 예쁜 테이블뷰 : [https://zeddios.tistory.com/766](https://zeddios.tistory.com/766) (Zedd님의 자료는 언제나 훌륭합니다^^)
- Cell Lify Cycle : [https://jinnify.tistory.com/58](https://jinnify.tistory.com/58) (생명주기 배운 이후니까, 한번 보시면 좋습니다. 스위치 문제 해결에 답이 될 수도...)
- ✅테이블뷰를 사용하기 전 고민해보자 : [https://soojin.ro/blog/uitableview-hype](https://soojin.ro/blog/uitableview-hype) (테이블뷰를 사용하다보면, 모든 걸로 가능하기도 하지만 꼭 써야하는지는 고민해봅시다.)
- [https://pilgwon.github.io/blog/2017/08/30/Dealing-with-Complex-Table-Views-in-iOS.html](https://pilgwon.github.io/blog/2017/08/30/Dealing-with-Complex-Table-Views-in-iOS.html)
- [https://velog.io/@dlskawns96/Swift-MVC-패턴으로-UITableView-구현하기](https://velog.io/@dlskawns96/Swift-MVC-%ED%8C%A8%ED%84%B4%EC%9C%BC%EB%A1%9C-UITableView-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0)

