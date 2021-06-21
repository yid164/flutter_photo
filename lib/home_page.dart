import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 40,),
            Text(
              'Gallery',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40,),
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical:  30,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  String? beforeImagePath;
  String? afterImagePath;
  final String date;

  ImageDetails(this.date);
}