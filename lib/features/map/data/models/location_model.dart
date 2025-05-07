import 'package:car_booking/features/map/domain/entities/location_entity.dart';

class LocationModel {
  final double? latitude;
  final double? longitude;
  final String? title;
  final String? address;

  LocationModel({this.latitude, this.longitude, this.title, this.address});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      title: json['title'] as String?,
      address: json['address'] as String?,
    );
  }
  LocationEntities toEntity() {
    return LocationEntities(
      latitude: latitude,
      longitude: longitude,
      title: title,
      address: address,
    );
  }
}
