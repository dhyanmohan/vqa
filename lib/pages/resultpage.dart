import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vqa/widgets/searchbtn.dart';
import 'package:vqa/services/models/nlxgpt.dart';

class output extends StatelessWidget {
  final String apiresult;

  output(this.apiresult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
      ),
      body: Center(
        child: Text(apiresult),
      ),
    );
  }
}
