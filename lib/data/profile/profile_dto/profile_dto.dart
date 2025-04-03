
import 'package:telegram_clone/domain/profile/model/profile_model.dart';

class ProfileDto {
  final String name;
  final String phone;
  final String photoUrl;
  final String bio;
  final String uid;

  ProfileDto({required this.name, required this.phone, required this.photoUrl, required this.bio,required this.uid});
 
  factory ProfileDto.fromJson(Map<String, dynamic> map) {
    return ProfileDto(
      name: map['name'] as String,
      phone: map['phone'] as String,
      photoUrl: map['photoUrl'] as String,
      bio: map['bio'] as String,
      uid: map['uid'] as String,
    );
  }

  ProfileModel toModel() {
    return ProfileModel(
      name: name,
      phone: phone,
      photoUrl: photoUrl,
      bio: bio,
      uid: uid,
    );

      }
}
