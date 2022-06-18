import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

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
