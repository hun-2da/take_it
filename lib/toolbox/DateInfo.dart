import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**날짜와 관련된 UI*/
class DateInfo extends StatefulWidget {


  String _lottoDate= '2000.11.04';

  DateInfo(
      this._lottoDate
      );

  @override
  DateContext createState() => DateContext();
}
class DateContext extends State<DateInfo> {




  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Text(
          widget._lottoDate,
          textAlign: TextAlign.right,
          style: TextStyle(
              fontSize: 13.7,
              color: Colors.black26,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
          ),

        )
    );
  }
}