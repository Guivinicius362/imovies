import 'package:flutter/material.dart';
import 'package:imovies/design_system/design_system.dart';
import 'package:imovies/design_system/widgets/circular_content_scroll.dart';
import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/infrastructure/models/person.dart';
import 'package:imovies/presentation/home/pages/home/home_bloc.dart';
import 'package:imovies/presentation/home/constants/home_constants.dart';
import 'package:imovies/design_system/widgets/content_scroll.dart';
import 'package:imovies/presentation/home/widgets/section_error.dart';
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
    _bloc.getPopularPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            backgroundColor,
            backgroundColor.withOpacity(0.75),
            backgroundColor.withOpacity(0.25),
            mainColor.withOpacity(0.25),
          ],
        ),
      ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: backgroundColor.withOpacity(0.5),
          title: _buildTitle(),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            _buildPopularMovie(),
            _buildTopRatedMovie(),
            _buildNowPlayingMovie(),
            _buildPopularPerson(),
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

  Widget _buildPopularMovie() => _bloc.popularMovies.toBuild<List<Movie>>(
        onSuccess: (data) => Container(
          height: 225.0,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              final item = data;
              return WideMovieCard(
                pageController: _pageController,
                movies: item,
                index: index,
              );
            },
          ),
        ),
        onLoading: WideMovieCard.shimmer(),
        onError: sectionError(),
      );

  Widget _buildTopRatedMovie() => _bloc.topRatedMovies.toBuild<List<Movie>>(
        onSuccess: (data) => ContentScroll(
          list: data,
          title: topRatedMovies,
          handleImageUrl: (int index) => data[index].fullPosterPath(),
        ),
        onLoading: ContentScroll.shimmer(topRatedMovies),
        onError: sectionError(),
      );

  Widget _buildNowPlayingMovie() => _bloc.nowPlayingMovies.toBuild<List<Movie>>(
        onSuccess: (data) => ContentScroll(
          list: data,
          title: nowPlayingMovies,
          handleImageUrl: (int index) => data[index].fullPosterPath(),
        ),
        onLoading: ContentScroll.shimmer(nowPlayingMovies),
        onError: sectionError(),
      );

  Widget _buildPopularPerson() => _bloc.popularPersons.toBuild<List<Person>>(
      onSuccess: (data) => CircularContentScroll(
            list: data,
            title: popularPersons,
            handleImageUrl: (int index) => data[index].fullProfilePath(),
            handleTitle: (int index) => data[index].name,
          ),
      onLoading: CircularContentScroll.shimmer(popularPersons),
      onError: sectionError());
}
