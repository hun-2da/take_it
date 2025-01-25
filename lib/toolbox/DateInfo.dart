import 'package:flutter/material.dart';

/// 날짜와 관련된 UI
class DateInfo extends StatefulWidget {


  String _lottoDate= '2000.11.04';

   DateInfo(
      this._lottoDate
      );

  @override
  DateContext createState() => DateContext();
}
class DateContext extends State<DateInfo> {




  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Text(
          widget._lottoDate,
          textAlign: TextAlign.right,
          style: const TextStyle(
              fontSize: 13.7,
              color: Colors.black26,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
          ),

        )
    );
  }
}