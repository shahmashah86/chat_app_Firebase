import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:telegram_clone/domain/authentication/authentication_repo.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
      final AuthenticationRepo authenticationRepo;
  AuthenticationBloc(this.authenticationRepo) : super(AuthenticationInitial()) {

   on<AuthenticationByGoogle>(_signinWithGoogle);
   on<AuthernticationSignOut>(_signOut);
  }

  Future<void> _signinWithGoogle(AuthenticationByGoogle event, Emitter<AuthenticationState> emit)  async{
    try{
      emit(AuthenticationLoading());
     final response=await authenticationRepo.signInWithGoogle() ;

      emit(AuthenticationAuthenticated(userCredential: response)); 

    }
    catch(e){
      emit(AuthenticationFailed(e.toString()));
    }
  }
  Future<void> _signOut(AuthernticationSignOut event, Emitter<AuthenticationState> emit) async{
    try{
      emit(AuthenticationLoading());
      await authenticationRepo.signOut();
      emit(AuthenticationAuthenticated(userCredential: null)); 
    }
    catch(e){
      emit(AuthenticationFailed(e.toString()));
    }
  }
}
