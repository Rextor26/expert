// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, constant_identifier_names, library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/domain/entities/movie/movie.dart';
import 'package:rextor_movie/presentation/bloc/movie_data_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_page_state_management.dart';
import 'package:rextor_movie/presentation/bloc/movie_popular_bloc.dart';
import 'package:rextor_movie/presentation/pages/about_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_detail_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_popular_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_search_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_top_rated_page.dart';
import 'package:rextor_movie/presentation/pages/movie/movie_watchlist_page.dart';
import 'package:rextor_movie/presentation/pages/series/series_page.dart';
import 'package:flutter/material.dart';

import '../../bloc/movie_now_playing_bloc.dart.dart';
import '../../bloc/movie_top_rated_bloc.dart';

class HomePageMovie extends StatefulWidget {
  static const initial_route = '/homepage_movie';

  @override
  _HomePageMovieStateManagementBloc createState() => _HomePageMovieStateManagementBloc();
}

class _HomePageMovieStateManagementBloc extends State<HomePageMovie> {
  @override
  void initState() {
    super.initState();
   Future.microtask(() => {
          context.read<MovieBloc>().add(const GetDataMovieBloc()),
          context.read<PopularMovieBloc>().add(const GetDataMovieBloc()),
          context.read<TopRatedMovieBloc>().add(const GetDataMovieBloc()),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 0, 35, 72),
        child: Column(
          children: [
            const Center(
              child: UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/ui.jpg'),
                  ),
                  accountName: Text('Taufiq.J.K'),
                  accountEmail: Text('taufiq@gmail.com')),
            ),
            
            ListTile(
               leading: const Icon(Icons.tv),
              title: const Text('Series'),
              onTap: () => {
                Navigator.pushNamed(context, SeriesPage.initial_route)},
            ),
            ListTile(
               leading: const Icon(Icons.save_alt_outlined),
              title: const Text('Watchlist Movie'),
              onTap: () {
                // Navigator.pushNamed(context, WatchlistPage.routeName);
                Navigator.pushNamed(context, WatchListPageMovie.initial_route);
              },
            ),      
            const ListTile(
              title: Text('Informasi',style: TextStyle(fontWeight: FontWeight.bold),),
             
            ),      
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.initial_route);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 3, 71),
       title: const Text("Rex Movie"),
        leading: 
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPageMovie.initial_route);
            },
            icon: Icon(Icons.search),
          )
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Now Playing',
                  style: TextStyle(color: Color.fromARGB(255, 247, 243, 243))),
              BlocBuilder<MovieBloc, MovieStateManagementBloc>(
                builder: (context, state) {
                  if (state is LoadingDataMovie) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedDataMovie) {
                    final result = state.result;
                    return MovieList(result);
                  } else {
                    return const Text('data is invalid');
                  }
                },
              ),
              kategori(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularPageMovie.initial_route),
              ),
               BlocBuilder<PopularMovieBloc, MovieStateManagementBloc>(
                builder: (context, state) {
                  if (state is LoadingDataMovie) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedDataMovie) {
                    final result = state.result;
                    return MovieList(result);
                  } else {
                    return const Text('data is invalid');
                  }
                },
              ),
              kategori(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedPageMovie.initial_route),
              ),
              BlocBuilder<TopRatedMovieBloc, MovieStateManagementBloc>(
                builder: (context, state) {
                  if (state is LoadingDataMovie) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedDataMovie) {
                    final result = state.result;
                    return MovieList(result);
                  } else {
                    return const Text('data is invalid');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row kategori({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Color.fromARGB(255, 248, 245, 245)),
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DetailPageMovie.initial_route,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
