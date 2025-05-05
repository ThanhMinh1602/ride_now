import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:flutter/material.dart';

class BookCarNowWidget extends StatelessWidget {
  const BookCarNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomCard(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text('data')],
          ),
        ),
      ),
    );
  }
}
