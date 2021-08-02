import 'package:flutter_test/flutter_test.dart';
import 'home_robot.dart';

void main() {
  testWidgets('Home_OpenHome_Loading', (WidgetTester tester) async {
    final robot = HomeRobot(tester);
    await robot.configurePageSucess();
    robot.assertPageShimmerWasEnabled();
  });
  testWidgets('Home_AfterLoading_ShouldShowMovies',
      (WidgetTester tester) async {
    final robot = HomeRobot(tester);
    await robot.configurePageSucess();
    await robot.wait();
    robot.assertPageWasLoaded();
  });
  testWidgets('Home_AfterLoading_ShouldShowErrorOnHighlightsMovies',
      (WidgetTester tester) async {
    final robot = HomeRobot(tester);
    robot.configurePopularMoviesError();
    robot.configureTopRatedMovies();
    robot.configureNowPlayingMovies();
    robot.configurePopularPersons();
    await robot.configurePage();
    await robot.wait();
    robot.assertNowPlayingMoviesHasError();
  });
  testWidgets('Home_AfterLoading_ShouldShowErrorOnTopRatedMovies',
      (WidgetTester tester) async {
    final robot = HomeRobot(tester);
    robot.configurePopularMovies();
    robot.configureTopRatedMoviesError();
    robot.configureNowPlayingMovies();
    robot.configurePopularPersons();
    await robot.configurePage();
    await robot.wait();
    robot.assertTopRatedMoviesHasError();
  });
  testWidgets('Home_AfterLoading_ShouldShowErrorOnNowPlayingMovies',
      (WidgetTester tester) async {
    final robot = HomeRobot(tester);
    robot.configurePopularMovies();
    robot.configureTopRatedMovies();
    robot.configureNowPlayingMoviesError();
    robot.configurePopularPersons();
    await robot.configurePage();
    await robot.wait();
    robot.assertNowPlayingMoviesHasError();
  });
  testWidgets('Home_AfterLoading_ShouldShowErrorOnPopularPersons',
      (WidgetTester tester) async {
    final robot = HomeRobot(tester);
    robot.configurePopularMovies();
    robot.configureTopRatedMovies();
    robot.configureNowPlayingMovies();
    robot.configurePopularPersonError();
    await robot.configurePage();
    await robot.wait();
    robot.assertPopularPersonHasError();
  });
}
