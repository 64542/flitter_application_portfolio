import 'package:flutter/material.dart';
import 'package:flutter_application_portfolio/my_dice.dart';
import 'package:flutter_application_portfolio/my_timer.dart';

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
        icon: Icon(Icons.home), label: '홈', backgroundColor: Colors.amber));
    items.add(BottomNavigationBarItem(
        icon: Icon(Icons.access_time_rounded),
        label: '타이머',
        backgroundColor: Colors.green));
    items.add(BottomNavigationBarItem(
        icon: Icon(Icons.check_box_outlined),
        label: '뽑기',
        backgroundColor: Colors.black));
    items.add(BottomNavigationBarItem(
        icon: Icon(Icons.message), label: '소개', backgroundColor: Colors.blue));
    //첫페이지를 지정
    bodyPage = Center(
      child: Text('홈임시'),
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
