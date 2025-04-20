import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import 'text.dart';

class CustomFilterChip extends StatelessWidget {
  String label;
  bool selected;
  void Function(bool)? onSelected;

  CustomFilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selectedColor: AppColors.primary,
      // backgroundColor: AppColors.white,
      side: BorderSide.none,
      label: CustomText(
        label,
        // fontSize: 18,
      ),
      selected: selected,
      onSelected: onSelected,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: const BorderSide(
            color: AppColors.red,
            width: 2,
          )),
    );
  }
}