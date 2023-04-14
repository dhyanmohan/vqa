import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:vqa/pages/homepage.dart';
import 'package:vqa/pages/resultpage.dart';
import 'package:vqa/services/models/nlxgpt.dart';
import 'package:vqa/widgets/imgcard.dart';
import 'package:vqa/widgets/textfield.dart';

class SearchBtn extends StatefulWidget {
  static var makeRequest;

  SearchBtn({super.key});

  @override
  State<SearchBtn> createState() => _SearchBtnState();
}

class _SearchBtnState extends State<SearchBtn> {
  var _image = ImgCard.imageFile;
  var _text = TextIn.fieldText.text;
  var _fieldtext = TextIn.fieldText;
  final imgapi = ImgCard.imageFile;
  final apicall = apiCall.makeRequest();
  // final apires = apiCall.makeRequest.response.body;

  // final textapi = texx.TextIn.fieldText.text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
            fixedSize: MaterialStatePropertyAll(Size(200, 60))),
        onPressed: () async {
          final url = Uri.parse('https://anash-visual-qa.hf.space/run/predict');
          final response = await http.post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'data': [
                'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAACklEQVR4nGMAAQAABQABDQottAAAAABJRU5ErkJggg==',
                'hello world',
              ],
            }),
          );

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body)['data'];
            print(data);
            print('Request Success with status: ${response.statusCode}.');
            // Do something with data
          } else {
            print('Request failed with status: ${response.statusCode}.');
          }

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => output(
                      response.body,
                    )),
          );
          // sendUserData(textapi, imgapi);

          // uploadImage();
          // _postData();
          // makeRequest();
          // apicall;
        },
        child: Text('Search'),
      ),
    );
  }

  // Future<void> makeRequest() async {
  //   final url = Uri.parse('https://anash-visual-qa.hf.space/run/predict');
  //   final response = await http.post(
  //     url,
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({
  //       'data': [
  //         'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAACklEQVR4nGMAAQAABQABDQottAAAAABJRU5ErkJggg==',
  //         'hello world',
  //       ],
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body)['data'];
  //     print(data);
  //     print('Request Success with status: ${response.statusCode}.');
  //     // Do something with data
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }

  // Future<void> _postData() async {
  //   var url = Uri.parse('https://fawaz-nlx-gpt.hf.space/+/api/predict/');

  //   var request = http.MultipartRequest('POST', url);
  //   request.fields['text'] = _text;

  //   if (_image != null) {
  //     var stream = new http.ByteStream(_image.openRead());
  //     stream.cast();
  //     var length = await _image.length();
  //     var multipartFile = new http.MultipartFile('image', stream, length,
  //         filename: _image.path.split('/').last);
  //     request.files.add(multipartFile);
  //   }

  //   var response = await request.send();

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _fieldtext.clear();
  //       _image = File('');
  //     });
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //         title: Text('Success'),
  //         content: Text('Data uploaded successfully.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           )
  //         ],
  //       ),
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text('An error occurred while uploading data.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           )
  //         ],
  //       ),
  //     );
  //   }
  // }

//   Future sendUserData(String text, File? image) async {
//     var url = Uri.parse('https://anash-visual-qa.hf.space/run/predict');
//     var response = await http.post(url,
//         body: jsonEncode({
//           'text': text,
//           'image': image,
//         }));

//     if (response.statusCode == 200) {
//       // Successful response, parse the JSON data
//       return response.body;

//       // Do something with the data
//     } else {
//       print('gone');
//       // Error response, handle the error
//     }
//   }
// }
}
