import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_photo/home_page.dart';

class ImageDetailScreen extends StatefulWidget {
  final ImageDetail imageDetail;

  ImageDetailScreen({required this.imageDetail});

  @override
  State<ImageDetailScreen> createState() => _ImageDetailScreen();

}

class _ImageDetailScreen extends State<ImageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.imageDetail.date),
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildPhotoBody(),
          ],
        ),
      )
    );
  }

  Widget buildPhotoBody() {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          bottom: size.height * 0.1,
          left: size.width * 0.05,
          right: size.width * 0.05,
          top: size.height * 0.02,
        ),
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: AssetImage(widget.imageDetail.afterImagePath!),
                fit: BoxFit.cover)),
      ),
    );
  }
}