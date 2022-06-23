// ignore_for_file: prefer_const_constructors

import 'dart:io' as io;
import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roomie/resources/app_colors.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/Home/widgets/navigation.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:roomie/views/Login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roomie/views/Profile/widgets/profileImage.dart';
import 'package:roomie/views/SignUp/signUp2.dart';
import 'package:roomie/views/SignUp/signUp3.dart';
import 'package:geocoding/geocoding.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  String? imageUri;
  // the image who selected
  io.File? _image;
  //
  final picker = ImagePicker();

  @override
  Future<void> onReady() async {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      // Get.offAll(() => const Register());
    } else {
      // we store our user informations in firestore
      // addUser(user);
      // if the user exists and logged in the the user is navigated to the Home Screen
      // Get.offAll(() => MyNavigationBar());
    }
  }

  void register(String email, password, name, context) async {
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = await auth.currentUser;
      addUser(user);
      var snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Fill Profile!',
          message: 'Please fill in your profile informations!',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Get.to(SignUp2());
      // print(user!.displayName);
    } on FirebaseAuthException catch (e) {
      // snackbarError1(e.message);
      Get.snackbar(
        "Error!",
        e.message.toString(),
        backgroundColor: AppColors.RED_COLOR.withOpacity(.7),
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // var snackbarError1 = snackbarError1(e.message);
      Get.snackbar(
        "Error!",
        e.message.toString(),
        backgroundColor: AppColors.RED_COLOR.withOpacity(.7),
      );
    }
  }

  void signOut() async {
    await auth.signOut();
  }

  void addUser(user) async {
    await firebaseFirestore.collection('users').doc(user?.uid).set({
      'id': user.uid,
      'name': user.displayName,
      'email': user.email,
      'createdon': Timestamp.now(),
    });
  }

  void fillProfile(profile, birthday, phone, gender, about, context) async {
    User? user = auth.currentUser;
    await firebaseFirestore.collection('users').doc(user!.uid).update({
      'profile': profile,
      'birthday': birthday,
      'phone': phone,
      'gender': gender,
      'about': about,
    });
  }

  void addInfo(
      status, languages, personality, lifestyle, hobbis, context) async {
    User? user = auth.currentUser;
    await firebaseFirestore.collection('users').doc(user!.uid).update({
      'status': status,
      'languages': languages,
      'personality': personality,
      'lifestyle': lifestyle,
      'hobbis': hobbis,
    });
    var snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Welcome!',
        message: 'You have filled you profile informations successfully!',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );

    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //method for adding the image using picker
  Future getImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return pickedFile;
    } else {
      return null;
    }
  }

//the method for aploading the image to firebase from gallery
  Future uploadFile(io.File? file, context) async {
    if (file == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No file was selected")));
      return null;
    }

    firebase_storage.UploadTask uploadTask;
    // Random rand = new Random();
    User? user = await auth.currentUser;

    _image = File(file.path);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('photos')
        .child('profile')
        .child(user!.uid);

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }
    uploadTask.snapshotEvents.listen((event) {});

    await uploadTask.whenComplete(() async {
      Navigator.pop(context);

      print('finished upload');
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text(await ref.getDownloadURL())));
    });

    return await ref.getDownloadURL();
  }
}
