part of 'home_partners_bloc.dart';

@freezed
abstract class HomePartnersState with _$HomePartnersState {
  const factory HomePartnersState({@Default(false) bool isLoading}) =
      _HomePartnersState;
}
