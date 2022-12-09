// Mocks generated by Mockito 5.0.8 from annotations
// in rextor_movie/test/presentation/provider/movie_detail_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:rextor_movie/common/failure.dart' as _i6;
import 'package:rextor_movie/domain/entities/series/series.dart' as _i9;
import 'package:rextor_movie/domain/entities/series/series_detail.dart' as _i7;
import 'package:rextor_movie/domain/repositories/series_repository.dart' as _i2;
import 'package:rextor_movie/domain/usecases/series/get_series_detail.dart' as _i4;
import 'package:rextor_movie/domain/usecases/series/get_series_recommendation.dart' as _i8;
import 'package:rextor_movie/domain/usecases/series/get_series_watchlist_status.dart' as _i10;
import 'package:rextor_movie/domain/usecases/series/get_series_remove_series_watchlist.dart' as _i12;
import 'package:rextor_movie/domain/usecases/series/get_series_save_watchlist.dart' as _i11;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeSeriesRepository extends _i1.Fake implements _i2.RepositorySeries {}

class _FakeEither<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetSeriesDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSeriesDetail extends _i1.Mock implements _i4.GetSeriesDetail {
  MockGetSeriesDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositorySeries get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository()) as _i2.RepositorySeries);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.SeriesDetail>> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<_i3.Either<_i6.Failure, _i7.SeriesDetail>>.value(
              _FakeEither<_i6.Failure, _i7.SeriesDetail>())) as _i5
          .Future<_i3.Either<_i6.Failure, _i7.SeriesDetail>>);
}

/// A class which mocks [GetMovieRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSeriesRecommendations extends _i1.Mock
    implements _i8.GetSeriesRecommendations {
  MockGetSeriesRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositorySeries get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository()) as _i2.RepositorySeries);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i9.Series>>> execute(dynamic id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i9.Series>>>.value(
              _FakeEither<_i6.Failure, List<_i9.Series>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i9.Series>>>);
}

/// A class which mocks [GetSeriesWatchlistStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSeriesWatchListStatus extends _i1.Mock
    implements _i10.GetWatchlistStatusSeries {
  MockGetSeriesWatchListStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositorySeries get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository()) as _i2.RepositorySeries);
  @override
  _i5.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [SaveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeriesSaveWatchlist extends _i1.Mock implements _i11.SaveWatchlistSeries {
  MockSeriesSaveWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositorySeries get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository()) as _i2.RepositorySeries);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(_i7.SeriesDetail? series) =>
      (super.noSuchMethod(Invocation.method(#execute, [series]),
              returnValue: Future<_i3.Either<_i6.Failure, String>>.value(
                  _FakeEither<_i6.Failure, String>()))
          as _i5.Future<_i3.Either<_i6.Failure, String>>);
}

/// A class which mocks [RemoveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeriesRemoveWatchlist extends _i1.Mock implements _i12.RemoveWatchlistSeries {
  MockSeriesRemoveWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RepositorySeries get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeSeriesRepository()) as _i2.RepositorySeries);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(_i7.SeriesDetail? series) =>
      (super.noSuchMethod(Invocation.method(#execute, [series]),
              returnValue: Future<_i3.Either<_i6.Failure, String>>.value(
                  _FakeEither<_i6.Failure, String>()))
          as _i5.Future<_i3.Either<_i6.Failure, String>>);
}
