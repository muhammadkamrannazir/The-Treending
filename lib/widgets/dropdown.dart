// import 'package:lessonplan/widgets/text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../utils/colors.dart';

// class CustomDropdownButton extends StatelessWidget {
//   final String hintText;
//   final String? value;
//   final List<String> items;
//   final void Function(String?)? onChanged;
//   String? Function(String?)? validator;
//   void Function(String?)? onSaved;

//   CustomDropdownButton({
//     super.key,
//     required this.hintText,
//     this.value,
//     required this.items,
//     required this.onChanged,
//     this.validator,
//     this.onSaved,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 12),
//       child: ButtonTheme(
//         alignedDropdown: true,
//         child: DropdownButtonFormField<String>(
//           hint: Text('Select Technology'),
//           value: value,
//           items: items.map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: onChanged,
//           focusColor: Colors.transparent,
//           dropdownColor: AppColors.black,
//         ),

//         DropdownButtonFormField<String>(
//           validator: validator,
//           onSaved: onSaved, onChanged: onChanged,
//           isExpanded: true,
//           icon: Icon(
//             Icons.keyboard_arrow_down_rounded,
//           ),
//           iconSize: 24,
//           style: TextStyle(
//               color: AppColors.white,
//               fontWeight: FontWeight.w300,
//               fontSize: 16),
//           value: value,
//           selectedItemBuilder: (BuildContext context) {
//             return items.map<Widget>((String item) {
//               return Text(
//                 item,
//                 style: TextStyle(
//                     color: AppColors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400),
//               );
//             }).toList();
//           },
//           items: items
//               .map(
//                 (String item) => DropdownMenuItem<String>(
//                   value: item,
//                   child: CustomText(
//                     value ?? '',
//                     color: AppColors.white,
//                   ),
//                 ),
//               )
//               .toList(),
//           //     .where((item) => item != 'select')
//           //     .map<DropdownMenuItem<String>>((String value) {
//           //   return DropdownMenuItem<String>(
//           //     value: value,
//           //     child: Text(
//           //       value,
//           //       style: TextStyle(
//           //         color: AppColors.white,
//           //         fontSize: 16,
//           //       ),
//           //     ),
//           //   );
//           // }).toList(),
//         ),
//       ),
//     );
//   }

//   border() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(color: AppColors.grey),
//     );
//   }

//   focusedBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(color: AppColors.grey),
//     );
//   }
// }
