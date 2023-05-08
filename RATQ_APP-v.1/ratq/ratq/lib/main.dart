import 'package:auth_service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ratq/home/home_screen.dart';
import 'package:ratq/post/home_body.dart';
import 'package:ratq/profile/profile_page.dart';
import 'package:ratq/recycling_option/recycle_page.dart';
import 'DonationList/donation.dart';
import 'DonationList/donationList.dart';
import 'chat/authentication/bloc/authentication_bloc.dart';
import 'chat/chat_conv_scr.dart';
import 'chat/chat_cubit.dart';
import 'chat/sharedPrefs_helper.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final isLogged = (await sharedPrefsHelper.getUid()).isNotEmpty;
  runApp(MyApp(isLogged));
}

// RANA TEST


class MyApp extends StatelessWidget {
  const MyApp(this.isLogged, {Key? key}) : super(key: key);
  final bool isLogged;

  @override

      Widget build(BuildContext context) {
      return MultiBlocProvider(
          providers: [
          BlocProvider(create: (_)=> ChatCubit()),
      BlocProvider(create: (_)=> AuthenticationBloc(
      authService: FirebaseAuthService(
      authService: FirebaseAuth.instance,)
      )),
      ],

      child:MaterialApp(
        // theme: ThemeData(
        // visualDensity: VisualDensity.standard,
        // ),
        title: 'Ratq App',
        home:
        // ProfilePage(),
        homeScreen(),
        // HomedBody(),
        // ChatConvScr(),
        // recycle_page(),
        // donationList(),
        initialRoute: '/',
        // routes: {
        //   '/':(ctx)=> donation(),
        //   donationList.screenRoute:(ctx)=>donationList(),
        //   donation_details.screenRoute:(ctx)=>donation_details(),
        // },
      ));
  }
}
