import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

const _API_KEY = "741592557ccdf9eceb61beefb44017b6";
const _BASE_URL = "https://api.themoviedb.org/3";

class BaseService {
  Client _client = getIt<Client>();

  Future<Response> get({required String url, int page = 1}) async {
    final response = await _client.get(
      Uri.parse(
        "$_BASE_URL/$url?api_key=$_API_KEY&page=$page",
      ),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Error();
    }
  }
}
