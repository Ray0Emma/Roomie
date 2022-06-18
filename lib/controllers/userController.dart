import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/Home/widgets/navigation.dart';
import 'package:roomie/views/Login/login.dart';
import 'package:roomie/views/Profile/profile.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);

    // firebaseUser.bindStream(auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
  }

  setInitialScreen() async {
    if (await FirebaseAuth.instance.currentUser == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.to(const Register());
    } else {
      return const MyNavigationBar();
    }
  }

  var imageUrl = '';
  Future loadImage() async {
    if (FirebaseAuth.instance.currentUser != null) {
      //current user id
      final userID = FirebaseAuth.instance.currentUser!.uid;

      //collect the image name
      var variable = await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .get();

      //a list of images names (i need only one)
      // var _file_name = variable['profile'];

      // return await _file_name.toString();
      return variable;
    }
  }
}
