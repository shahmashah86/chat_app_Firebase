import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepo {

Future<UserCredential> signInWithGoogle();
}
