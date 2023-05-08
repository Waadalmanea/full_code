import 'package:flutter/material.dart';


late final Color? backgroundColor;

class recycle_page extends StatefulWidget {
  const recycle_page({Key? key}) : super(key: key);

  // final String email;
  static const routeName = 'homePage';

  @override
  State<recycle_page> createState() => _RecyclePageState();
}

class _RecyclePageState extends State<recycle_page> {
  late String id;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xffeaece1),
            appBar:AppBar(
              backgroundColor:
              Color(0xff8DB792),
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
                width: double.maxFinite,
                child: Column(
                   // leading: IconButton(
                   //    iconSize: 15,
                   //    icon: Icon(
                   //      Icons.arrow_back_ios_new_outlined,
                   //      color: Color(0xffeaece1),
                   //    ),
                   //    onPressed: () =>
                   //        // Navigator.pop(context, false),
                   //  ),
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                          Container(
                              width: 141,
                              margin: EdgeInsets.only(top: 250),
                              padding: EdgeInsets.all(16),

                            ),

                      Container(
                        width: 300,
                          height:60 ,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Recycling suggestion',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Color.fromRGBO(234, 236, 225, 0.85))),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff8DB792)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                      ),
                      SizedBox(
                        height: 50, // <-- SEE HERE
                      ),
                      Container(
                        width: 300,
                        height:60 ,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Recycling Centers',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                  Color.fromRGBO(234, 236, 225, 0.85))),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff8DB792)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                    )]))));
  }
}
