import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 40.w,
      child: FloatingActionButton(
        elevation: 2,
        backgroundColor: Colors.white,
        onPressed: () {
          Get.back();
        },
        child: const Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
      ),
    );
  }
}
