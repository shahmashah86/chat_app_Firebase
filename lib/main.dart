import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:telegram_clone/firebase_options.dart';
import 'package:telegram_clone/injection/di.dart' as di;
import 'package:telegram_clone/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:telegram_clone/presentation/bloc/profile/profile_bloc.dart';
import 'package:telegram_clone/presentation/screen/signin.dart';
import 'package:telegram_clone/presentation/screen/splashscreen.dart';
import 'package:telegram_clone/presentation/screen/tabbar.dart';

void main() async {
  di.setup();
  WidgetsFlutterBinding.ensureInitialized();

// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider.value(value: di.getIt<AuthenticationBloc>()),
      BlocProvider.value(value: di.getIt<ProfileBloc>())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
 
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Splashscreen(),
            ));
  }
}
