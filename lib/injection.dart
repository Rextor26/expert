import 'package:rextor_movie/common/ssl.dart';
import 'package:rextor_movie/data/datasources/db/movie_database_helper.dart';
import 'package:rextor_movie/data/datasources/db/series_database_helper.dart';
import 'package:rextor_movie/data/datasources/series_local_data_source.dart';
import 'package:rextor_movie/data/datasources/movie_local_data_source.dart';
import 'package:rextor_movie/data/datasources/remote_data_source.dart';
import 'package:rextor_movie/data/repositories/movie_repository_impl.dart';
import 'package:rextor_movie/data/repositories/series_repository_impl.dart';
import 'package:rextor_movie/domain/repositories/movie_repository.dart';
import 'package:rextor_movie/domain/repositories/series_repository.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_detail.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_now_playing.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_popular.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_top_rated.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_watchlist.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_watchlist_status.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_remove_watchlist.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_save_watchlist.dart';
import 'package:rextor_movie/domain/usecases/movie/get_movie_search.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_recommendation.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_today.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_detail.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_on_air.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_popular.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_top_rated.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_watchlist_status.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_watchlist.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_remove_series_watchlist.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_save_watchlist.dart';
import 'package:rextor_movie/domain/usecases/series/get_series_search.dart';
import 'package:rextor_movie/presentation/bloc/movie_detail_page_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_now_playing_bloc.dart.dart';
import 'package:rextor_movie/presentation/bloc/movie_popular_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_recomendation_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_top_rated_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_watchlist_bloc.dart';
import 'package:rextor_movie/presentation/bloc/search_page_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_detail_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_recomendation_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_search_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_popular_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rextor_movie/presentation/bloc/series/series_today_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_top_rated_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_watchlist_bloc.dart';

import 'presentation/bloc/series/series_on_air.dart';

final locator = GetIt.instance;

void init() {
  // provider movie
  locator.registerFactory(
    () => MovieBloc(locator()),
  );
  locator.registerFactory(
    () => GetDetaiMovieBloc(getMovieDetail: locator(), getWatchListStatus: locator(), saveWatchlist: locator(), removeWatchlist: locator())
  );
  locator.registerFactory(
    () => RecBlocMovie(locator())
  );
  locator.registerFactory(
    () => PopularMovieBloc(locator())
  );
  locator.registerFactory(
    () => TopRatedMovieBloc(locator())
  );
  locator.registerFactory(
    () => WatchlistMovieBloc(locator())
  );
  locator.registerFactory(
    () => SearchMovieBloc(locator())
  );

  locator.registerFactory(
    () => seriesPopularBloc(locator())
  );
  locator.registerFactory(
    () => TopratedSeriesBloc(locator())
  );

  //Series
  locator.registerFactory(() => SearchSeriesBloc(locator()));
  locator.registerFactory(() => SeriesTodayBloc(locator()));
  locator.registerFactory(() => SeriesOnAirBloc(locator()));
  locator.registerFactory(() => WatchlistSeriesBloc(locator()));
  locator.registerFactory(() => SeriesRecomendationBloc(locator()));
  locator.registerFactory(() => SeriesDetailBloc(seriesDetailbloc: locator(), getSeriesWatchListStatus: locator(), saveWatchlist: locator(), removeWatchlist: locator()));

  



  // use case
  // movie
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetailState(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => RemovedWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  

  ///use case series
  locator.registerLazySingleton(() => GetSeriesToday(locator()));
  locator.registerLazySingleton(() => GetSeriesOnAir(locator()));
  locator.registerLazySingleton(() => GetSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetPopularSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedSeries(locator()));
  locator.registerLazySingleton(() => GetSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistStatusSeries(locator()));
  locator.registerLazySingleton(() => SaveWatchlistSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistSeries(locator()));



  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<RepositorySeries>(() => RepositorySeriesImpl(
        remoteDataSource: locator(),
        seriesLocalDataSource: locator(),        
      ));

  // data sources
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<SeriesLocalDataSource>(
      () => SeriesLocalDataSourceImpl(databaseHelperSeries: locator()));

  // helper
  locator.registerLazySingleton<DatabaseMovieHelper>(() => DatabaseMovieHelper());
  locator.registerLazySingleton<DatabaseSeriesHelper>(() => DatabaseSeriesHelper());

  // external

  locator.registerLazySingleton(() => SecurityPiningSLL.client);
  

}
