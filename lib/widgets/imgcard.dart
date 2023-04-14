import 'dart:math';
import 'dart:io';
import 'package:vqa/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImgCard extends StatefulWidget {
  static var imageFile;

  const ImgCard({super.key});

  @override
  State<ImgCard> createState() => _ImgCardState();
}

class _ImgCardState extends State<ImgCard> {
  static File? imageFile;
  clearimage() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: imageFile == null
          ? Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(60, 80, 50, 80),
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.camera),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              fixedSize:
                                  MaterialStatePropertyAll(Size(120, 70))),
                          onPressed: () {
                            _getFromCamera();
                          },
                          label: Text('Camera'),
                        ),
                      ),
                      Container(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.upload_file),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40))),
                              fixedSize:
                                  MaterialStatePropertyAll(Size(123, 70))),
                          onPressed: () {
                            _getFromGallery();
                          },
                          label: Text('Upload'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.fromLTRB(104, 20, 104, 0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Image.file(
                    imageFile!,
                    //fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                  Container(
                    child: TextButton(
                      child: Text(
                        "Clear",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                      onPressed: () {
                        clearimage();
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
