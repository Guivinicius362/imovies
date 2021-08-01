import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

const _API_KEY = '741592557ccdf9eceb61beefb44017b6';

class MovieService {
  Client _client = getIt<Client>();

  Future<Response> getPopularMovies({page = 1}) async => await get(
        'https://api.themoviedb.org/3/movie/popular?api_key=$_API_KEY&page=$page',
      );

  Future<Response> getTopRatedMovies({page = 1}) async => await get(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$_API_KEY&page=$page',
      );

  Future<Response> getNowPlayingMovies({page = 1}) async => await get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$_API_KEY&page=$page',
      );

  Future<Response> get(String url) async {
    final response = await _client.get(
      Uri.parse(
        url,
      ),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Error();
    }
  }
}
