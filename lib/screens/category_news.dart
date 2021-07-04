import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/get_news.dart';
import 'package:news_app/models/article_model.dart';

class CategoryNews extends StatefulWidget {
  static const routeName = '/category_news';
  final String category;
  CategoryNews(this.category);
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = [];
  bool _isLoading = true;
  @override
  void initState() {
    getnews(widget.category);
    super.initState();
  }

  getnews(String category) async {
    News news = News();
    await news.getNews(category);
    articles = news.news;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(articles);
    print('${widget.category[0].toUpperCase()}');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${widget.category[0].toUpperCase()}${widget.category.substring(1)}',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.share,
              ))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: articles.length,
                  itemBuilder: (contest, index) => Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: Image.network(
                              articles[index].urlToImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          articles[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(articles[index].description),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
