import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_photo/home_page.dart';

class ImageCard extends StatelessWidget {
  final ImageDetail imageDetail;
  final Function onPressed;

  const ImageCard(
      {Key? key, required this.imageDetail, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage(imageDetail.afterImagePath!),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding / 6),
          child: Text(
            imageDetail.date,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
