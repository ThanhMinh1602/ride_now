import 'package:car_booking/core/components/card/custom_card.dart';
import 'package:flutter/material.dart';

class BookCarAirportRideWidget extends StatelessWidget {
  const BookCarAirportRideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomCard(child: Text('BookCarAirportRideWidget')),
    );
  }
}
