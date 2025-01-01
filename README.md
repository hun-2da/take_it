# take_it

로또 번호 생성 앱

현재 기능

**_lotto645
lotto720_**
_이전 당첨 기록 열람_

이번 처리 작업:
* InputDecoration 입력시 DropDownButton과 단방향 동기화
  - 해당 기능으로 통계 범위를 설정할 예정
* 통계 버튼을 누르면 아래에서 dialog
  - 범위를 보내주기 위해 메서드를 파라미터로 손자까지 (parent -> child -> child)로 전송 및 동기화
* 데이터베이스에서 로또 645를 지정한 해당 범위에서 가져오고 return 해주기 위한 기능 생성 