import 'package:http/http.dart' show Response;
import 'base_service.dart';

class PersonService extends BaseService {
  Future<Response> getPopularPersons() async => await get(
        url: 'person/popular',
      );
}
