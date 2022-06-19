import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  var user = FirebaseAuth.instance.currentUser;

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
      return variable;
    }
  }

  Future getData() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(user?.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();

      print(data);
      // name = data?['name']; // <-- The value you want to retrieve.
      // Call setState if needed.

      return data;
    }
  }
}
