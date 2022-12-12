import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/common/ssl.dart';
import 'package:rextor_movie/firebase_options.dart';
import 'package:rextor_movie/presentation/bloc/movie_detail_page_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_now_playing_bloc.dart.dart';
import 'package:rextor_movie/presentation/bloc/movie_popular_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_recomendation_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_top_rated_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_watchlist_bloc.dart';
import 'package:rextor_movie/presentation/bloc/search_page_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_detail_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_on_air.dart';
import 'package:rextor_movie/presentation/bloc/series/series_recomendation_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_search_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_popular_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_top_rated_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_watchlist_bloc.dart';
import 'package:rextor_movie/presentation/pages/about_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_detail_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_home_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_popular_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_search_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_top_rated_page.dart';
import 'package:rextor_movie/presentation/pages/series/series_today_page.dart';
import 'package:rextor_movie/presentation/pages/series/series_popular_page.dart';
import 'package:rextor_movie/presentation/pages/series/series_search_page.dart';
import 'package:rextor_movie/presentation/pages/series/series_top_rated_page.dart';
import 'package:rextor_movie/presentation/pages/series/series_detail_page.dart';
import 'package:rextor_movie/presentation/pages/series/series_on_air_page.dart';
import 'package:rextor_movie/presentation/pages/series/series_page.dart';
import 'package:rextor_movie/presentation/pages/series/series_watchlist_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_watchlist_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rextor_movie/injection.dart' as inject;

import 'presentation/bloc/series/series_today_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SecurityPiningSLL.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  inject.init();
  runApp(const MyApp());
}


final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_)=>inject.locator<MovieBloc>(),),
        BlocProvider(create: (_)=>inject.locator<GetDetaiMovieBloc>(),),
        BlocProvider(create: (_)=>inject.locator<RecBlocMovie>()),
        BlocProvider(create: (_)=>inject.locator<TopRatedMovieBloc>()),
        BlocProvider(create: (_)=>inject.locator<PopularMovieBloc>()),
        BlocProvider(create: (_)=>inject.locator<WatchlistMovieBloc>()),
        BlocProvider(create: (_)=>inject.locator<SearchMovieBloc>()),

        // Series
        BlocProvider(create: (_)=>inject.locator<seriesPopularBloc>()),
        BlocProvider(create: (_)=>inject.locator<TopratedSeriesBloc>()),
        BlocProvider(create: (_)=>inject.locator<SeriesTodayBloc>()),
        BlocProvider(create: (_)=>inject.locator<SeriesOnAirBloc>()),
        BlocProvider(create: (_)=>inject.locator<WatchlistSeriesBloc>()),
        BlocProvider(create: (_)=>inject.locator<SeriesRecomendationBloc>()),
        BlocProvider(create: (_)=>inject.locator<SeriesDetailBloc>()),
        BlocProvider(create: (_)=>inject.locator<SearchSeriesBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            primaryColor: Colors.transparent,
            scaffoldBackgroundColor: const Color.fromARGB(255, 1, 3, 66),
        ),
        home: HomePageMovie(),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings set) {
          switch (set.name) {
            case HomePageMovie.initial_route:
              return MaterialPageRoute(builder: (_) => HomePageMovie());
            case PopularPageMovie.initial_route:
              return CupertinoPageRoute(builder: (_) => PopularPageMovie());
            case TopRatedPageMovie.initial_route:
              return CupertinoPageRoute(builder: (_) => TopRatedPageMovie());
            case DetailPageMovie.initial_route:
              final id = set.arguments as int;
              return MaterialPageRoute(
                builder: (_) => DetailPageMovie(id: id),
                settings: set,
              );
            case SearchPageMovie.initial_route:
              return CupertinoPageRoute(builder: (_) => SearchPageMovie());
            case WatchListPageMovie.initial_route:
              return MaterialPageRoute(builder: (_) => WatchListPageMovie());
            case AboutPage.initial_route:
              return MaterialPageRoute(builder: (_) => AboutPage());
            
            case SeriesDetailPage.initial_route:
              final id = set.arguments as int;
              return MaterialPageRoute(
                  builder: (_) => SeriesDetailPage(id: id), settings: set);
            case SeriesOnAirPage.initial_route:
              return MaterialPageRoute(builder: (_) => const SeriesOnAirPage());
            case SeriesTodayPage.initial_route:
              return MaterialPageRoute(builder: (_) => const SeriesTodayPage());
            case PopularSeriesPage.initial_route:
              return MaterialPageRoute(builder: (_) => const PopularSeriesPage());
            case TopRatedSeriesPage.initial_route:
              return CupertinoPageRoute(builder: (_) => TopRatedSeriesPage());
            case SearchSeriesPage.initial_route:
              return MaterialPageRoute(builder: (_) => const SearchSeriesPage());
            case WatchListSeriesPage.initial_route:
              return MaterialPageRoute(builder: (_) => const WatchListSeriesPage());
            case SeriesPage.initial_route:
              return MaterialPageRoute(builder: (_) => const SeriesPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
