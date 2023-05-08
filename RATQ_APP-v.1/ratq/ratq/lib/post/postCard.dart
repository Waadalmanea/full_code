//import 'package:flutter/cupertino.dart';
// import 'dart:js';

import 'package:firebase_image/firebase_image.dart';
import 'package:ratq/post/postDetail_body.dart';

import 'package:flutter/material.dart';
//import '../../model/post.dart';
//import 'package:firebase_image/firebase_image.dart';

class PostCard extends StatelessWidget {
  final documentSnapshot;
  final String post_id;
  final String post_Name;
  final String post_Description;
  final String category;
  final String imageURL;

  const PostCard(
      {super.key,
        required this.documentSnapshot,
        required this.post_id,
        required this.post_Name,
        required this.post_Description,
        required this.category,
        required this.imageURL});

  /*const PostCard({
    Key? key,
    required this.itemIndex,
    required this.post,
    //required Null Function() press,
    //required this.press,
  }) : super(key: key);*/

  //final int itemIndex;
  //final Post post;
  //final Function press;

  void press(BuildContext cxt) {
    Navigator.of(cxt).push(
      MaterialPageRoute(
        builder: (c) => postDetail_body(
          post_id: post_id,
          post_Description: post_Description,
          category: category,
          documentSnapshot: documentSnapshot,
          post_Name: post_Name, imageURL: imageURL,
          //  post: posts[itemIndex],
        ),
      ),
    );
  }
  // final String photo = Get.find<FirebaseStorage

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: 170,
        width: 100,
        margin: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          color: Color(0x8d8DB792),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: InkWell(
            onTap: () => press(context),
            child: Stack(
              children: [
                Container(
                  height: 140.0,
                  width: 140.0,
                  margin: EdgeInsets.symmetric(
                    horizontal: 23,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffeaece1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  child: SizedBox(
                    // margin: EdgeInsets.only(top: 45, left: 45),
                      height: 78,
                      width: 100,
                      child:
                      Image(image: FirebaseImage(imageURL)
                      // 'gs://ratq-app.appspot.com/images/${widget.imageURL ?? '274'}.jpg'),

                      // Image.network(imageURL),
                      // Image.asset(imageURL)
                    // post.postImage,
                    // ),
                  ),
                ),
                ),Positioned(
                    top: 15,
                    right: -57,
                    child: SizedBox(
                      height: 136,
                      width: size.width - 100,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              post_Name,
                              //  post.postName,
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                  bottom: 16,
                  right: 55,
                  child: Container(
                    height: 26.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: Color(0xff8DB792),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: -97,
                    left: -50,
                    child: SizedBox(
                      height: 136,
                      width: size.width - 100,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'chat',
                              style: TextStyle(
                                  color: Color.fromRGBO(234, 236, 225, 0.85),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
              // ),
            )));
  }
}
