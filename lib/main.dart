import 'package:flutter/material.dart';
import 'package:flutter_beginner/consts/router.dart';
import 'package:flutter_beginner/pages/detail/detail_page.dart';
import 'package:flutter_beginner/pages/first_page/first_page.dart';
import 'package:flutter_beginner/pages/last/last_page.dart';
import 'package:flutter_beginner/pages/second/second_page.dart';
import 'package:flutter_beginner/pages/third/third_page.dart';

/*
Created by Axmadjon Isaqov on 09:14:55 07.09.2022
© 2022 @axi_dev 
*/
/*
Mavzu:::Takrorlash
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        RouterApp.first: (context) => const FirstPage(),
        RouterApp.second: (context) => const SecondPage(),
        RouterApp.detail: (context) => const DetailPage(),
        RouterApp.third: (context) => ThirdPage(),
        RouterApp.last: (context) => const LastPage()
      },
      initialRoute: RouterApp.last,
    );
  }
}
