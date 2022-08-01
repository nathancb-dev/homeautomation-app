part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoaded extends SearchState {
  SearchLoaded({required this.cities});

  final List<CityModel> cities;
}

class SearchError extends SearchState {
  SearchError(this.message);

  final String message;

  factory SearchError.unexpected() {
    return SearchError(
      'Opss!! Algo não saiu bem ao carregar as cidades.',
    );
  }

  factory SearchError.notFound() {
    return SearchError(
      'Opss!! Cidade não encontrada, tente alguma outra nas proximidades.',
    );
  }
}
