// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:por_de_sol/models/weather_model.dart';
import 'package:por_de_sol/repositories/weather_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this._weatherRepository,
  ) : super(SearchInitial());

  final WeatherRepository _weatherRepository;

  Future<void> search(String cityName) async {
    if (cityName.length <= 3) {
      emit(SearchInitial());
      return;
    }

    try {
      final result = await _weatherRepository.search(cityName);

      if (result.isEmpty) {
        emit(SearchError.notFound());
        return;
      }

      emit(SearchLoaded(cities: result));
    } catch (e) {
      print(e);
      emit(SearchError.unexpected());
    }
  }
}
