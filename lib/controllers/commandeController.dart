import 'dart:async';
import 'dart:io' as io;
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:roomie/Command/Command.dart';
import 'package:roomie/views/Login/login.dart';

import '../resources/firebase_auth_constants.dart';
import 'auth_controller.dart';

class comandeContrller extends GetxController {
  static comandeContrller instance = Get.find();
  late Rx<User?> firebaseUser;

  String? selectedcnieliv;
  List listGender = ["Gender", "farah", "rachid", "bourigue", "hamadi"];
  //all textEditing controller of all input the commande
  TextEditingController budget = new TextEditingController();
  int capacitycounter = 0;
  TextEditingController capacity = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController equipment = new TextEditingController();
  TextEditingController regulations = new TextEditingController();
  TextEditingController Addresse = new TextEditingController();

  String? imageUri;
  // the image who selected
  File? image;
  //
  final picker = ImagePicker();

  List? Equipment;
  List? Regulation;
  late String EquipmentResult;
  late String RegulationResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());
  }

  setInitialScreen() {
    if (FirebaseAuth.instance.currentUser == null) {
      // if the user is not found then the user is navigated to the Register Screen
      return const Register();
    } else {
      return command();
    }
  }

  @override
  void onInit() {
    Equipment = [];
    EquipmentResult = '';
    Regulation = [];
    RegulationResult = '';
    super.onInit();
  }

  incrimenter() {
    capacitycounter++;
    update();
  }

  dincrimenter() {
    if (capacitycounter > 0) capacitycounter--;
    update();
  }

  saveForm() {
    var form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      EquipmentResult = Equipment.toString();
      RegulationResult = Regulation.toString();
    }
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

  Future uploadFile2(File? file, context) async {
    if (file == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No file was selected")));
      return null;
    }
    Random rand = new Random();
    image = File(file.path);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('photos')
        .child('/${DateTime.now().toIso8601String()}');
    UploadTask uploadTask = ref.putFile(image!);
    await uploadTask.whenComplete(() async {
      var url = await ref.getDownloadURL();
      this.imageUri = url.toString();
    }).catchError((onError) {
      print(onError);
    });
    update();
    return await ref.getDownloadURL();
  }

//add commande
  Future<void> addcommande(context) async {
    if (this.image != null) {
      String imgurl = await uploadFile2(this.image, context);
      await firebaseFirestore.collection('posts').doc().set({
        'budget': this.budget.text,
        'city': this.capacitycounter,
        'equipment': this.Equipment,
        'regulation': this.Regulation,
        'addresse': this.Addresse.text,
        'imageUri': imgurl,
        'createdon': Timestamp.now(),
      });
    } else {
      print("error");
    }
  }
}
