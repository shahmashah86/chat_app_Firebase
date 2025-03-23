import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:telegram_clone/firebase_options.dart';
import 'package:telegram_clone/injection/di.dart' as di;
import 'package:telegram_clone/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:telegram_clone/presentation/screen/signin.dart';

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
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Login(),
            ));
  }
}
