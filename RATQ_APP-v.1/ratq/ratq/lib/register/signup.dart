import 'package:flutter/material.dart';
import 'package:ratq/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ratq/register/authentication_service.dart';
import 'package:ratq/widgets/custom_text_form_field.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _authenticationService = AuthenticationService();
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? fname;
  String? lname;
  String? password_2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //text
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                      height: 50), //مسافه بين كلمة ساين اب و التكست فيلد

                  //text feild

                  CustomTextFormField(
                    isPassword: false,
                    keyboardType: TextInputType.name,
                    hint: '   Enter your first name',
                    onChanged: (value) {
                      fname = value;
                    },
                    validator: (value) {
                      bool isValid = _authenticationService.validateName(value);
                      if (!isValid) {
                        return 'Name is not valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    isPassword: false,
                    keyboardType: TextInputType.name,
                    hint: '   Enter your last name',
                    onChanged: (value) {
                      lname = value;
                    },
                    validator: (value) {
                      bool isValid = _authenticationService.validateName(value);
                      if (!isValid) {
                        return 'Name is not valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    isPassword: false,
                    hint: '   Enter your email',
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (email) {
                      bool isValid =
                          _authenticationService.validateEmail(email);
                      if (!isValid) {
                        return 'Email is not valid';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),
                  CustomTextFormField(
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                    hint: '   Enter your password',
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (password) {
                      bool isValid = _authenticationService.validatePassword(
                        password: password,
                      );
                      if (!isValid) {
                        return "password must contains at least capital letter and symbol";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),
                  CustomTextFormField(
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                    hint: '   Enter your password again',
                    onChanged: (value) {
                      password_2 = value;
                    },
                    validator: (value) {
                      if (password != password_2) {
                        return "The two passwords does not equals";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  // button
                  MaterialButton(
                      elevation: 5.0,
                      color: const Color(0xff8DB792),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      onPressed: () async {
                        bool valid = formKey.currentState!.validate();
                        if (valid) {
                          try {
                            String? result = await _authenticationService
                                .signUpWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                            if (result != null) {
                              String? logInResult = await _authenticationService
                                  .loginWithEmailAndPassword(
                                email: email!,
                                password: password!,
                              );
                              if (logInResult != null) {
                                await _authenticationService.addUserData(
                                  firstName: fname!,
                                  lastName: lname!,
                                  email: email!,
                                );
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return homeScreen();
                                    },
                                  ),
                                );
                              }
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color.fromRGBO(234, 236, 225, 0.85),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
