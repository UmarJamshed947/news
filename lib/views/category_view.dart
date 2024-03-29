import 'package:flutter/material.dart';
import '../helper/news_api.dart';
import '../widgets/blog_tile.dart';


class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({required this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
  }

class _CategoryNewsState extends State<CategoryNews> {

  //List<ArticleModel> articles = [];
  bool _loading = true;
  var articles;

  @override
  void initState(){
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getCategoryNewsClass(widget.category);
    articles = newsClass.news;
    setState (() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Buzz",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: <Widget>[
          Opacity(opacity:0 ,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
    body:  _loading
        ? Center(
      child: Container(
        child: CircularProgressIndicator(),
      ),
    )        : SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 16),
              child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BlogTile(
                        imageUrl: articles[index].urlToImage??"",
                        title: articles[index].title??"",
                        desc: articles[index].description??"",
                        url: articles[index].url??"");
                  }),
            ),
          ],
      ),
    ),
        ),
    );
  }
}


