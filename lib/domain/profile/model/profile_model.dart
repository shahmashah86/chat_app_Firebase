class ProfileModel {
  final String uid;
  final String name;
  final String phone;
 
  final String photoUrl;
   final String bio;

  ProfileModel({
    required this.uid,
    required this.name,
    required this.phone,
    required this.photoUrl,
     required this.bio,
  });


  Map<String, dynamic> toJson() {
    return<String,dynamic> {
      'uid': uid,
      'name': name,

      'phone': phone,

      'photoUrl': photoUrl,
      
      'bio': bio,
    };
  }
}