import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPrefsHelper sharedPrefsHelper = const SharedPrefsHelper();
class SharedPrefsHelper{
  const SharedPrefsHelper();

  get sharedPrefs async => await SharedPreferences.getInstance();

  Future<void> setIsLogin(bool isLogin) async{
    SharedPreferences sharedPreferences = await sharedPrefs;
    sharedPreferences.setBool('isLogin', isLogin);
  }

  Future<bool> getIsLogin() async{
    SharedPreferences sharedPreferences = await sharedPrefs;
    return sharedPreferences.getBool('isLogin') ??false;
  }

  Future<void> setUid(String uid) async{
    SharedPreferences sharedPreferences = await sharedPrefs;
    sharedPreferences.setString('uid', uid);
  }

  Future<String> getUid() async{
    SharedPreferences sharedPreferences = await sharedPrefs;
    return sharedPreferences.getString('uid') ?? '';
  }

}
