import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treending/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  IconData? icon;
  TextEditingController controller;
  Widget? suffix;
  bool obscureText;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  void Function(String?)? onSaved;
  CustomTextField({
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.textInputAction,
    this.suffix,
    this.obscureText = false,
    this.validator,
    this.icon,
    this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      onSaved: onSaved,
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.grey, fontSize: 16.sp),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: suffix,
        ),
        border: border(),
        enabledBorder: border(),
        errorBorder: border(),
        disabledBorder: border(),
        focusedErrorBorder: border(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
      ),
    );
  }

  border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.grey, width: 1),
    );
  }
}
