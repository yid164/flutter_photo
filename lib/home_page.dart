import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/image_card.dart';

List<ImageDetail> _images = [
  ImageDetail(
      date: "April 10, 2021",
      beforeImagePath: "lib/images/1.jpg",
      afterImagePath: "lib/images/2.jpg"),
  ImageDetail(
      date: "April 11, 2021",
      beforeImagePath: "lib/images/3.jpg",
      afterImagePath: "lib/images/4.jpg"),
  ImageDetail(
      date: "April 12, 2021",
      beforeImagePath: "lib/images/5.jpg",
      afterImagePath: "lib/images/6.jpg"),
  ImageDetail(
      date: "April 13, 2021",
      beforeImagePath: "lib/images/7.jpg",
      afterImagePath: "lib/images/8.jpg"),
  ImageDetail(
      date: "April 14, 2021",
      beforeImagePath: "lib/images/9.jpg",
      afterImagePath: "lib/images/10.jpg"),
  ImageDetail(
      date: "April 10, 2021",
      beforeImagePath: "lib/images/11.jpg",
      afterImagePath: "lib/images/12.jpg"),
  ImageDetail(
      date: "April 10, 2021",
      beforeImagePath: "lib/images/13.jpg",
      afterImagePath: "lib/images/14.jpg"),
  ImageDetail(
      date: "April 10, 2021",
      beforeImagePath: "lib/images/15.jpg",
      afterImagePath: "lib/images/16.jpg"),
];

const defaultPadding = 16.0;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Gallery',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: GridView.builder(
                      itemCount: _images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: defaultPadding,
                          crossAxisSpacing: defaultPadding,
                          childAspectRatio: 0.75),
                      itemBuilder: (context, index) => ImageCard(
                          imageDetail: _images[index], onPressed: () {}))),
            )
          ],
        ),
      ),
    );
  }
}

class ImageDetail {
  String? beforeImagePath;
  String? afterImagePath;
  final String date;

  ImageDetail({required this.date, this.beforeImagePath, this.afterImagePath});
}
