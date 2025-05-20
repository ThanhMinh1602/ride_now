import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title,
    this.subTitle,
    this.action,
    this.titleWidget,
  });
  final Widget? titleWidget;
  final String? title;
  final String? subTitle;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ).copyWith(bottom: 16.0, top: MediaQuery.of(context).padding.top + 22.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColor.primaryGradient,
          stops: [0.21, 1],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (titleWidget == null)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title ?? '', style: AppStyle.heading20BoldWhite),
                Text(subTitle ?? '', style: AppStyle.k12RegularWhite),
              ],
            ),
          if (action != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: AppColor.surfaceWhite,
                borderRadius: BorderRadius.circular(99.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 12.0,
                    color: AppColor.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Text('Đà Nẵng', style: AppStyle.body12SemiBoldPrimary),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(127.0);
}
