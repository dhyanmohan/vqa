import 'package:vqa/pages/homepage.dart';
import 'package:flutter/material.dart';

class SubHead extends StatelessWidget {
  const SubHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 250, 20),
      child: Text(
        'Search Here',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
