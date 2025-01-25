import 'package:flutter/material.dart';

import 'LottoManager/mainListPage/ListPage.dart';
import 'ball_Database/DatabaseCheck.dart';
import 'main_colors.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  DatabaseCheck().check();
  runApp(const MainPage());


}
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '가져가쟈',
        theme: ThemeData(
          primarySwatch: customPurple,
        ),
        debugShowCheckedModeBanner: false, // 상단 appbar의 우측 배너 제거
        home: const ListPage()

    );
  }
}
