import 'dart:io';
import 'dart:math';

import 'package:ratq/post/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'home_body.dart';

class addPost extends StatefulWidget {
  /*final String post_Name;
  final String post_Description;
  final String category;
  final String post_id;
  final DocumentSnapshot documentSnapshot;*/
  static const routeName = 'addPost_body';

  //const addPost({super.key, required this.post_Name, required this.post_Description, required this.category, required this.post_id, required this.documentSnapshot, });

  //addPost(String post_name, String post_description);

  //const addPost(String post_name, {Key? key}) : super(key: key);

  @override
  _addPostState createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  late String post_Name;
  late String post_Description;
  late String category;
  late String post_id;
  String imageURL = '';
  final items = ["Tools", 'Books', 'Electronic', 'Furniture', 'others'];
  String? value;

  Future<void> uploadPost(String post_name, String post_description,
      String category, String postID, String imageURL) async {
    await FirebaseFirestore.instance.collection("posts").add({
      'post_name': post_name,
      'post_description': post_description,
      'category': category,
      'post_id': postID,
      'imageURL': imageURL
    });
  }

  String generateRandomString(int lengthOfString) {
    final random = Random();
    const allChars =
        'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
    // below statement will generate a random string of length using the characters
    // and length provided to it
    final randomString = List.generate(lengthOfString,
            (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString; // return the generated string
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0xffeaece1),
        appBar: AppBar(
          titleTextStyle: TextStyle(
              color: Color(0xffeaece1),
              fontWeight: FontWeight.bold,
              fontSize: 20),
          backgroundColor: Color(0xff8DB792),
          toolbarHeight: 70,
          leading: IconButton(
            iconSize: 15,
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xffeaece1),
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Container(
            child: Column(children: [
              Container(
                  height: 501,
                  width: 350,
                  margin: EdgeInsets.only(top: 50, left: 20),
                  decoration: BoxDecoration(
                    color: Color(0x8d8DB792),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Column(children: <Widget>[
                    Container(
                      width: 160,
                      margin: EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 10,
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Enter post name',
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        ),
                        onChanged: (value) {
                          post_Name = value;
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);

                        if (file == null) return;
                        Reference referenceRoot = FirebaseStorage.instance.ref();
                        Reference referenceDirImages = referenceRoot.child('');
                        Reference ImageToUpload =
                        referenceDirImages.child('${file.name}');

                        try {
                          await ImageToUpload.putFile(File(file.path));
                          imageURL = await ImageToUpload.getDownloadURL();
                        } catch (error) {}
                        ;
                      },
                      child: Align(
                          alignment: FractionalOffset.topLeft,
                          child: Container(
                            height: 140.0,
                            width: 140.0,
                            margin: EdgeInsets.symmetric(
                              horizontal: 23,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffeaece1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 0,
                                    // vertical: 5,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("+",
                                      style: TextStyle(
                                        fontSize: 110,
                                        color: Color(0xffC5C9BE),
                                      )),
                                )
                              ],
                            ),
                          )),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color:
                        Color(0xffeaece1), //background color of dropdown button
                        border: Border.all(
                            color: Colors.black38,
                            width: 1), //border of dropdown button
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: DropdownButton(
                            value: value,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            hint: Text("choose category:"),
                            //  style: ,

                            onChanged: (String? newValue) {
                              setState(() {
                                category = newValue!;
                              });
                            },
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        style: TextStyle(
                          // fontSize: 40,
                          // height: 12,
                        ),
                        decoration: InputDecoration(
                          //contentPadding:
                          // EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'write description',
                        ),
                        maxLines: 5, // <-- SEE HERE
                        minLines: 5,
                        onChanged: (value) {
                          post_Description = value;
                        },
                      ),
                    )
                  ])),
              Container(
                height: 40,
                width: 153,
                margin: EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff8DB792),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    post_id = generateRandomString(10);
                    uploadPost(
                        post_Name, post_Description, category, post_id, imageURL);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomedBody()));
                  },
                  // child: Center(
                  child: Text(
                    'Post',
                    style: TextStyle(
                        color: Color.fromRGBO(234, 236, 225, 0.85), fontSize: 23),
                  ),
                  //)
                ),
              )
            ])));
  }
}
