

/*import 'package:first_app/model/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';*/

//import '../../model/post.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class postDetail_body extends StatelessWidget {
  final documentSnapshot;
  final String post_id;
  final String post_Name;
  final String post_Description;
  final String category;
  final String imageURL;

  const postDetail_body(
      {super.key,
        required this.documentSnapshot,
        required this.post_id,
        required this.post_Name,
        required this.post_Description,
        required this.category,
        required this.imageURL});
  /*final Post post;

  const postDetail_body({
    super.key,
    required this.post,
  });*/

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
                  margin: EdgeInsets.only(
                    bottom: 0,
                    top: 10,
                    left: 20,
                    right: 20,
                  ),
                  height: 580,
                  width: 360,
                  decoration: BoxDecoration(
                      color: Color(0x8d8DB792),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                  child: Stack(children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 30),
                      height: 78,
                      width: 100,
                      // color: Color(0xffeaece1),
                      child: Image.asset(
                        'image/user3.png',
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 50,
                      child: Column(
                        children: [
                          Text(
                            'User Name',
                            style:
                            TextStyle(fontSize: 32, color: Color(0xffEAECE1)),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Container(
                            height: 458,
                            width: 300,
                            margin: EdgeInsets.symmetric(
                              horizontal: 23,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xffEAECE1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                )),
                            child: Stack(children: [
                              Column(
                                children: [
                                  Center(
                                    child: Text(
                                      post_Name,
                                      //post.postName,
                                      style: TextStyle(fontSize: 36),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 60, left: 50),
                                height: 150,
                                width: 200,
                                child: Image.asset(imageURL
                                  //post.postImage,
                                ),
                              ),
                              Positioned(
                                top: 225,
                                left: 15,
                                child: Text(
                                  'description',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 250,
                                  left: 20,
                                ),
                                height: 200,
                                width: 259,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Color(0xffEAECE1),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    )),
                                child: (Text(
                                  ' ' + post_Description,
                                  //post.postDescription,
                                  style: TextStyle(fontSize: 18),
                                )),
                              ),
                            ])))
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
                child: InkWell(
                    child: Center(
                      child: Text(
                        'chat',
                        style: TextStyle(
                            color: Color.fromRGBO(234, 236, 225, 0.85), fontSize: 23),
                      ),
                    )),
              )
            ])));
  }
}
