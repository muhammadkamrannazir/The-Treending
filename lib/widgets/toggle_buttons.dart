import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treending/utils/colors.dart';
import 'package:treending/widgets/text.dart';

class ToggleButtonGroup extends StatefulWidget {
  final List<String> buttonTitles;
  final void Function(String) onButtonSelected;
  final String? initialSelected; // New optional parameter for initial selection

  const ToggleButtonGroup({
    super.key,
    required this.buttonTitles,
    required this.onButtonSelected,
    this.initialSelected, // Optional initial selection
  });

  @override
  _ToggleButtonGroupState createState() => _ToggleButtonGroupState();
}

class _ToggleButtonGroupState extends State<ToggleButtonGroup> {
  late String _selectedButtonTitle;

  @override
  void initState() {
    super.initState();
    // Set the initial selected title, default to the first title if not provided or invalid
    _selectedButtonTitle = widget.initialSelected != null &&
            widget.buttonTitles.contains(widget.initialSelected)
        ? widget.initialSelected!
        : widget.buttonTitles[0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.buttonTitles.length,
        (index) => _buildButton(widget.buttonTitles[index], index),
      ),
    );
  }

  Widget _buildButton(String title, int index) {
    final isSelected = title == _selectedButtonTitle;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedButtonTitle = title;
        });
        widget.onButtonSelected(_selectedButtonTitle);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: _getBorderRadius(index, isSelected),
          border: Border.all(
            color: AppColors.primary,
            width: 0.5,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Center(
          child: CustomText(
            title,
            color: isSelected ? Colors.white : AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  BorderRadius _getBorderRadius(int index, bool isSelected) {
    if (widget.buttonTitles.length == 2) {
      if (index == 0) {
        return const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        );
      } else {
        return const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        );
      }
    } else {
      if (index == 0) {
        return BorderRadius.only(
          topLeft: Radius.circular(isSelected ? 8 : 8),
          bottomLeft: Radius.circular(isSelected ? 8 : 8),
        );
      } else if (index == widget.buttonTitles.length - 1) {
        return BorderRadius.only(
          topRight: Radius.circular(isSelected ? 8 : 8),
          bottomRight: Radius.circular(isSelected ? 8 : 8),
        );
      } else {
        return BorderRadius.zero;
      }
    }
  }
}