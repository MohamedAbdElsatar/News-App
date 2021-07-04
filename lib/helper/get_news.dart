import 'dart:convert' as convert;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class News {
  List<ArticleModel> news = [];
  Future<void> getNews(var format) async {
    String url;
    if (format == true)
      url ='https://newsapi.org/v2/top-headlines?country=us&apiKey=d3ebce440f7141e89b2da538855896be';
    else
      url =
          'https://newsapi.org/v2/top-headlines?country=us&category=$format&apiKey=d3ebce440f7141e89b2da538855896be';

    final response = await http.get(Uri.parse(url));
      
    var jsonData = convert.jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      print(response.statusCode);
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            //content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
