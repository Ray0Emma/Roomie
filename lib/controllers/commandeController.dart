import 'dart:async';
import 'dart:io' as io;
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';



class comandeContrller extends GetxController{

  //all textEditing controller of all input the commande
  TextEditingController budget=new TextEditingController();
  TextEditingController capacity=new TextEditingController();
  TextEditingController city=new TextEditingController();
  TextEditingController equipment=new TextEditingController();
  TextEditingController regulations=new TextEditingController();
  TextEditingController Addresse=new TextEditingController();
  String? imageUri;
  // the image who selected
  File? _image;
  //
  final picker = ImagePicker();

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
  Future uploadFile(File file, context) async {
    if (file == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No file was selected")));
      return null;
    }


    firebase_storage.UploadTask uploadTask;
    Random rand = new Random();

    _image = File(file.path);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('photos')
        .child('/${DateTime.now().toIso8601String()}');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }
    uploadTask.snapshotEvents.listen((event) {
    });

    await uploadTask.whenComplete(() {
      Navigator.pop(context);

      print('finished upload');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Image uploaded successfully")));

    });

    return await ref.getDownloadURL();
  }



}