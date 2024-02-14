
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipes/colors/recipe_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../shared/my_shared.dart';
import '../../shared/my_shared_keys.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  String imageUrl = '';
  bool uploading = false;

  @override
  void initState() {
    super.initState();
    getProfileDataFromLocalSource();
    getUserData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RecipesColor.secondColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile",style: TextStyle(fontSize: 20.sp),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (imageUrl.isEmpty)
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => pickImage(),
                child: const CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    size: 45,
                  ),
                ),
              )
            else
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 30,
                  ),
                  Visibility(
                    visible: uploading,
                    child: const CircularProgressIndicator(),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration:  InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: RecipesColor.firstColor),
                border: const OutlineInputBorder(),
                 fillColor: Colors.grey[900],
                filled: true,
                prefixIcon: Icon(Icons.person,color: RecipesColor.firstColor,),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: phoneController,
              textInputAction: TextInputAction.next,
              maxLength: 11,
              keyboardType: TextInputType.phone,
              decoration:  InputDecoration(
                labelText: 'Phone',
                labelStyle: TextStyle(color: RecipesColor.firstColor),
                border: const OutlineInputBorder(),
                fillColor: Colors.grey[900],
                filled: true,
                prefixIcon: Icon(Icons.phone,color: RecipesColor.firstColor,),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              enabled: false,
              controller: emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email),
                labelStyle: TextStyle(color: RecipesColor.firstColor),
                fillColor: Colors.grey[600],
                filled: true,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => saveUserData(),
                style: ElevatedButton.styleFrom(shape: const StadiumBorder(),backgroundColor: RecipesColor.firstColor),
                child: const Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveUserData() {
    Navigator.pop(context);
    final userId = auth.currentUser!.uid;
    final data = {
      'name': nameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'image':imageUrl,
    };

    fireStore.collection("users").doc(userId).update(data).then((value) => Navigator.pop(context));
  }
  void getUserData() {
    fireStore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      updateUi(value.data()!);
      saveProfileDataInLocalSource(value.data()!);
    }).catchError((error) {});
  }
  Future<void> saveProfileDataInLocalSource(Map<String, dynamic> data) async {
    final jsonData = jsonEncode(data);
    PreferenceUtils.setString(PrefKeys.profileData, jsonData);
  }
  void getProfileDataFromLocalSource() async {
    final jsonData = PreferenceUtils.getString(PrefKeys.profileData);
    final data = jsonDecode(jsonData);
    updateUi(data);
  }
  void updateUi(Map<String, dynamic> data) {
    nameController.text = data['name'];
    phoneController.text = data['phone'];
    emailController.text = data['email'];

    imageUrl = data['imageUrl'];
    setState(() {});
  }

  // Select image from gallery
  // Upload Image to Firebase storage
  // Get ImageUrl from Firebase storage
  // Save ImageUrl to Firebase Firestore Database
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? file = await picker.pickImage(source: ImageSource.camera);

   File image = File(file!.path);

    uploadImage(image);
    setState(() {
    });

  }

  void uploadImage(File image) {
    setState(() {
      uploading = true;
    });
    final userId = auth.currentUser!.uid;


    storage.ref("profileImages/$userId").putFile(image).then((value) {
      if (kDebugMode) {
        print('uploadImage => SUCCESS');
      }
      getImageUrl();
    }).catchError((error) {
      setState(() {
        uploading = false;
      });
      if (kDebugMode) {
        print('uploadImage => $error');
      }


    });
  }

  void getImageUrl() {
    final userId = auth.currentUser!.uid;

    storage.ref("profileImages/$userId").getDownloadURL().then((value) {
      if (kDebugMode) {
        print('getImageUrl => $value');
      }
      setState(() {
        imageUrl = value;
        uploading = false;
      });
      saveImageUrl(imageUrl);
    }).catchError((error) {
      if (kDebugMode) {
        print('getImageUrl => $error');
      }
    });
  }
  void saveImageUrl(String imageUrl) {
    final userId = auth.currentUser!.uid;

    fireStore.collection("users").doc(userId).update({
      'imageUrl': imageUrl,
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

}