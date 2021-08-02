import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:imovies/infrastructure/models/person.dart';
import 'package:imovies/infrastructure/models/response_wrapper.dart';
import 'package:imovies/infrastructure/services/person_service.dart';

final getIt = GetIt.instance;

class PersonRepository {
  final PersonService _personService = getIt<PersonService>();

  Future<List<Person>> getPopularPersons() async {
    final response = await _personService.getPopularPersons();
    var body = json.decode(response.body);
    TheMovieDBWrapper wrapper = TheMovieDBWrapper.fromJson(body);

    return wrapper.results
        .map(
          (e) => Person.fromJson(e),
        )
        .toList();
  }
}
