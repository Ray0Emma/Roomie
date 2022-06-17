import 'dart:async';
import 'dart:io' as io;
import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class Storage {
  File? _image;
  final picker = ImagePicker();
   String imageUri="";
  Future getImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return pickedFile;
    } else {
      return null;
    }
  }

  Future uploadFile(File file, context) async {
    if (file == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No file was selected")));
      return null;
    }

    //show Progress bar

  //  showDialog(context: context, builder: (context) => ProgressBar());

    Random rand = new Random();

    _image = File(file.path);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('photos')
        .child('/${DateTime.now().toIso8601String()}');




    UploadTask uploadTask = ref.putFile(_image!);
    await uploadTask.whenComplete(() async {
      var url = await ref.getDownloadURL();
      imageUri = url.toString();
    }).catchError((onError) {
      print(onError);
    });

   print(imageUri);

    return await ref.getDownloadURL();
  }


}
