import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ratq/post/category.dart';
import 'package:ratq/post/postDetail_body.dart';
import 'package:ratq/post/postCard.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addPost_body.dart';
import 'categoryCard.dart';

//import '../../model/post.dart';
//import '../../screens/postDetail.dart';

class HomedBody extends StatelessWidget {
  /*late String fpost_Name;
  late String fpost_Description;
  late String fcategory;
  late String fpost_id;
  late String fdocumentSnapshot;*/

  void pressAddPost(BuildContext cxt) {
    Navigator.of(cxt).push(MaterialPageRoute(builder: (c) => addPost()
      /* category: fcategory,
                  post_Description: fpost_Description,
                  post_Name: fpost_Name,
                  post_id: fpost_id,
                  documentSnapshot: fdocumentSnapshot,
                )*/
    )
      // post_Name: '', category: '', post_Description: '', post_id: '', documentSnapshot: data,
      // )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ScrollController controllerOne = ScrollController();
    //  final Categoryfilter = posts.where((element) => false).toList();

    return Scaffold(
      backgroundColor: Color(0xffeaece1),
      appBar: //homeAppBar(),
      AppBar(
          title: Text(
            'Recent Post',
          ),
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
          actions: [
            // CircleAvatar(
            //  radius: 30.0,
            //child:
            //  Material(

            //color: Colors.transparent,
            //child:
            InkWell(
                onTap: () => pressAddPost(context),
                child: Container(
                    width: 80,
                    height: 2,
                    margin: EdgeInsets.only(top: 10, bottom: 12, right: 5),
                    decoration: BoxDecoration(
                      color: Color(0xffeaece1),
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '+ Post',
                        // category.categoryName,
                        // 'All',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    )))
            //),
            // ),
          ]),

      body:
      //child: Scaffold(body:
      //Container(),),
      //bottom: false,
      //child:
      Stack(children: [
        /*  InkWell(
            // onTap: () => pressFilter(context),
            child: Container(
          width: 80,
          height: 40,
          margin: EdgeInsets.only(top: 10, left: 10),
          decoration: BoxDecoration(
            color: Color(0xff8DB792),
            border: Border.all(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Center(
            child: Text('+ Post'
                // category.categoryName,
                // 'All',
                // style: TextStyle(color: Color.fromRGBO(234, 236, 225, 0.85)),
                ),
          ),
        )),*/
        SizedBox(height: 2),
        //TODO Fix remove the comments and fix the error
        // Expanded(
        //   child: Stack(
        //     children: [
        //       StreamBuilder<QuerySnapshot>(
        //         stream:
        //         FirebaseFirestore.instance.collection("posts").snapshots(),
        //         builder: (context, snapshot) {
        //           return !snapshot.hasData
        //               ? Center(child: CircularProgressIndicator())
        //               : Scrollbar(
        //               thumbVisibility: true, //always show scrollbar
        //               thickness: 10, //width of scrollbar
        //               radius:
        //               Radius.circular(50), //corner radius of scrollbar
        //               scrollbarOrientation: ScrollbarOrientation.left,
        //               child: SingleChildScrollView(
        //                   child: Column(children: <Widget>[
        //                     GridView.builder(
        //                       shrinkWrap: true,
        //                       physics: NeverScrollableScrollPhysics(),
        //                       scrollDirection: Axis.vertical,
        //                       itemCount: snapshot.data!.docs.length,
        //                       itemBuilder: (context, index) {
        //                         DocumentSnapshot data =
        //                         snapshot.data!.docs[index];
        //                         return PostCard(
        //                           documentSnapshot: data,
        //                           post_id: data.id,
        //                           post_Name: data['post_name'],
        //                           post_Description: data['post_description'],
        //                           category: data['category'],
        //                           imageURL: data['imageURL'],
        //                         );
        //                       },
        //                       gridDelegate:
        //                       const SliverGridDelegateWithMaxCrossAxisExtent(
        //                           maxCrossAxisExtent: 200,
        //                           childAspectRatio: 6 / 7,
        //                           crossAxisSpacing: 20,
        //                           mainAxisSpacing: 20),
        //                     )
        //
        //                     /*ListView.builder(
        //                       shrinkWrap: true,
        //                       physics: NeverScrollableScrollPhysics(),
        //                       scrollDirection: Axis.vertical,
        //                       itemCount: snapshot.data!.docs.length,
        //                       itemBuilder: (context, index) {
        //                         DocumentSnapshot data =
        //                             snapshot.data!.docs[index];
        //                         return PostCard(
        //                             documentSnapshot: data,
        //                             post_id: data.id,
        //                             post_Name: data['post_name'],
        //                             post_Description: data['post_description'],
        //                             category: data['category']);*/
        //                     //},
        //                     //)
        //                   ])));
        //         },
        //       ),
        //       /* GridView.builder(
        //         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //             maxCrossAxisExtent: 200,
        //             childAspectRatio: 6 / 7,
        //             crossAxisSpacing: 20,
        //             mainAxisSpacing: 20),
        //         itemCount: posts.length,
        //         itemBuilder: (context, index) => PostCard(
        //           itemIndex: index,
        //           post: posts[index],
        //           /*  press: () {
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => DetailScreen(
        //                   post: posts[index],
        //                 ),
        //               ),
        //             );
        //           },*/
        //         ),
        //       ),*/
        //       Row(children: [
        //         SizedBox(
        //             height: 40,
        //             child: ListView.builder(
        //               shrinkWrap: true,
        //               scrollDirection: Axis.horizontal,
        //               itemCount: categorys.length,
        //               itemBuilder: (BuildContext context, int index) =>
        //                   CategoryCard(
        //                     itemIndex: index,
        //                     category: categorys[index],
        //                     //  )
        //                   ),
        //             )
        //
        //           /*   child: ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //
        //           itemBuilder: (context, index) =>
        //               CategoryCard(category: categorys[index]),
        //           //children: <Widget>[
        //           // CategoryCard(
        //           // itemIndex: categorys.length,
        //           //category: categorys[categorys.length],
        //         )*/
        //         )
        //       ])
        //       //  itemCount: 3,
        //       //itemBuilder: (context, index) => CategoryCard(
        //       //   itemIndex: index,
        //       //  category: categorys[index],
        //       //  ),
        //       //  )
        //       // ],
        //       // )
        //       /* Container(
        //       child: Row(
        //         children: [
        //           ListView.separated(
        //               scrollDirection: Axis.horizontal,
        //               itemCount: 3,
        //               separatorBuilder: (context, index) => CategoryCard(
        //                   itemIndex: index, category: categorys[index]),
        //               itemBuilder: (context, index) => CategoryCard(
        //                     itemIndex: index,
        //                     category: categorys[index],
        //                   ))*/
        //
        //       /*Container(
        //               width: 61.25,
        //               height: 26.25,
        //               margin: EdgeInsets.only(top: 10, left: 10),
        //               decoration: BoxDecoration(
        //                 color: Color(0xff8DB792),
        //                 border: Border.all(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                 ),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(30),
        //                 ),
        //               ),
        //               child: Center(
        //                 child: Text(
        //                   'All',
        //                   style: TextStyle(
        //                       color: Color.fromRGBO(234, 236, 225, 0.85)),
        //                 ),
        //               )),
        //           Container(
        //               width: 61.25,
        //               height: 26.25,
        //               margin: EdgeInsets.only(top: 10, left: 10),
        //               decoration: BoxDecoration(
        //                 color: Color(0xff8DB792),
        //                 border: Border.all(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                 ),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(30),
        //                 ),
        //               ),
        //               child: Center(
        //                 child: Text(
        //                   'Books',
        //                   style: TextStyle(
        //                       color: Color.fromRGBO(234, 236, 225, 0.85)),
        //                 ),
        //               )),
        //           Container(
        //               width: 61.25,
        //               height: 26.25,
        //               margin: EdgeInsets.only(top: 10, left: 10),
        //               decoration: BoxDecoration(
        //                 color: Color(0xff8DB792),
        //                 border: Border.all(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                 ),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(30),
        //                 ),
        //               ),
        //               child: Center(
        //                 child: Text(
        //                   'Tools',
        //                   style: TextStyle(
        //                       color: Color.fromRGBO(234, 236, 225, 0.85)),
        //                 ),
        //               )),
        //           Container(
        //               width: 65.25,
        //               height: 26.25,
        //               margin: EdgeInsets.only(top: 10, left: 10),
        //               decoration: BoxDecoration(
        //                 color: Color(0xff8DB792),
        //                 border: Border.all(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                 ),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(30),
        //                 ),
        //               ),
        //               child: Center(
        //                 child: Text(
        //                   'Furniture',
        //                   style: TextStyle(
        //                       color: Color.fromRGBO(234, 236, 225, 0.85)),
        //                 ),
        //               )),
        //           Container(
        //               width: 74,
        //               height: 26.25,
        //               margin: EdgeInsets.only(top: 10, left: 10),
        //               decoration: BoxDecoration(
        //                 color: Color(0xff8DB792),
        //                 border: Border.all(
        //                   color: Color.fromARGB(255, 0, 0, 0),
        //                 ),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(30),
        //                 ),
        //               ),
        //               child: Center(
        //                 child: Text(
        //                   'Electirunc',
        //                   style: TextStyle(
        //                       color: Color.fromRGBO(234, 236, 225, 0.85)),
        //                 ),
        //               )),*/
        //     ],
        //   ),
        // )
      ]),
      // ),
      /*  Container(
          child: Scaffold(
            body:
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Color(0xff8DB792),
            shape: CircularNotchedRectangle(),
            child: Container(
              height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    iconSize: 35.0,
                    padding: EdgeInsets.only(left: 28.0),
                    icon: Icon(Icons.home),
                    color: Color(0xffeaece1),
                    onPressed: () {
//home page
                      }
    ),
                  IconButton(
                    iconSize: 35.0,
                    padding: EdgeInsets.only(right: 5.0),
                    icon: Icon(Icons.chat),
                    color: Color(0xffeaece1),
                    onPressed: () {

//chat page
                      }),
                  IconButton(
                    iconSize: 35.0,
                    padding: EdgeInsets.only(right:40.0),
                    icon: Icon(Icons.person),
                    color: Color(0xffeaece1),
                    onPressed: () {
                        //profile page
                      })],
                  ),
            ),
              ),
          ),
        ) */
      //  ]),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff8DB792),
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  iconSize: 35.0,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.home),
                  color: Color(0xffeaece1),
                  onPressed: () {
//home page
                  }),
              IconButton(
                  iconSize: 35.0,
                  padding: EdgeInsets.only(right: 5.0),
                  icon: Icon(Icons.chat),
                  color: Color(0xffeaece1),
                  onPressed: () {
//chat page
                  }),
              IconButton(
                  iconSize: 35.0,
                  padding: EdgeInsets.only(right: 40.0),
                  icon: Icon(Icons.person),
                  color: Color(0xffeaece1),
                  onPressed: () {
                    //profile page
                  })
            ],
          ),
        ),
      ),
    );
  }
}
