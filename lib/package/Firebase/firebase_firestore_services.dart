
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telegram_clone/data/profile/profile_dto/profile_dto.dart';
import 'package:telegram_clone/domain/profile/model/profile_model.dart';

class FirebaseService {
  String collectionName = "Profile";
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void saveprofile(ProfileModel profile) async {

    String uid = profile.uid;
    DocumentReference userRef = firestore.collection(collectionName).doc(uid);
    DocumentSnapshot doc = await userRef.get();

    if (!doc.exists) {
      await userRef.set(profile.toJson()
       
      );
    }
  }

  Future<ProfileModel> getUserData(String uid) async {
    DocumentReference userRef = firestore.collection(collectionName).doc(uid);
    DocumentSnapshot doc = await userRef.get();
    return ProfileDto.fromJson(doc.data() as Map<String, dynamic>).toModel();
  }

}
