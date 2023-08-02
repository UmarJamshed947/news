// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../views/category_view.dart';
//
//
// // Custom widget 'CategoryTile' to display category information
// class CategoryTile extends StatelessWidget {
//   final String imageUrl;
//   final String categoryName;
//   CategoryTile({required this.imageUrl, required this.categoryName});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder:(context) => CategoryNews(
//               category: categoryName.toLowerCase(),
//             ),
//             ));
//       },
//       child: Container(
//         margin: EdgeInsets.only(right: 16),
//         child: Stack(
//           children: <Widget>[
//             ClipRRect(
//                 borderRadius: BorderRadius.circular(6),
//                 child: CachedNetworkImage(
//                     imageUrl: imageUrl,
//                     width: 120,
//                     height: 60,
//                     fit: BoxFit.cover)),
//             Container(
//               alignment: Alignment.center,
//               width: 120,
//               height: 60,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(6),
//                   color: Colors.black26),
//               child: Text(
//                 categoryName,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../views/category_view.dart';

// Custom widget 'CategoryTile' to display category information
class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  CategoryTile({required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              category: categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8), // Adjust the spacing between the image and text
            Text(
              categoryName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}



