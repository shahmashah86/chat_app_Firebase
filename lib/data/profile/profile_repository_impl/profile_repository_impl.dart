import 'package:telegram_clone/domain/profile/model/profile_model.dart';
import 'package:telegram_clone/domain/profile/repository/profile_repository.dart';
import 'package:telegram_clone/package/Firebase/firebase_firestore_services.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  @override
  Future<ProfileModel> getUserData(String userid) async {
    return await FirebaseService().getUserData(userid);

  }
  @override
  Future<void> saveUserData(ProfileModel profile)  async{
    FirebaseService().saveprofile(profile);

  }
}