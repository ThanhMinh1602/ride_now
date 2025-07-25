// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:car_booking/features/map/data/datasources/map_data_sources.dart'
    as _i171;
import 'package:car_booking/features/map/data/repositories/map_repo.dart'
    as _i864;
import 'package:car_booking/features/map/domain/repositories/i_map_repo.dart'
    as _i632;
import 'package:car_booking/features/map/domain/usecase/get_current_location_usecase.dart'
    as _i275;
import 'package:car_booking/features/map/domain/usecase/get_location_history_usecase.dart'
    as _i545;
import 'package:car_booking/features/map/domain/usecase/get_location_suggestions_usecase.dart'
    as _i868;
import 'package:car_booking/features/map/domain/usecase/get_place_details_usecase.dart'
    as _i947;
import 'package:car_booking/features/map/domain/usecase/submit_location_usecase.dart'
    as _i194;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i171.MapDataSources>(() => _i171.MapDataSources());
    gh.singleton<_i275.GetLocationUsecase>(() => _i275.GetLocationUsecase());
    gh.singleton<_i194.SubmitLocationUsecase>(
      () => _i194.SubmitLocationUsecase(),
    );
    gh.singleton<_i632.IMapRepo>(
      () => _i864.MapRepo(gh<_i171.MapDataSources>()),
    );
    gh.singleton<_i868.GetLocationSuggestionsUsecase>(
      () => _i868.GetLocationSuggestionsUsecase(gh<_i632.IMapRepo>()),
    );
    gh.singleton<_i947.GetPlaceDetailsUsecase>(
      () => _i947.GetPlaceDetailsUsecase(gh<_i632.IMapRepo>()),
    );
    gh.singleton<_i545.GetLocationHistoryUseCase>(
      () => _i545.GetLocationHistoryUseCase(mapRepo: gh<_i632.IMapRepo>()),
    );
    return this;
  }
}
