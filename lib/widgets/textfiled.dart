import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treending/utils/colors.dart';
import 'package:treending/widgets/text.dart';

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
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.only(left: 3),
        //   child: Icon(
        //     icon,
        //     size: 30,
        //     color: AppColors.primary.withOpacity(.6),
        //   ),
        // ),
        // filled: true,
        // fillColor: Colors.black,
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

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.white, fontSize: 18),
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: AppColors.grey),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            child: Icon(Icons.search, color: AppColors.white),
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 15),
        border: border(),
        enabledBorder: border(),
        focusedBorder: focusedBorder(),
      ),
    );
  }

  border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: AppColors.white),
    );
  }

  focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: AppColors.primary),
    );
  }
}
