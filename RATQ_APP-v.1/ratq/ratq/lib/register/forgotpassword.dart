import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ratq/register/authentication_service.dart';
import 'package:ratq/register/login_screen.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _authenticationService = AuthenticationService();

  late String email;
  late String password;
  late String password_2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
        titleTextStyle: const TextStyle(
            color: Color(0xffeaece1),
            fontWeight: FontWeight.bold,
            fontSize: 20),
        backgroundColor: const Color(0xff8DB792),
        toolbarHeight: 70,
        leading: IconButton(
          iconSize: 15,
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xffeaece1),
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      backgroundColor: const Color(0xffEAECE1),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //text
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50), //مسافه بين كلمة ساين اب و التكست فيلد

            //text feild

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '   Enter your email',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10)),
            //     child: TextField(
            //       onChanged: (value) {
            //         password = value;
            //       },
            //       obscureText: true,
            //       decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: '   Enter a new password',
            //       ),
            //     ),
            //   ),
            // ),

            // SizedBox(height: 10),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10)),
            //     child: TextField(
            //       onChanged: (value) {
            //         password_2 = value;
            //       },
            //       obscureText: true,
            //       decoration: InputDecoration(
            //         border: InputBorder.none,
            //         hintText: '   Re-enter the new password',
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 25),

            // button
            MaterialButton(
                elevation: 5.0,
                color: const Color(0xff8DB792),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                onPressed: () async {
                  //?this method will send an link to the email address user entered

                  bool result =
                      await _authenticationService.resetPassword(email);
                  if (result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'we sent a link to your email address use it to reset password',
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'some thing went wrong',
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Send request',
                  style: TextStyle(
                    color: Color.fromRGBO(234, 236, 225, 0.85),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
