import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ratq/chat/chat_conv_scr.dart';
import 'package:ratq/post/home_body.dart';
import 'package:ratq/profile/profile_page.dart';
import 'package:ratq/register/login_screen.dart';
import 'package:ratq/DonationList/donationList.dart';

import '../recycling_option/recycle_page.dart';

void main() {
  runApp(
    homeScreen(),
  );
}

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  final _auth = FirebaseAuth.instance;
  late User signedInUser;

  //void initState() {
  // super.initState();
  // getCurrentUser();
  //}

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
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
        backgroundColor: Color(0xffeaece1),
        body: Center(
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  color: const Color(0xffEAECE1),
                  margin: EdgeInsets.fromLTRB(60, 90, 40, 50),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),
              ),

              MaterialButton(
                  elevation: 5.0,
                  color: Color(0xff8DB792),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: const Text(
                    ' Donate ',
                    style: TextStyle(
                      color: Color.fromRGBO(234, 236, 225, 0.85),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return donationList();
                        },
                      ),
                    );
                  }),
              SizedBox(
                height: 50,
              ),
              //Reuse
              MaterialButton(
                  elevation: 5.0,
                  color: Color(0xff8DB792),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: const Text(
                    'Recycle',
                    style: TextStyle(
                      color: Color.fromRGBO(234, 236, 225, 0.85),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () async {
                    //Navigate Recycle page recycle_page
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return recycle_page();
                        },
                      ),
                    );
                  }),
              SizedBox(
                height: 50,
              ),
              //Donate
              MaterialButton(
                elevation: 5.0,
                color: Color(0xff8DB792),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: const Text(
                  '  Reuse  ',
                  style: TextStyle(
                    color: Color.fromRGBO(234, 236, 225, 0.85),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                onPressed: () async {
                  //Navigate Reuse page (HomedBody)

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomedBody()));
                },
              ),
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const logInScreen();
                  }));
                },
                child: const Text(
                  'Login                                                                        ',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return homeScreen();
                          },
                        ),
                      );
                    }),
                IconButton(
                    iconSize: 35.0,
                    padding: EdgeInsets.only(right: 5.0),
                    icon: Icon(Icons.chat),
                    color: Color(0xffeaece1),
                    onPressed: () {
//chat page
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ChatConvScr();
                          },
                        ),
                      );
                    }),
                IconButton(
                    iconSize: 35.0,
                    padding: EdgeInsets.only(right: 40.0),
                    icon: Icon(Icons.person),
                    color: Color(0xffeaece1),
                    onPressed: () {
                      //profile page
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
                          },
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
