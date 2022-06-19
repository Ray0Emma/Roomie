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
        return Container();
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
