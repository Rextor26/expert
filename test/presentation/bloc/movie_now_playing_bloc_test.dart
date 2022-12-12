import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rextor_movie/common/failure.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_now_playing.dart';
import 'package:rextor_movie/presentation/bloc/movie_data_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_now_playing_bloc.dart.dart';
import 'package:rextor_movie/presentation/bloc/movie_page_state_management.dart';
import '../../dummy_data/dummy_objects.dart';
import 'movie_now_playing_bloc_mock.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MovieBloc moviesBloc;
  setUp(
    () {
      mockGetNowPlayingMovies = MockGetNowPlayingMovies();
      moviesBloc = MovieBloc(mockGetNowPlayingMovies);
    },
  );

  test('initial state should be empty', () {
    expect(moviesBloc.state, EmptyDataMovie());
  });

  blocTest<MovieBloc, MovieStateManagementBloc>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return moviesBloc;
    },
    act: (bloc) => bloc.add(const GetDataMovieBloc()),
    expect: () => [
      LoadingDataMovie(),
      LoadedDataMovie(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );

  blocTest<MovieBloc, MovieStateManagementBloc>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return moviesBloc;
    },
    act: (bloc) => bloc.add(const GetDataMovieBloc()),
    expect: () => [
      LoadingDataMovie(),
      const ErrorDataMovie('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );

  blocTest<MovieBloc, MovieStateManagementBloc>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute()).thenAnswer(
          (_) async => const Left(ConnectionFailure('Connection Failure')));
      return moviesBloc;
    },
    act: (bloc) => bloc.add(const GetDataMovieBloc()),
    expect: () => [
      LoadingDataMovie(),
      const ErrorDataMovie('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );

  blocTest<MovieBloc, MovieStateManagementBloc>(
    'Should emit [Loading, Error] when get top rated is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute()).thenAnswer(
          (_) async => const Left(DatabaseFailure('Database Failure')));
      return moviesBloc;
    },
    act: (bloc) => bloc.add(const GetDataMovieBloc()),
    expect: () => [
      LoadingDataMovie(),
      const ErrorDataMovie('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );
}
