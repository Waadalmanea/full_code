import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ratq/post/postCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class filterBody extends StatefulWidget {
  // static const routeName = 'filterBody';
  @override
  _filterBodyState createState() => _filterBodyState();
}

class _filterBodyState extends State<filterBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
              child: CircularProgressIndicator(),
            )
                : GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 6 / 7,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, Index) {
                  var data = snapshots.data!.docs[Index];

                  // if (data('category').toString().contains('Book')) {}
                });
          },
        ));
  }
}
/*
    Size size = MediaQuery.of(context).size;
    //  final Categoryfilter = posts.where((element) => false).toList();
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    final categoryID = routeArgument['id'];
    // final postTitle = routeArgument['postName'];
    final filterdPosts = posts.where((Post) {
      return Post.categoryss.contains(categoryID);
    }).toList();

    return SafeArea(
      bottom: false,
      child: Column(children: [
        // Container(
        //  child: LayoutBuilder(builder: (con)),
        // )

        ListView.builder(
          //  itemBuilder: (context, index) => ,
          itemBuilder: (ctx, index) {
            return Text(filterdPosts[index].postName.toString());
            //CategoryCard(category: filterdPosts[index], itemIndex: index,);
          },
          itemCount: filterdPosts.length,
        ),
      ]),
    );
  }
}*/
