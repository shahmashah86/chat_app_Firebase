import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:telegram_clone/core/theme/app_colors.dart';
import 'package:telegram_clone/domain/profile/model/profile_model.dart';
import 'package:telegram_clone/package/Firebase/firebase_auth_services.dart';
import 'package:telegram_clone/presentation/bloc/profile/profile_bloc.dart';
import 'package:telegram_clone/presentation/screen/chat_screen.dart';
import 'package:telegram_clone/presentation/screen/tabbar.dart';

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
  final key = GlobalKey<FormState>();

  ValueNotifier<File?> selectedImage = ValueNotifier(null);

  Future<void> getImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Form(
        key: key,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            GestureDetector(
              onTap: () async {
                await getImage();
              },
              child: CircleAvatar(
                radius: 14.5.w,
                child: ValueListenableBuilder<File?>(
                  valueListenable: selectedImage,
                  builder: (context, value, child) {
                    return value == null
                        ? Icon(
                            Icons.camera_alt,
                            size: 12.w,
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
              height: 2.2.h,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              controller: nameController,
              decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo.shade500),
                      borderRadius: BorderRadius.circular(15)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.indigo.shade100)),
                  errorStyle: TextStyle(color: Colors.indigo.shade500),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo.shade100),
                      borderRadius: BorderRadius.circular(15)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo.shade50),
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.black54)),
            ),
            SizedBox(
              height: 3.3.h,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              controller: phoneNumberController,
              decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo.shade500),
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo.shade100),
                      borderRadius: BorderRadius.circular(15)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.indigo.shade100)),
                  errorStyle: TextStyle(color: Colors.indigo.shade500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.indigo.shade50),
                  ),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.black54)),
            ),
            SizedBox(
              height: 3.3.h,
            ),
            TextFormField(
              controller: bioController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo.shade100),
                      borderRadius: BorderRadius.circular(15)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "Bio",
                  hintStyle: TextStyle(color: Colors.black54)),
            ),
            SizedBox(
              height: 3.h,
            ),
            BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is ProfileError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message,
                        style: TextStyle(
                            color: Colors.white), // White text for contrast
                      ),
                      backgroundColor: Colors.indigo.shade700,
                      duration: Duration(seconds: 3),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }
                  if (state is ProfileLoaded) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Tabbar()));
                }
              },
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return CircularProgressIndicator();
                }
              
                return TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo.shade100),
                    ),
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        String uid = _auth.currentUser!.uid;
                        final profile = ProfileModel(
                            uid: uid,
                            name: nameController.text.trim(),
                            phone: phoneNumberController.text.trim(),
                            photoUrl: '',
                            bio: bioController.text.trim());
                        context.read<ProfileBloc>().add(ProfileSave(profile));
                      }
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 19.sp,
                      ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
