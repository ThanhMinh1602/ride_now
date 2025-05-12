// import 'package:car_booking/core/constants/app_color.dart';
// import 'package:flutter/material.dart';

// class CustomRadioCard extends StatelessWidget {
//   const CustomRadioCard({
//     super.key,
//     required this.child,
//     this.isSelected = false,
//     this.padding,
//     this.isBorder = true,
//   });
//   final Widget child;
//   final bool isSelected;
//   final bool isBorder;
//   final EdgeInsetsGeometry? padding;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding:
//           padding ??
//           const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
//       decoration: BoxDecoration(
//         color: isSelected ? AppColor.primaryLight : AppColor.surfaceWhite,
//         borderRadius: BorderRadius.circular(12.0),
//         border:
//             isBorder
//                 ? Border.all(
//                   color: isSelected ? AppColor.primary : AppColor.neutral200,
//                   width: 1.0,
//                 )
//                 : null,
//       ),
//       child: child,
//     );
//   }
// }
