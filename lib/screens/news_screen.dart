import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsScreen extends StatelessWidget {
  final List<ArticleModel> articles;

  NewsScreen(this.articles);
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
