import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('hello');
      },
      child: Container(
        height: 70,
        child: ListView.builder(
          itemCount: category.length,
          itemBuilder: (cxt, index) => Container(
            height: 70,
            width: 120,
            margin: EdgeInsets.only(left: 15, bottom: 10),
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Image.network(
                  category[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Text(
                  category[index].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              )
            ]),
          ),
          scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
        ),
      ),
    );
  }
}
