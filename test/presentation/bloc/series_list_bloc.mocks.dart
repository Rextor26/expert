// Mocks generated by Mockito 5.0.8 from annotations
// in rextor_movie/test/presentation/provider/movie_list_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:rextor_movie/common/failure.dart' as _i6;
import 'package:rextor_movie/domain/entities/series/series.dart' as _i7;
import 'package:rextor_movie/domain/repositories/series_repository.dart' as _i2;
import 'package:rextor_movie/domain/usecases/series/get_series_today.dart' as _i4;
import 'package:rextor_movie/domain/usecases/series/get_series_on_air.dart' as _i8;
import 'package:rextor_movie/domain/usecases/series/get_series_popular.dart' as _i9;
import 'package:rextor_movie/domain/usecases/series/get_series_top_rated.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeSeriesRepository extends _i1.Fake implements _i2.RepositorySeries {}

class _FakeEither<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetSeriesAiringToday].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSeriesAiringToday extends _i1.Mock
    implements _i4.GetSeriesToday {
  MockGetSeriesAiringToday() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositorySeries get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository()) as _i2.RepositorySeries);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Series>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i7.Series>>>.value(
              _FakeEither<_i6.Failure, List<_i7.Series>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i7.Series>>>);
}

/// A class which mocks [Get].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSeriesOnTheAir extends _i1.Mock
    implements _i8.GetSeriesOnAir {
  MockGetSeriesOnTheAir() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositorySeries get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository()) as _i2.RepositorySeries);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Series>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i7.Series>>>.value(
              _FakeEither<_i6.Failure, List<_i7.Series>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i7.Series>>>);
}

/// A class which mocks [GetSeriesPopular].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularSeries extends _i1.Mock implements _i9.GetPopularSeries {
  MockGetPopularSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositorySeries get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository()) as _i2.RepositorySeries);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Series>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i7.Series>>>.value(
              _FakeEither<_i6.Failure, List<_i7.Series>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i7.Series>>>);
}

/// A class which mocks [GetSeriesTopRated].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedSeries extends _i1.Mock implements _i10.GetTopRatedSeries {
  MockGetTopRatedSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositorySeries get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository()) as _i2.RepositorySeries);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Series>>> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i7.Series>>>.value(
              _FakeEither<_i6.Failure, List<_i7.Series>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i7.Series>>>);
}
