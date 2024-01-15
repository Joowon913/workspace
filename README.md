# WORK SPACE 프로젝트

결재 시스템/게시판 시스템 그룹웨어
-------------------------------------

## 프로젝트 명
WORKSPACE

## 개발 기간 
2023/12/12 - 2024/01/04

## 개발 환경
Window10, Java11, Java Script, CSS, JSP, JSTL, Spring Tool Suite 3.9.18, MySql 8.0.22, 

## 의존성 / 빌드
Spring Framework 5.2.25, Mybatis 3.5.14, Mybatis-spring 2.1.2, Lombok 1.18.30

## 팀원 소개
||**팀장<br>노윤건**|**김주원**|**전종배**|**한혜림**|
|:---:|:---:|:---:|:---:|:---:|
|**FRONT**|기안 작성, 기안 수정|로그인, 문서조회,<br> 결재라인 엘리먼트|게시판<br>메뉴 전반|헤더&사이더,<br>결재함 전반|
|**BACK**|문서 수정, 반려, 의견쓰기 기능|로그인/로그아웃,<br> 결재라인, 상태 변경, 문서작성, 삭제,<br> 복원, DB설계|게시판 글 작성, 조회, 검색 기능| 문서 조회,<br>결재함 상태,<br>사용자별 조회, 검색, 첨부파일, 페이징|

## 설계 목적
단순화된 메뉴와 직관적 디자인으로 5단계이내 Depth 구현

## 주요 대상
다양한 연령층으로 구성된 간단하고 쉽게 적용 가능한 그룹웨어 시스템을 필요로하는 기업

-----------------------------------------------------

## 핵심 기능

  - 로그인      : 해당 세션이 유지되는 동안 로그인 사용 기능


<img src="https://github.com/doubleHLea/workspace/assets/144035274/a2c3203f-dfe0-401a-95f4-4e819e43c303" width="600px" title="로그인화면" alt="login"></img>


  - 검색        : 서류와 게시판 각각 검색 가능
  - 기안 작성   : 결재라인 선택, 첨부파일 업로드


<img src="https://github.com/doubleHLea/workspace/assets/144035274/fc5bbd59-52c1-4128-9a61-645bbf021cef" width="1000px" title="기안작성" alt="write"></img>

  - 내 결재함   : 로그인한 유저가 작성한 문서만 조회 가능, 페이지네이션

<img src="https://github.com/doubleHLea/workspace/assets/144035274/f40b9222-5c89-4fd2-a704-983376ab9fe8" width="1000px" title="내결재함" alt="documentsBox"></img>

  - 진행 결재함 : 현재 결재 상태가 진행중인 서류 중 해당 결재라인에 해당하는 담당자와 다음 결재자에게만 표시, 페이지네이션

<img src="https://github.com/doubleHLea/workspace/assets/144035274/7dbfa29d-b52c-40f5-88a8-2f223659ee78" width="1000px" title="진행결재함" alt="progressBox"></img>



  - 반려 결재함 : 서류가 반려될 시 최초 작성자에게만 반려 사항이 보여짐, 페이지네이션
<img src="https://github.com/doubleHLea/workspace/assets/144035274/89279b6e-ac51-4a8a-9c4c-e19460385e86" width="1000px" title="반려결재함" alt="returnBox"></img>

  - 반려 결재 전
<img src="https://github.com/doubleHLea/workspace/assets/144035274/5df1a497-9641-4c9e-8336-ce3f322322cd" width="1000px" title="반려결재함" alt="returnBox-before"></img>

  - 반려 결재
![반려 결재](https://github.com/doubleHLea/workspace/assets/144035274/3e80f55b-ae4c-4168-8625-8477019103ee)

  - 반려 결재 상세
![반려결재(상세)](https://github.com/doubleHLea/workspace/assets/144035274/3d211c61-7525-4ac1-aaea-09bc97c8c83b)



- 완료 결재함 : 해당 결재라인의 모두가 완료된 결재서류를 열람 가능, 페이지네이션
![완료결재함](https://github.com/doubleHLea/workspace/assets/144035274/5809ef10-3c8b-45a0-9755-4c46385b96b0)



- 게시판      : 사용자들이 자유롭게 작성 가능한 사내 게시판
![게시판](https://github.com/doubleHLea/workspace/assets/144035274/16f7863c-3440-4d83-ad82-e6b57c35ba91)



- 내 게시글   : 로그인한 유저의 게시글만 보임
![내 게시글](https://github.com/doubleHLea/workspace/assets/144035274/17c47eb2-3e55-4f2a-a415-596c545d283f)



- 휴지통      : 결재가 완료된 결재서류만 삭제/복원 기능, 페이지네이션
![휴지통으로 이동1](https://github.com/doubleHLea/workspace/assets/144035274/d61e12e9-ada4-4934-a093-40b601b37a59)
![휴지통으로이동(2)](https://github.com/doubleHLea/workspace/assets/144035274/49e5fbd4-bd9d-455a-9150-44c208fc9f11)
![복원](https://github.com/doubleHLea/workspace/assets/144035274/0fbf2822-6a28-4ed4-a890-c8852ef06c74)
![삭제](https://github.com/doubleHLea/workspace/assets/144035274/9b4eb4e1-d54d-4a6c-89f3-5df01b5fdc86)



## 서류 조회
![결재 승인(전)](https://github.com/doubleHLea/workspace/assets/144035274/5f905a06-f297-4ede-ad3f-71b72b50ca2b)
![결재 승인(후)](https://github.com/doubleHLea/workspace/assets/144035274/6e891078-9202-495a-a7e3-9ba99a730999)
- 해당 서류가 진행중인 결재라인의 담당자 이름 상황 표시
- 해당 서류의 첨부파일 다운로드/수정/삭제 기능
- 결재 승인/반려/의견작성(반려시) 버튼
- 수정버튼   : 결재라인이 작성자일때, 반려가 아닐때 활성화
- 휴지통이동 : 해당 작성자이거나 진행중이 아닐때 활성화
- 반려시 의견작성한 내용 함께 표시
