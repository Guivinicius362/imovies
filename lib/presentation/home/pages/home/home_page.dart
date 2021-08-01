import 'package:flutter/material.dart';
import 'package:imovies/design_system/design_system.dart';
import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/infrastructure/services/movie_service.dart';
import 'package:imovies/presentation/home/pages/home/home_bloc.dart';
import 'package:imovies/presentation/home/constants/home_constants.dart';
import 'package:imovies/design_system/widgets/content_scroll.dart';
import 'package:imovies/design_system/widgets/lazy_stream_builder.dart';
import 'package:imovies/presentation/home/widgets/wide_movie_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  final _bloc = getIt<HomeBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.getPopularMovies();
    _bloc.getTopRatedMovies();
    _bloc.getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            mainColor.withOpacity(0.1),
            backgroundColor,
            backgroundColor,
            backgroundColor,
            mainColor.withOpacity(0.1),
          ],
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: backgroundColor.withOpacity(0.7),
          title: _buildTitle(),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            _buildPopularMovie(),
            _buildTopRatedMovie(),
            _buildNowPlayingMovie(),
          ],
        ),
      ),
    );
  }

  Center _buildTitle() {
    return Center(
      child: Text(
        homeTitle,
        style: titleStyle,
      ),
    );
  }

  Widget _buildPopularMovie() => LazyStreamBuilder<List<Movie>>(
        stream: _bloc.popularMovies.stream,
        sucessBuilder: (BuildContext _, AsyncSnapshot snapshot) {
          return Container(
            height: 225.0,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                final item = snapshot.data;
                return WideMovieCard(
                  pageController: _pageController,
                  movies: item,
                  index: index,
                );
              },
            ),
          );
        },
        loadingBuilder: (BuildContext _, AsyncSnapshot snapshot) {
          return WideMovieCard.shimmer();
        },
        erroBuilder: (BuildContext _, AsyncSnapshot snapshot) {
          return Text(snapshot.error.toString());
        },
      );

  Widget _buildTopRatedMovie() => LazyStreamBuilder<List<Movie>>(
        stream: _bloc.topRatedMovies.stream,
        sucessBuilder: (BuildContext _, AsyncSnapshot snapshot) {
          final item = snapshot.data as List<Movie>;
          return ContentScroll(
            list: item,
            title: topRatedMovies,
            handleImageUrl: (int index) => item[index].fullPosterPath(),
          );
        },
        loadingBuilder: (BuildContext _, AsyncSnapshot snapshot) =>
            ContentScroll.shimmer(topRatedMovies),
        erroBuilder: (BuildContext _, AsyncSnapshot snapshot) {
          return Text(snapshot.error.toString());
        },
      );

  Widget _buildNowPlayingMovie() => LazyStreamBuilder<List<Movie>>(
        stream: _bloc.nowPlayingMovies.stream,
        sucessBuilder: (BuildContext _, AsyncSnapshot snapshot) {
          final item = snapshot.data as List<Movie>;
          return ContentScroll(
            list: item,
            title: nowPlayingMovies,
            handleImageUrl: (int index) => item[index].fullPosterPath(),
          );
        },
        loadingBuilder: (BuildContext _, AsyncSnapshot snapshot) =>
            ContentScroll.shimmer(nowPlayingMovies),
        erroBuilder: (BuildContext _, AsyncSnapshot snapshot) {
          return Text(snapshot.error.toString());
        },
      );
}
