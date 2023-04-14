import 'package:flutter/material.dart';
import 'package:vqa/pages/homepage.dart';

class TextIn extends StatefulWidget {
  static final fieldText = TextEditingController();
  TextIn({super.key});

  @override
  State<TextIn> createState() => _TextInState();
}

class _TextInState extends State<TextIn> {
  void clearText() {
    TextIn.fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Something',
          focusColor: Colors.green,
          suffixIcon: IconButton(
            // Icon to
            icon: Icon(Icons.clear), // clear text
            onPressed: clearText,
          ),
        ),
        controller: TextIn.fieldText,
      ),
    );
  }
}
