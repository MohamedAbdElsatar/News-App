import 'package:flutter/material.dart';
import 'package:news_app/helper/get_news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/category_screen.dart';
import 'package:news_app/screens/news_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> articles = [];
  bool isLoading = true;
  @override
  void initState() {
    getnews();
    super.initState();
  }

  getnews() async {
    News news = News();
    await news.getNews(true);
    articles = news.news;
     print(articles);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  CategoriesScreen(),
                  NewsScreen(articles),
                ],
              ),
            ),
    );
  }
}