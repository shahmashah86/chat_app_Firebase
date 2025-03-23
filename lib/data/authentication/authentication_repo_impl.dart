import 'package:firebase_auth/firebase_auth.dart';
import 'package:telegram_clone/domain/authentication/authentication_repo.dart';
import 'package:telegram_clone/package/Firebase/firebase_auth_services.dart';


class AuthenticationRepoImpl implements AuthenticationRepo{
  @override
  Future<UserCredential> signInWithGoogle()  async{
   return  await FirebaseAuthService().signinWithGoogle();
   

  }
}