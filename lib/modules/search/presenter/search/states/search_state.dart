import 'package:clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:clean_architecture/modules/search/domain/errors/errors.dart';

abstract class SearchState {}

class StartState implements SearchState {
  const StartState();
}

class LoadingState implements SearchState {
  const LoadingState();
}

class ErrorState implements SearchState {
  final ErrorSearch error;
  const ErrorState(this.error);
}

class SuccessState implements SearchState {
  final List<ResultSearch> list;
  const SuccessState(this.list);
}
