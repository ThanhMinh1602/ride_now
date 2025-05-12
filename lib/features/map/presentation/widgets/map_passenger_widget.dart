import 'package:car_booking/core/components/button/custom_back_button.dart';
import 'package:car_booking/core/components/customtextfield/custom_text_field.dart';
import 'package:car_booking/core/constants/app_color.dart';
import 'package:car_booking/core/constants/app_shadows.dart';
import 'package:car_booking/core/constants/app_style.dart';
import 'package:car_booking/core/extension/build_context_extension.dart';
import 'package:car_booking/features/map/domain/entities/location_entity.dart';
import 'package:car_booking/features/map/presentation/bloc/map_bloc.dart';
import 'package:car_booking/features/map/presentation/widgets/map_widget.dart';
import 'package:car_booking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapPassengerWidget extends StatefulWidget {
  const MapPassengerWidget({super.key});

  @override
  State<MapPassengerWidget> createState() => _MapPassengerWidgetState();
}

class _MapPassengerWidgetState extends State<MapPassengerWidget> {
  @override
  void initState() {
    context.read<MapBloc>().add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: context.screenHeight * 335 / 824,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            decoration: BoxDecoration(
              color: AppColor.surfaceWhite,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              boxShadow: [AppShadows.medium],
            ),
            child: ListView.builder(
              itemCount: state.locationHistories.length,
              itemBuilder: (context, index) {
                print(state.currentLocation?.address ?? '');
                final data = state.locationHistories[index];
                return GestureDetector(
                  onTap: () {
                    context.read<MapBloc>().add(SelectLocationEvent(data));
                  },
                  child: _buildLocationHistoryItem(data, state),
                );
              },
            ),
          );
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(child: MapWidget()),
          _buildSearchLocation(context),
        ],
      ),
    );
  }

  Widget _buildLocationHistoryItem(LocationEntities data, MapState state) {
    final isSelected = (data == state.currentLocation);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: isSelected ? AppColor.primaryLight : Colors.transparent,
        border: Border.all(
          color: isSelected ? AppColor.primary : Colors.transparent,
          width: 1,
        ),
      ),
      child: Row(
        spacing: 12.0,
        children: [
          Expanded(
            child: Column(
              spacing: 4.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // maxLines: 1,
                  data.title ?? '--:--',
                  style: AppStyle.heading16SemiBoldPrimary,
                ),
                Text(
                  data.address ?? '--:--',
                  style: AppStyle.body15RegularSecondary,
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            isSelected
                ? Assets.icons.radioSelected
                : Assets.icons.radioUnselected,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchLocation(BuildContext context) {
    return Positioned(
      left: 15.89,
      right: 15.89,
      top: MediaQuery.of(context).padding.top + 22,
      child: Row(
        children: [
          CustomBackButton(),
          SizedBox(width: 16.0),
          Expanded(child: CustomTextField(hintText: 'Nhập điểm tìm kiếm')),
        ],
      ),
    );
  }
}
