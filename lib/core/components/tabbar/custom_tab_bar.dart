import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required TabController tabController,
    required this.tabTitle,
  }) : _tabController = tabController;

  final TabController _tabController;
  final List<String> tabTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.surfaceWhite,
      child: TabBar(
        controller: _tabController,
        indicatorAnimation: TabIndicatorAnimation.elastic,
        overlayColor: WidgetStatePropertyAll<Color>(
          AppColor.primary.withOpacity(0.2),
        ),

        unselectedLabelStyle: AppStyle.body14RegularPrimary2,
        labelStyle: AppStyle.k14SemiBoldActive,
        labelPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
        indicatorWeight: 4,
        indicatorColor: AppColor.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerHeight: 0,
        tabs: tabTitle.map((title) => Text(title)).toList(),
      ),
    );
  }
}
