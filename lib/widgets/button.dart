// ignore_for_file: must_be_immutable, file_names

// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treending/widgets/text.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String name;
  double? height;
  double? width;
  bool loading;
  Color? color;
  Color? textColor;
  Color? borderColor;
  VoidCallback? onPressed;
  double? fontSize;

  CustomButton({
    super.key,
    required this.name,
    this.color,
    this.textColor,
    this.borderColor,
    this.height,
    this.loading = false,
    this.width,
    this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // Remove default padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r), // Match container radius
        ),
      ),
      child: Container(
        height: height ?? 56.h,
        width: width ?? 327.w,
        // padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: borderColor ?? AppColors.transparent),
          color: color ?? AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color with opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 10, // Blur radius
              offset: const Offset(0, 5), // Shadow position (x, y)
            ),
          ],
        ),
        child: Center(
          child: loading
              ? CupertinoActivityIndicator(
                  color: AppColors.white,
                )
              : CustomText(
                  name,
                  fontSize: fontSize ?? 16.sp,
                  color: textColor ?? AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
        ),
      ),
    );
  }
}

indicator() {
  return Center(
    child: CupertinoActivityIndicator(
      color: AppColors.primary,
      radius: 15,
    ),
  );
}
