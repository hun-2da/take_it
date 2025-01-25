import 'package:intl/intl.dart';

class RoundToDate{
  // 특정 시작 날짜로부터 현재까지 몇 주차인지 계산하는 메소드
  static int calculateWeeksFromStartDate(int year, int month, int day)  {
    DateTime startDate = DateTime(year, month, day);
    DateTime currentDate = DateTime.now();
    int daysDifference = currentDate.difference(startDate).inDays;
    int weeks = (daysDifference / 7).ceil();
    return weeks;
  }

  // 주차를 받아서 해당 주차의 날짜를 계산해주는 메소드
  static String getDateFromWeeks(String round,int choice) {
    // 1회차가 시작된 날짜를 설정합니다. 예: 2002년 12월 7일
    int IntegerRound =  int.parse(round)-1;
    late DateTime startDate;

    if(choice == 645) {
      startDate = DateTime(2002, 12, 7);
    } else {
      startDate = DateTime(2020, 5, 7);
    }


    // 주 수에 해당하는 일수를 추가하여 목표 날짜를 계산합니다.
    DateTime targetDate = startDate.add(Duration(days: IntegerRound * 7));
    String formattedDate = DateFormat('yyyy.MM.dd').format(targetDate);

    return formattedDate;
  }
}