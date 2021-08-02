import 'package:flutter/material.dart';
import 'package:imovies/design_system/design_system.dart';
import 'package:shimmer/shimmer.dart';

typedef String? HandleImageUrl(int index);
typedef String? HandleTitle(int index);

class CircularContentScroll extends StatelessWidget {
  final List list;
  final String title;
  final double imageHeight;
  final double imageWidth;
  final HandleImageUrl handleImageUrl;
  final HandleTitle handleTitle;

  CircularContentScroll({
    required this.list,
    required this.title,
    required this.handleImageUrl,
    required this.handleTitle,
    this.imageHeight = 280.0,
    this.imageWidth = 280.0,
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
                  borderRadius: BorderRadius.circular(180.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: getImage(index),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          handleTitle(index) ?? "-",
                          style: subTitleStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget getImage(int index) {
    final imageUrl = handleImageUrl(index);
    if (imageUrl == null) return SizedBox.expand();

    return CircleAvatar(
      radius: 150.0,
      backgroundImage: NetworkImage(
        imageUrl,
      ),
    );
  }

  static Widget shimmer(String title) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: CircularContentScroll(
          list: [1, 2, 3],
          title: title,
          imageHeight: 260.0,
          imageWidth: 140.0,
          handleImageUrl: (int index) => null,
          handleTitle: (int index) => null,
        ),
      );
}
