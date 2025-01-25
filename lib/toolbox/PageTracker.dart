import 'package:flutter/material.dart';

/// 회차수와 관련된 UI
class PageTracker extends StatefulWidget {


  String _round= 'NO.1';
  Color Page_Color = Colors.black;

  PageTracker(
      this._round, this.Page_Color, {super.key}
      );

  @override
  PageCounter createState() => PageCounter();
}
class PageCounter extends State<PageTracker> {



  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child:  Card(
          margin: const EdgeInsets.all(0),
          color:  widget.Page_Color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(7.7),
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(7.7),
            ),
          ),/*Color.fromRGBO(60, 209, 163, 1),*/
          child: Padding(
            padding: const EdgeInsets.all(3.0), // Card 안쪽 패딩
            child: Text(
              widget._round,
              style: const TextStyle(
                  fontSize: 13.7,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
      ),
    );
  }

}