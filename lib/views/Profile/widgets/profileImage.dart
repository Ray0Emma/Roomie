import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomie/controllers/userController.dart';
import 'package:roomie/resources/app_colors.dart';

Widget profileImage() {
  return FutureBuilder(
    future: UserController.instance.loadImage(),
    builder: (BuildContext context, AsyncSnapshot usnapshot) {
      if (usnapshot.hasData &&
          usnapshot.connectionState == ConnectionState.done &&
          usnapshot.data["profile"] != null) {
        return CircleAvatar(
          backgroundColor: AppColors.GRAY_Forced.withOpacity(0.3),
          child: ClipOval(
            child: SizedBox(
              width: 150,
              height: 150,
              child: Image.network(usnapshot.data["profile"]),
            ),
          ),
        );
      } else {
        return Container(
            width: double.infinity,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.PRIMARY_COLOR,
              ),
            ));
      }
    },
  );
}

Widget arrowBack() {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: const Icon(
      Icons.arrow_back_ios,
      size: 20,
      color: Colors.white,
    ),
  );
}

SnackBar snackbarError() {
  return SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Error!',
      message: 'Please fill all the fields including Image!',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
    ),
  );
}

snackbarError1(e) {
  return SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Error!',
      message: e,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
    ),
  );
}

SnackBar snackbarSuccess() {
  return SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Success!',
      message: 'You have filled all the informations!',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.success,
    ),
  );
}
