import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_photo/components/image_detail_screen.dart';
import 'package:flutter_photo/models/image_detail.dart';
import 'package:flutter_photo/shared/shared_file.dart';
import 'package:intl/intl.dart';
import 'components/image_card.dart';

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
                    itemCount: constImages.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: defaultPadding,
                        crossAxisSpacing: defaultPadding,
                        childAspectRatio: 0.75),
                    itemBuilder: (context, index) {
                      if (index < constImages.length) {
                        return ImageCard(
                          imageDetail: constImages[index],
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageDetailScreen(
                                imageDetail: constImages[index],
                              ),
                            ),
                          ),
                        );
                      } else {
                        DateTime now = DateTime.now();
                        String formattedDate =
                            DateFormat('MMM dd, yyyy').format(now);
                        ImageDetail imageDetail =
                            ImageDetail(date: formattedDate);
                        return EmptyCard(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageDetailScreen(
                                imageDetail: imageDetail,
                                saveImage: () => constImages.add(imageDetail),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
