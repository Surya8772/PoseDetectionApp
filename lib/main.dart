import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ImagePicker imagePicker;
  File? _image;

  //TODO declare detector
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    //TODO initialize detector

  }

  @override
  void dispose() {
    super.dispose();
  }

  //TODO capture image using camera
  _imgFromCamera() async {
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      doPoseDetection();
    }
  }

  //TODO choose image using gallery
  _imgFromGallery() async {
    XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      doPoseDetection();
    }
  }

  //TODO pose detection code here
  doPoseDetection() async {
    setState(() {
      _image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              //TODO display image
              Container(
                margin: const EdgeInsets.only(top: 100),
                child:
                Container(
                  child: _image != null
                      ? Center(
                          child: Image.file(_image!,height: MediaQuery.of(context).size.height - 300,)
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height - 300,
                          child: Image.asset('images/bg.jpg'),
                        ),
                ),
              ),

              //TODO bottom section
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _imgFromGallery();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.photo,
                              color: Colors.black,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.limeAccent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _imgFromCamera();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera,
                              color: Colors.black,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

