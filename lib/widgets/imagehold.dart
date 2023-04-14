import 'package:flutter/material.dart';
import 'package:vqa/pages/homepage.dart';

class ImageHold extends StatelessWidget {
  const ImageHold({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 310,
        padding: EdgeInsets.all(50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(800),
          child: Image.asset(
            'assets/images/search.jpeg',
          ),
        ),
      ),
    );
  }
}
