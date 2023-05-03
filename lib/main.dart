import 'package:flutter/material.dart';
import 'package:flutter_application_portfolio/my_dice.dart';
import 'package:flutter_application_portfolio/my_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  //하단 아이템들 배열
  List<BottomNavigationBarItem> items = [];
  late Widget bodyPage;
  List<dynamic> pages = [
    MyTimer(),
    MyTimer(),
    MyDice(),
    MyTimer(),
  ];

  void movePage(int page) {
    setState(() {
      _index = page;
      bodyPage = pages[page];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home, color: Colors.orange),
        label: '홈',
        backgroundColor: Colors.amber));
    items.add(BottomNavigationBarItem(
        icon: Icon(
          Icons.access_time_rounded,
        ),
        activeIcon: Icon(Icons.access_time_rounded, color: Colors.amber),
        label: '타이머',
        backgroundColor: Colors.green));
    items.add(BottomNavigationBarItem(
        icon: Icon(Icons.check_box_outlined),
        activeIcon: Icon(
          Icons.check_box_outlined,
          color: Colors.brown,
        ),
        label: '뽑기',
        backgroundColor: Colors.black));
    items.add(BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.user),
        activeIcon: FaIcon(FontAwesomeIcons.user, color: Colors.grey),
        label: '소개',
        backgroundColor: Colors.blue));
    //첫페이지를 지정
    bodyPage = Center(
      child: FaIcon(FontAwesomeIcons.dAndDBeyond, size: 40),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: bodyPage,
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              movePage(value);
            },
            //type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            //backgroundColor: Colors.greenAccent,
            items: items),
      ),
    );
  }
}
