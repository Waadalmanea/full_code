import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'edit_profile_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaece1),
      appBar: AppBar(
        backgroundColor: Color(0xff8DB792),
        toolbarHeight: 70,
        /* BackButton Settings */
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: BackButton(
            color: Color(0xffeaece1),
          ),  // onPressed:
        ),
        /* BackButton Settings */

        /* Title Settings */
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'Reset Password',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Color(0xffeaece1)
            ),
          ),
        ),
        centerTitle: false,
        /* Title Settings */

        /*Three Dot Button Settings */
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              iconSize: 30,
              color: Color(0xffeaece1),
              padding: const EdgeInsets.only(right: 25),
              itemBuilder: (context){
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ];
              }
          ),
        ],
        /*Three Dot Button Settings */
      ),

      body: Column(
        children: [

          /* Old Password Settings */
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(right: 215),
            child: Text(
              'Old Password:',
              textAlign: TextAlign.left,
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
          /* Old Password Settings */
          SizedBox(height: 50),

          /* LINE */
          Container(
            height: 1,
            width: 450,
            color: Colors.black38,
          ),
          /* LINE */

          /* New Password Settings */
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(right: 205),
            child: Text(
              'New Password:',
              textAlign: TextAlign.left,
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
          /* New Password Settings */

          /* New Repeat Password Settings */
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 130),
            child: Text(
              'Repeat New Password:',
              textAlign: TextAlign.left,
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
          /* New Repeat Password Settings */

          /* Save Changes Button */
          SizedBox(height: 50),
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
