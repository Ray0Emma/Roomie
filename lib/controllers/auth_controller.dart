// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/Home/widgets/navigation.dart';
import 'package:roomie/views/Login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../views/Command/Command.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
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
      Get.offAll(() => const Register());
    } else {
      // we store our user informations in firestore
      addUser(user);
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => MyNavigationBar());
    }
  }

  void register(String email, password, name) async {
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
      // print(user!.displayName);
    } catch (e) {
      print(e);
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    await auth.signOut();
  }

  void addUser(User? user) async {
    await firebaseFirestore.collection('users').doc(user!.uid).set({
      'id': user.uid,
      'name': user.displayName,
      'email': user.email,
      'createdon': Timestamp.now(),
    });
  }
}
