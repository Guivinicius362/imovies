import 'package:flutter/material.dart';
import 'package:imovies/design_system/design_system.dart';
import 'package:shimmer/shimmer.dart';

typedef String? HandleImageUrl(int index);

class ContentScroll extends StatelessWidget {
  final List list;
  final String title;
  final double imageHeight;
  final double imageWidth;
  final HandleImageUrl handleImageUrl;

  ContentScroll({
    required this.list,
    required this.title,
    required this.handleImageUrl,
    this.imageHeight = 260.0,
    this.imageWidth = 140.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: titleStyle,
              ),
            ],
          ),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                width: imageWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: getImage(index),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget? getImage(int index) {
    final imageUrl = handleImageUrl(index);
    if (imageUrl == null) return null;

    return Image(
      image: NetworkImage(
        imageUrl,
      ),
      fit: BoxFit.cover,
    );
  }

  static Widget shimmer(String title) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: ContentScroll(
        list: [1, 2, 3],
        title: title,
        imageHeight: 260.0,
        imageWidth: 140.0,
        handleImageUrl: (int index) => null,
      ),
    );
  }
}
