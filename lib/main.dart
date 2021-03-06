import 'package:flutter/material.dart';
import 'package:news_app/screens/category_news.dart';
import 'package:news_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomeScreen(),
      
    );
  }
}
