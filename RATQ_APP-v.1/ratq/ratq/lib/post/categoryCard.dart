import 'package:ratq/post/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'filter_body.dart';

class CategoryCard extends StatelessWidget {
  final int itemIndex;
  final Category category;

  const CategoryCard(
      {super.key, required this.itemIndex, required this.category});

  void pressFilter(BuildContext cxt) {
    Navigator.of(cxt).push(
      MaterialPageRoute(builder: (c) => filterBody()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => pressFilter(context),
        child: Container(
            width: 65,
            // height: 10,
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
              child: Text(
                category.categoryName,
                // 'All',
                style: TextStyle(color: Color.fromRGBO(234, 236, 225, 0.85)),
              ),
            )));
  }
}
