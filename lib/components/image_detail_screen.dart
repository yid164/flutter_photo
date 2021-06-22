import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_photo/models/image_detail.dart';
import 'package:flutter_photo/shared/shared_file.dart';

class ImageDetailScreen extends StatefulWidget {
  ImageDetail imageDetail;

  ImageDetailScreen({required this.imageDetail});

  @override
  State<ImageDetailScreen> createState() => _ImageDetailScreen();
}

class _ImageDetailScreen extends State<ImageDetailScreen> {
  late int _currentIndex;
  late String? _currentImagePath;

  @override
  void initState() {
    _currentIndex = 0;
    if (widget.imageDetail.afterImagePath == null) {
      if (widget.imageDetail.beforeImagePath == null) {
        _currentImagePath = null;
      } else {
        _currentImagePath = widget.imageDetail.beforeImagePath!;
        _currentIndex = 1;
      }
    } else {
      _currentImagePath = widget.imageDetail.afterImagePath!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(widget.imageDetail.date),
        ),
        body: SafeArea(
          child: Column(
            children: [
              buildPhotoBody(),
              buildSegmentedControl(),
            ],
          ),
        ));
  }

  Widget buildPhotoBody() {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.02,
            size.width * 0.05, size.height * 0.1),
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: _currentImagePath != null ? Colors.transparent : Colors.grey,
          borderRadius: BorderRadius.circular(16),
          image: _currentImagePath != null ? DecorationImage(
            image: AssetImage(_currentImagePath!),
            fit: BoxFit.cover,
          ) : null,
        ),
      ),
    );
  }

  Widget buildSegmentedControl() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: CupertinoSegmentedControl<int>(
        padding: EdgeInsets.all(defaultPadding),
        children: imageControl,
        onValueChanged: (int val) {
          onIndexChanged(val);
        },
        groupValue: _currentIndex,
      ),
    );
  }

  void onIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
      _currentImagePath = index == 0
          ? widget.imageDetail.afterImagePath
          : widget.imageDetail.beforeImagePath;
    });
  }

  final Map<int, Widget> imageControl = const <int, Widget>{
    0: Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Text('After'),
    ),
    1: Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Text('Before'),
    ),
  };
}
