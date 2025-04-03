import 'package:telegram_clone/domain/profile/model/profile_model.dart';

abstract class ProfileRepository {
  Future<void> saveUserData(ProfileModel profile);
  Future<ProfileModel> getUserData(String uid);
}