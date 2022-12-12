// ignore_for_file: use_key_in_widget_constructors, camel_case_types, library_private_types_in_public_api, annotate_overrides, prefer_const_constructors, constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_data_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_watchlist_bloc.dart';
import 'package:rextor_movie/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';

import '../../bloc/movie_page_state_management.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
class WatchListPageMovie extends StatefulWidget {
  static const initial_route = '/movie_watchlist';

  @override
  _WatchListPageMovieStateManagementBloc createState() => _WatchListPageMovieStateManagementBloc();
}

class _WatchListPageMovieStateManagementBloc extends State<WatchListPageMovie>
    with RouteAware {
  @override
  void initState() {
    super.initState();
      Future.microtask(() {
      context
          .read<WatchlistMovieBloc>()
          .add(const GetDataMovieBloc());
    
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
     context
        .read<WatchlistMovieBloc>()
        .add(const GetDataMovieBloc());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist Movie'),backgroundColor: Color.fromARGB(255, 1, 6, 69)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistMovieBloc, MovieStateManagementBloc>(
        builder: (context, state) {
          if (state is LoadingDataMovie) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedDataMovie) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = state.result[index];
                return MovieCard(movie);
              },
              itemCount: state.result.length,
            );
          } else if (state is ErrorDataMovie) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
