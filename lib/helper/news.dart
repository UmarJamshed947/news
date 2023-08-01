import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=8d935895c40544a09cddc83aa471ebf2";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author']??"",
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'],
            content: element['content']??"",
          );
          news.add(articleModel);
        }
      });
    }
  }
}


class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getCategoryNewsClass (String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=8d935895c40544a09cddc83aa471ebf2";
    Uri uri = Uri.parse(url);

    print(url);
    var response = await http.get(uri);

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author']??"",
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'],
            content: element['content']??"",
          );
          news.add(articleModel);
        }
      });
    }
  }
}

//>>>>>>>>>>>>>>>>>>>..

// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import '../models/article_model.dart';
//
// class News {
//   List<ArticleModel> news = [];
//
//   Future<void> getNews() async {
//     String url =
//         "https://newsapi.org/v2/top-headlines?country=us&apiKey=10a5488339eb44ba8d3422a7ffdf343b";
//     Uri uri = Uri.parse(url);
//     var response = await http.get(uri);
//
//     print("Response Status Code: ${response.statusCode}");
//     print("Response Body: ${response.body}");
//
//     var jsonData = jsonDecode(response.body);
//
//     if (jsonData['status'] == "ok") {
//       jsonData["articles"].forEach((element) {
//         if (element["urlToImage"] != null && element['description'] != null) {
//           // Add null checks for title and author fields
//           String title = element['title'] ?? "No Title";
//           String author = element['author'] ?? "Unknown Author";
//
//           // Provide default value for description if missing
//           String description = element['description'] ?? "No Description";
//
//           // Other fields can also be handled similarly if needed
//
//           ArticleModel articleModel = ArticleModel(
//             title: title,
//             author: author,
//             description: description,
//             url: element['url'],
//             urlToImage: element['urlToImage'],
//             content: element['content'],
//           );
//           news.add(articleModel);
//         }
//       });
//     }
//   }
// }

// class News {
//   List<ArticleModel> news = [];
//
//   Future<void> getNews() async {
//     String url =
//         "https://newsapi.org/v2/top-headlines?country=us&apiKey=10a5488339eb44ba8d3422a7ffdf343b";
//     Uri uri = Uri.parse(url);
//     var response = await http.get(uri);
//
//     print("Response Status Code: ${response.statusCode}");
//     print("Response Body: ${response.body}");
//
//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//
//       if (jsonData['status'] == "ok") {
//         jsonData["articles"].forEach((element) {
//           if (element["urlToImage"] != null && element['description'] != null) {
//             ArticleModel articleModel = ArticleModel(
//               title: element['title'] ?? "",
//               author: element['author'] ?? "",
//               description: element['description'] ?? "",
//               url: element['url'] ?? "",
//               urlToImage: element['urlToImage'] ?? "",
//               content: element['content'] ?? "",
//             );
//             news.add(articleModel);
//           }
//         });
//       }
//     }
//   }
// }
