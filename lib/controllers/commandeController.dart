import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:roomie/views/Home/widgets/navigation.dart';

import '../resources/firebase_auth_constants.dart';

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
  RxList posts = [].obs;
  int lengthPost = 0;
  List currentPosts = [];
  List infouser = [];
  List infopost = [];
  List listAddress = [];
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
  void onInit() {
    getData();
    Equipment = [];
    EquipmentResult = '';
    Regulation = [];
    RegulationResult = '';
    super.onInit();
    // asyncTasks() async {
    //   await getData().then((value) => {
    //         setState(() {
    //           (value != null)
    //               ? [
    //                   Equipment = value['birthday'],
    //                   EquipmentResult = value['phone'],
    //                   regu = value['gender'].toString(),
    //                   textAbout.text = value['about'],
    //                   imageurl = value['profile'],
    //                 ]
    //               : CircularProgressIndicator();
    //         })
    //       });
  }

  incrimenter() {
    capacitycounter++;
    update();
  }

  initialState() {
    currentPosts = [];
    selectedcnieliv = null;
    image = null;
    budget.text = '';
    capacitycounter = 0;
    capacity.text = '0';
    city.text = '';
    equipment.text = '';
    regulations.text = '';
    Addresse.text = '';
    Equipment = [];
    EquipmentResult = '';
    Regulation = [];
    RegulationResult = '';
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
    final userID = FirebaseAuth.instance.currentUser!.uid;
    if (this.image != null) {
      String imgurl = await uploadFile2(this.image, context);
      var msg = await firebaseFirestore.collection('posts').doc(userID).set({
        'budget': this.budget.text,
        'capacity': this.capacitycounter,
        'city': this.selectedcnieliv,
        'equipment': this.Equipment,
        'regulation': this.Regulation,
        'addresse': this.Addresse.text,
        'imageUri': imgurl,
        "id_user": userID,
        'createdon': Timestamp.now(),
      });
      var snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Success!',
          message: 'your commande was created',
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Get.offAll(const MyNavigationBar());
    } else {
      var snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Ooh Error!',
          message: 'please fill all fields including image',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  getData() async {
    FirebaseFirestore.instance.collection("posts").snapshots().listen((event) {
      event.docs.forEach((element) async {
        if (element != null) {
          lengthPost++;
          var variable = await FirebaseFirestore.instance
              .collection('users')
              .doc(element.id)
              .get();
          print(variable.get("birthday"));
          infouser.add(variable);
          print(
              "--------------------------------------------------------------");

          // print(listAddress);
          if (FirebaseAuth.instance.currentUser != null) {
            if (element.id == FirebaseAuth.instance.currentUser!.uid) {
              currentPosts.add(element.data());
            }
          }

          print(element.id);
          posts.add(element.data().obs);
          print(getDataUer(element.id));
          print(element.data());
          // element.data().entries.forEach((e) async {
          List<Location> locations =
              await locationFromAddress('n 42 lot erraddad beni mellal');
          listAddress.add([locations[0].latitude, locations[0].longitude]);
          // });
        }
      });
      print(listAddress);
      print("--------------------------------------------------------------");
    });

    return posts;
  }

  Future getDataUer(userID) async {
    //current user id
    //collect the image name
    var variable =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    //a list of images names (i need only one)
    // var _file_name = variable['profile'];
    // return await _file_name.toString();
    return variable;
  }

  calculateAge(String birthDateString) {
    String datePattern = "yyyy-mm-dd";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int age = today.year - birthDate.year;
    int month1 = today.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = today.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
