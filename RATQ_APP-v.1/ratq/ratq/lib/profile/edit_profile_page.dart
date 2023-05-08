import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'reset_password_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaece1),
      /* AppBar Settings */
      appBar: AppBar(
        backgroundColor: Color(0xff8DB792),

        /* BackButton Settings */
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 325, left: 25),
          child: BackButton(
            color: Color(0xffeaece1),
          ),  // onPressed:
        ),
        /* BackButton Settings */

        /* Title Settings */
        title: Padding(
          padding: const EdgeInsets.only(bottom: 325),
          child: Text(
            'Edit Profile',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Color(0xffeaece1)
            ),
          ),
        ),
        centerTitle: true,
        /* Title Settings */

        /*Three Dot Button Settings */
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            iconSize: 30,
            color: Color(0xffeaece1),
            padding: const EdgeInsets.only(bottom: 325, right: 25),
            itemBuilder: (context){
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Reset Password',
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ResetPasswordPage()));
                  break;
                case 1:
                  break;
              }
            },
          ),
        ],
        /*Three Dot Button Settings */

        /* Profile Picture Settings */
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(children: [
              Container(
                height: 280,
                child: Image.asset(
                  'images/avatar.png',
                  height: 235,
                  width: 235,
                ),
              ),
            ]),
          ),
        ),
        /* Profile Picture Settings */

        /* FrameShaping Settings */
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(175)
            )
        ),
        toolbarHeight: 400,
        // elevation: 0, // ~ Shadow
        /* FrameShaping Settings */

      ),
      /* AppBar Settings */

      body: Column(
        children: [
          // Email Adress (Text + Text Field)
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(right: 215),
            child: Text(
              'E-mail Adress',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),

          // Text Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffF4F5EC),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),



          // First Name (Text + Text Field)
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 245),
            child: Text(
              'First Name',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffF4F5EC),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // Last Name (Text + Text Field)
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 245),
            child: Text(
              'Last Name',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffF4F5EC),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          /* Save Changes Button */
          SizedBox(height: 30),
          TextButton(
            onPressed: (){},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 60.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Color(0xff8DB792),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Center(
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xffeaece1)
                    ),
                  ),
                ),
              ),
            ),
          ),
          /* Save Changes Button */

        ],
      ),
    );
  }
}
