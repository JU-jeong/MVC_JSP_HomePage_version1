# P5-MVC_JSP_HomePage
## 목차
* 프로젝트 설명
* 포함 목록
* 동작 과정
* 기능 소개
* 예상 시나리오
* 결과 화면
## 프로젝트 설명
이 프로젝트는 JAVA, JSP, Servlet, JS, DB만을 이용하여 만든 로그인, 회원가입 및 게시판 기능이 있는 홈페이지 구축 프로젝트입니다.  
FrontController.java파일과 Command.java 인터페이스를 만들어서 커맨드 패턴을 적용하였습니다.  
forward와 redirect를 적절히 사용하여 주소에 보안성을 높였습니다.  
구조는 MVC 구조로 구성하였습니다.
## 포함 목록
다운로드 목록에는 다음과 같은 디렉토리와 파일이 있으며 공통 에셋을 논리적으로 그룹화하고 유사 및 축소 변형을 모두 제공합니다.  
볼 수 있는 목록:

* P5-MVC_JSP_HomePage
   * .setting
      * ...
   * WebContent
      * META-INF
        * ...
      * css-folder
        * ...
      * join.jsp
      * login.jsp
      * main.jsp
      * modify.jsp
      * list.jsp
      * content_view.jsp
      * write_view.jsp
      * reply_view.jsp
      * Bmodify.jsp
      * members.js
   * src/com/javalec/jsp_homepage
      * Dao
        * BDao.java
        * MemberDao.java
      * Dto
        * BDto.java
        * MemberDto.java
      * command
        * Command.java
        * JoinCommand.java
        * LoginCommand.java
        * LogoutCommand.java
        * ModifyCommand.java
        * BContentCommand.java
        * BDeleteCommand.java
        * BListCommand.java
        * BModifyCommand.java
        * BReplyCommand.java
        * BReplyViewCommand.java
        * BWriteCommand.java
      * frontcontroller
        * FrontController.java
   * build/classes/com/javalec/jsp_homepage
      * ...
   * DB.txt
   * ...

## 동작 과정
1. Clone the repo: `git clone https://github.com/LeeKiJong/P5-MVC_JSP_Homepage.git` 
2. apache-tomcat execute
3. Enter Website: http://IP주소/MVC_JSP_Homepage/login.jsp

## 기능 소개
1. 로그인
2. 로그아웃
3. 회원가입
4. 회원 정보수정
5. 글 목록 표시
6. 글 작성
7. 글 수정
8. 글 답변
9. 글 삭제


## 예상 시나리오
1. 회원가입
2. 로그인
3. 정보수정
4. 로그아웃
5. 재로그인
6. 게시판
7. 글 작성
8. 글 수정
9. 글 답변
10. 글 삭제
11. 글 목록 확인
**`위의 예상 시나리오가 오류없이 진행되고 결과도 정상적으로 나온다면 정상 작동으로 볼 수 있습니다.`**

## 결과 화면
1. 로그인 페이지
![1](https://user-images.githubusercontent.com/52438368/75952593-808c5b00-5ef2-11ea-8e52-26969281560a.PNG)
2. 회원가입 페이지
![2](https://user-images.githubusercontent.com/52438368/75952594-8124f180-5ef2-11ea-91de-4599b5a913da.PNG)
3. 메인 페이지
![3](https://user-images.githubusercontent.com/52438368/75952597-82561e80-5ef2-11ea-9617-098c154e5ac9.PNG)
4. 회원정보 수정 페이지
![4](https://user-images.githubusercontent.com/52438368/75952599-83874b80-5ef2-11ea-9adf-34ba397297b1.PNG)
5. 글 목록 페이지
![5](https://user-images.githubusercontent.com/52438368/75952601-84b87880-5ef2-11ea-96fd-366ae5f17e14.PNG)
6. 글 작성 페이지
![6](https://user-images.githubusercontent.com/52438368/75952603-85510f00-5ef2-11ea-8499-af50bc47ea98.PNG)
7. 글 수정 페이지
![7](https://user-images.githubusercontent.com/52438368/75952604-85510f00-5ef2-11ea-8ca8-ab1733053eb3.PNG)
8. 글 답변 페이지
![8](https://user-images.githubusercontent.com/52438368/75952606-85e9a580-5ef2-11ea-90b2-c36b2bfb3dfa.PNG)
