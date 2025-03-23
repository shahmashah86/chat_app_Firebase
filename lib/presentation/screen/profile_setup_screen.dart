import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telegram_clone/package/Firebase/firebase_auth_services.dart';



class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
   final FirebaseAuthService _authService = FirebaseAuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   final ImagePicker _picker = ImagePicker();

  ValueNotifier<File?> selectedImage = ValueNotifier(null);

Future<void> getImage() async {
  try {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
      log("Image picked: ${selectedImage.value}", name: 'ImagePicker');
    } else {
      log("No image selected", name: 'ImagePicker');
    }
  } catch (e) {
    log("Error picking image: $e", name: 'ImagePicker');
  }
}

  late final TextEditingController nameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController bioController;
  @override
  void initState() {
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    bioController = TextEditingController();
    super.initState();
  }
  
  
  Future<void> _saveUserData(Map<String, dynamic> user) async {
  try {
    String uid = _auth.currentUser!.uid;
    DocumentReference userRef = _firestore.collection('users').doc(uid);
    DocumentSnapshot doc = await userRef.get();

    if (!doc.exists) {
      await userRef.set({
        'uid': uid,
        'name': user['name'],
        'phone': user['phone'],
        'bio': user['bio'],
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("User data saved successfully!")),
    );
  } catch (e) {
    print("Firestore Error: $e");  // Debugging
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to save data. Check connection.")),
    );
  }
}

  //   Future<void> _saveUserData(Map<String,dynamic> user) async {
  //      String uid = _auth.currentUser!.uid;
  //   DocumentReference userRef = _firestore.collection('users').doc(uid);
  //   DocumentSnapshot doc = await userRef.get();

  //   if (!doc.exists) {
  //     await userRef.set({
  //       'uid': uid,
  //       'name': user['name'],
  //       'phone': user['phone'],
  //       // 'email': user.email,
  //       // 'photoUrl': user.photoURL,
     
  //       'bio': user['bio'],
  //     });
  //   }
  // }

  Future<DocumentSnapshot?> getUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return _firestore.collection('users').doc(user.uid).get();
    }
    return null;
  }

  // Future<void> _updateUserData() async {
  //   String uid = _auth.currentUser!.uid;
  //   await _firestore.collection('users').doc(uid).update({
  //     'name': nameController.text,
  //     'phone': phoneNumberController.text,
  //     'bio': bioController.text,
  //   });
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text("Profile updated successfully!")),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 62, 248) ,
        
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          GestureDetector(onTap:()async {
           await getImage();
          },
            child: CircleAvatar(
              radius: 55,
              child: ValueListenableBuilder<File?>(
                valueListenable: selectedImage,
                builder: (context, value, child) {
                  return value == null
                      ? Icon(
                          Icons.camera_alt,
                          size: 30,
                        )
                      : Image.file(
                          value,
                          fit: BoxFit.cover,
                        );
                },
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.black54)),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(controller: phoneNumberController,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Phone Number",
                hintStyle: TextStyle(color: Colors.black54)),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(controller: bioController,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Bio",
                hintStyle: TextStyle(color: Colors.black54)),
          ),
           SizedBox(
            height: 20,
          ),
          TextButton(onPressed: (){
            final user = {
              'name': nameController.text,
              'phone': phoneNumberController.text,
              'bio': bioController.text,
            };

        _saveUserData(user);
            
          }, child: Text("Save",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}
