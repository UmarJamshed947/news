import 'package:flutter/material.dart';
import 'package:news/helper/category_data.dart';
import '../helper/news_api.dart';
import '../models/article_model.dart';
import '../models/category_modal.dart';
import '../widgets/blog_tile.dart';
import '../widgets/category_tile.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  //// Flag to indicate if data is being loaded or not
  bool _loading = true;
  //var articles;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  // getNews method is used to fetch news data asynchronously
  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    print("Number of articles: ${articles.length}");
    setState(() {
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
        centerTitle: true,
        elevation: 0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    //Categories
                    Container(
                      height: 110,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),

                    // Blogs
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



