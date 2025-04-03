// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:telegram_clone/domain/profile/model/profile_model.dart';
import 'package:telegram_clone/domain/profile/repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc(
    this.profileRepository,
  ) : super(ProfileInitial()) {
    on<ProfileSave>(_saveuser);
  }

  Future<void> _saveuser(ProfileSave event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      // save user data
      await profileRepository.saveUserData(event.profile);

      emit(ProfileLoaded(event.profile, 'Profile saved successfully'));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
