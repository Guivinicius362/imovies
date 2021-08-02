import 'package:get_it/get_it.dart';
import 'package:http/http.dart' show Client;
import 'package:imovies/infrastructure/repositories/movie_repository.dart';
import 'package:imovies/infrastructure/repositories/person_repository.dart';
import 'package:imovies/infrastructure/services/movie_service.dart';
import 'package:imovies/infrastructure/services/person_service.dart';
import 'package:imovies/presentation/home/pages/home/home_bloc.dart';

final _getIt = GetIt.instance;

void boot() {
  // http client
  _getIt.registerFactory(() => Client());

  // movie resources
  _getIt.registerFactory(() => MovieService());
  _getIt.registerFactory(() => MovieRepository());

  // person resources
  _getIt.registerFactory(() => PersonService());
  _getIt.registerFactory(() => PersonRepository());

  //blocs
  _getIt.registerFactory(() => HomeBloc());
}
