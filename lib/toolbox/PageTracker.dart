import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**회차수와 관련된 UI*/
class PageTracker extends StatefulWidget {


  String _round= 'NO.1';
  Color Page_Color = Colors.black;

  PageTracker(
      this._round, this.Page_Color
      );

  @override
  PageCounter createState() => PageCounter();
}
class PageCounter extends State<PageTracker> {
  String _round= 'NO.1';
  @override
  void initState() {
    super.initState();
    _round = widget._round;
  }


  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child:  Card(
          margin: EdgeInsets.all(0),
          color:  widget.Page_Color,/*Color.fromRGBO(60, 209, 163, 1),*/
          child: Padding(
            padding: const EdgeInsets.all(3.0), // Card 안쪽 패딩
            child: Text(
              _round,
              style: TextStyle(
                  fontSize: 13.7,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(7.7),
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(7.7),
            ),
          )
      ),
    );
  }

}