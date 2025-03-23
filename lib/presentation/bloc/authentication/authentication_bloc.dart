import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:telegram_clone/domain/authentication/authentication_repo.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
      final AuthenticationRepo authenticationRepo;
  AuthenticationBloc(this.authenticationRepo) : super(AuthenticationLoading()) {

   on<AuthenticationByGoogle>(_signinWithGoogle);
  }

  FutureOr<void> _signinWithGoogle(AuthenticationByGoogle event, Emitter<AuthenticationState> emit)  async{
    try{
     final response=await authenticationRepo.signInWithGoogle() ;

      emit(AuthenticationAuthenticated(userCredential: response)); 

    }
    catch(e){
      emit(AuthenticationFailed(e.toString()));
    }
  }
}
