import 'package:get_it/get_it.dart';
import 'package:http/http.dart' show Client;
import 'package:imovies/infrastructure/repositories/movie_repository.dart';
import 'package:imovies/infrastructure/services/movie_service.dart';
import 'package:imovies/presentation/home/pages/home/home_bloc.dart';

final _getIt = GetIt.instance;

void boot() {
  _getIt.registerFactory(() => Client());
  _getIt.registerFactory(() => MovieService());
  _getIt.registerFactory(() => MovieRepository());
  _getIt.registerFactory(() => HomeBloc());
}
