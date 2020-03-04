# P5-MVC_JSP_HomePage
## 목차
* 프로젝트 설명
* 포함 목록
* 동작 과정
* 기능 소개
* 예
* 결과 화면
## 프로젝트 설명
이 프로젝트는 JAVA, JSP, Servlet, JS, DB만을 이용하여 만든 로그인, 회원가입 및 게시판 기능이 있는 홈페이지 구축 프로젝트입니다.  
FrontController.java파일과 Command.java 인터페이스를 만들어서 커맨드 패턴을 적용하였습니다.  
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
1. 투표 기능
2. 트랜잭션, 결과 확인 기능

## 예
1. 이름: 이기종, 투표: 1번 후 제출
2. 결과 확인
3. 이름: 기종이, 투표: 2번 후 제출
4. 결과 확인
5. 이름: 종이기, 투표: 3번 후 제출
6. 결과 확인
**`위의 실행 프로세스가 오류없이 진행되고 결과도 정상적으로 나온다면 정상 작동으로 볼 수 있습니다.`**

## 결과 화면
메인 페이지
![1](https://user-images.githubusercontent.com/52438368/68915424-62fd7f00-07a5-11ea-9130-1cdbf58d9c50.PNG)
투표 페이지
![2](https://user-images.githubusercontent.com/52438368/68915429-65f86f80-07a5-11ea-8ba7-97556124fc42.PNG)
결과 확인 페이지
![3](https://user-images.githubusercontent.com/52438368/68915433-67c23300-07a5-11ea-9d65-0be64e4f7bc4.PNG)

각 화면들이 이렇게 동작한다면 정상 동작입니다.

![2](https://user-images.githubusercontent.com/52438368/75603439-9d4f1a00-5b11-11ea-8a28-c5e1f425166c.PNG)
![3](https://user-images.githubusercontent.com/52438368/75603440-9de7b080-5b11-11ea-8374-06b9795e61cc.PNG)
