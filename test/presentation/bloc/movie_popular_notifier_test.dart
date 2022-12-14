import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:rextor_movie/common/failure.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_popular.dart';
import 'package:rextor_movie/presentation/bloc/movie_data_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_page_state_management.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rextor_movie/presentation/bloc/movie_popular_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_popular_notifier_test.mocks.dart';

@GenerateMocks([GetPopularMovies])
void main() {
  late MockGetPopularMovies mockGetPopularMovies;
  late PopularMovieBloc popularBloc;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    popularBloc = PopularMovieBloc(mockGetPopularMovies);
  });

  test('initial state should be empty', () {
    expect(popularBloc.state, EmptyDataMovie());
  });

  blocTest<PopularMovieBloc, MovieStateManagementBloc>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return popularBloc;
    },
    act: (bloc) => bloc.add(const GetDataMovieBloc()),
    expect: () => [
      LoadingDataMovie(),
      LoadedDataMovie(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetPopularMovies.execute());
    },
  );

  blocTest<PopularMovieBloc, MovieStateManagementBloc>(
    'Should emit [Loading, Error] when get popular is unsuccessful',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return popularBloc;
    },
    act: (bloc) => bloc.add(const GetDataMovieBloc()),
    expect: () => [
      LoadingDataMovie(),
      const ErrorDataMovie('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularMovies.execute());
    },
  );

  blocTest<PopularMovieBloc, MovieStateManagementBloc>(
    'Should emit [Loading, Error] when get popular is unsuccessful',
    build: () {
      when(mockGetPopularMovies.execute()).thenAnswer(
          (_) async => const Left(ConnectionFailure('Connection Failure')));
      return popularBloc;
    },
    act: (bloc) => bloc.add(const GetDataMovieBloc()),
    expect: () => [
      LoadingDataMovie(),
      const ErrorDataMovie('Connection Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularMovies.execute());
    },
  );

  blocTest<PopularMovieBloc, MovieStateManagementBloc>(
    'Should emit [Loading, Error] when get popular is unsuccessful',
    build: () {
      when(mockGetPopularMovies.execute()).thenAnswer(
          (_) async => const Left(DatabaseFailure('Database Failure')));
      return popularBloc;
    },
    act: (bloc) => bloc.add(const GetDataMovieBloc()),
    expect: () => [
      LoadingDataMovie(),
      const ErrorDataMovie('Database Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularMovies.execute());
    },
  );
}
