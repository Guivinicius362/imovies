import 'package:http/http.dart' show Response;
import 'base_service.dart';

class MovieService extends BaseService {
  Future<Response> getPopularMovies() async => await get(
        url: 'movie/popular',
      );

  Future<Response> getTopRatedMovies() async => await get(
        url: "movie/top_rated",
      );

  Future<Response> getNowPlayingMovies() async => await get(
        url: "movie/now_playing",
      );
}
