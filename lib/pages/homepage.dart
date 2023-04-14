import 'package:flutter/material.dart';
import 'package:vqa/widgets/imagehold.dart';
import 'package:vqa/widgets/subhead.dart';
import 'package:vqa/widgets/textfield.dart';
import 'package:vqa/widgets/imgcard.dart';
import 'package:vqa/widgets/searchbtn.dart';
import 'package:vqa/widgets/drawer.dart';
import 'package:vqa/widgets/bottomnav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: BottomNav(),
      drawer: DrawMenu(),
      appBar: AppBar(
        title: Text(
          'Visual QA System',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ImageHold(),
            SubHead(),
            TextIn(),
            ImgCard(),
            SearchBtn(),
          ],
        ),
      ),
    );
  }
}
