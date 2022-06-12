import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:roomie/resources/firebase_auth_constants.dart';
import 'package:roomie/views/Home/home.dart';
import 'package:roomie/views/Login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  // late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);
    // googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    // googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    // ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const Register());
    } else {
      firebaseFirestore.collection('users').doc(user.uid).set({
        'id': user.uid,
        'email': user.email,
        'createdon': Timestamp.now(),
      });
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => HomePage());
    }
  }

  // _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
  //   print(googleSignInAccount);
  //   if (googleSignInAccount == null) {
  //     // if the user is not found then the user is navigated to the Register Screen
  //     Get.offAll(() => const Register());
  //   } else {
  //     // if the user exists and logged in the the user is navigated to the Home Screen
  //     Get.offAll(() => Home());
  //   }
  // }

  // void signInWithGoogle() async {
  //   try {
  //     GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

  //     if (googleSignInAccount != null) {
  //       GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;

  //       AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );

  //       await auth
  //           .signInWithCredential(credential)
  //           .catchError((onErr) => print(onErr));
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       "Error",
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     print(e.toString());
  //   }
  // }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    await auth.signOut();
  }

  // void addUser(User? user) async {
  //   await firebaseFirestore.collection('users').add({
  //     'Name': user?.displayName!,
  //     'createdon': Timestamp.now(),
  //   });
  // }
}
