import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'reset_password_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaece1),
      appBar: AppBar(
        backgroundColor: Color(0xff8DB792),
        toolbarHeight: 250,

        /* BackButton Settings */
        leading: Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 200),
          child: BackButton(
            color: Color(0xffeaece1),
            //onPressed: EditProfilePage(),
          ),
        ),
        /* BackButton Settings */

        /* Profile Picture Settings */
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(top: 100),
            //TODO Fix remove the comments and fix the error
            // child: Column(children: [
            //   Image.asset(
            //     'image/avatar.png',
            //     height: 120,
            //     width: 120,
            //   ),
            //   SizedBox(height: 10),
            //   TextButton(
            //     onPressed: () {},
            //     child: const Text(
            //       'Text Button ',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 20,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ]),
          ),
        ),
        /* Profile Picture Settings */

        /*Three Dot Button Settings */
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            iconSize: 30,
            color: Color(0xffeaece1),
            padding: const EdgeInsets.only(right: 25, bottom: 200),
            itemBuilder: (context){
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ];
            },
            onSelected: (value){
              switch(value){
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EditProfilePage()));
                  break;

                case 1:
                  break;
              }
            },
          ),
        ],
        /*Three Dot Button Settings */

        /* FrameShaping Settings */
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(120)
            )
        ),
        /* FrameShaping Settings */
      ),

      body:
      Column(
        //TODO Fix remove the comments and fix the error

        //   children: [
      //     SizedBox(height: 225),
      //     Text(
      //       'No posts yet...',
      //       style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 18,
      //           color: Colors.black38
      //       ),
      //     ),
      //     SizedBox(height: 190),
      //     Center(),
      //
      //   ],
      ),

      /* Bottom Appbar */
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
                    /* Home Page */
                  }
              ),
              IconButton(
                  iconSize: 35.0,
                  padding: EdgeInsets.only(right: 5.0),
                  icon: Icon(Icons.chat),
                  color: Color(0xffeaece1),
                  onPressed: () {

                    /* Chat Page */
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
      /* Bottom Appbar */
    );
  }
}

