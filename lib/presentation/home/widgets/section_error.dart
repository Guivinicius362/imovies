import 'package:flutter/material.dart';
import 'package:imovies/design_system/design_system.dart';

Widget sectionError() => Container(
      height: 225.0,
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Text(
              "Sorry",
              style: titleStyle,
            ),
            SizedBox(height: 16,),
            Text(
              "We couldn't load this section",
              style: subTitleStyle,
            )
          ],
        ),
      ),
    );
