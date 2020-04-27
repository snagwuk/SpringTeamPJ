
# Spring_TeamProject 3조

  - 주제 : 추억의 물품 경매 웹 페이지
  
  - 조원 : 박상욱,남한별,김지은,주진희
  
    | 조원 이름 | 담당 파트 |
    | ------ | ------ |
    | 박상욱 | 경매물품CRUD ,캐시기능, WebRTC |
    | 남한별 | 회원기능,관리자기능, Chart |
    | 김지은 | 메시지기능, 입찰기능, 위시리스트   |
    | 주진희 | 거래과정, Mypage, 패널티 기능, 검색기능,  |

  - 프로젝트 기간 :  2020.03.23 ~ 2020.04.23
  - 개발환경
  
		OS / IDE : Window10 / Eclipse : Neon.3
		Framework : Spring 4.0.4
		JVM : 1.8.0_161-b12
		Server : Apache Tomcat-8.5.38
		DB : MySQL-5.1.45
		DB framework : Mybatis-3.2.1



# 웹페이지 소개 및 기능
-  추억의 물품 경매 웹페이지
- 경매 기능 : 경매 CRUD , 입찰, 경매 이후 거래기능(결제하기,배송하기,수취확인), 즉시구매기능, 패널티 기능(거래 취소 시 경고적용, 경고3회 누적 시 활동정지), 관심 판매자 등록, 경매검색기능

- 회원기능 : 회원가입, 로그인, 로그아웃, 회원정보수정, PASSWORD DB (암호화)

- 관리자 페이지: 캐시 승인/거절, 판매자 신청 승인/거절, 회원목록, 회원등급관리, 통계 차트(회원의 성비, 회원 연령대,  가입 경로)

- 마이 페이지: 거래상태에 따른 상품 내역 (판매자 / 구매자) , 패널티 내역, 캐시 충전 / 출금 신청 , 캐시 내역, 관심 판매자 내역

- 메시지 기능 : WebSocket 채팅 기능, 새로운 메시지 알림

- Live 방송 기능 : WebRtc 활용하여 간단한 방송 하기, 방송 시청하기


