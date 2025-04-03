import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegram_clone/presentation/screen/chat_screen.dart';
import 'package:telegram_clone/presentation/screen/signin.dart';
import 'package:telegram_clone/presentation/screen/tabbar.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
  //          FirebaseAuth.instance
  // .authStateChanges()
  // .listen((User? user) {
  //   if (user == null) {
  //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
  //       return Login();
  //     }), (route) => false);
  //     log('User is currently signed out!');
  //   return;
  //   } else {
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
  //       return Tabbar();
  //     }), (route) => false);
  //     // Navigator.push( context, MaterialPageRoute(builder: (context){
  //     //   return Tabbar();
  //     // }));
  //     log('User is signed in! $user');
  //   }
  // });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Tabbar( );
  }
}