import 'package:flutter/material.dart';

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
                child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return RawMaterialButton(
                    onPressed: () => {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(_images[index].afterImagePath!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _images.length,
              ),
            )),
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
