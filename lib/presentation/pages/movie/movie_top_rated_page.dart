// ignore_for_file: use_key_in_widget_constructors, constant_identifier_names, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_data_bloc.dart';
import 'package:rextor_movie/presentation/bloc/movie_top_rated_bloc.dart';
import 'package:rextor_movie/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import '../../bloc/movie_page_state_management.dart';

class TopRatedPageMovie extends StatefulWidget {
  static const initial_route = '/movie_toprated';

  @override
  _TopRatedPageMovieStateManagementBloc createState() => _TopRatedPageMovieStateManagementBloc();
}

class _TopRatedPageMovieStateManagementBloc extends State<TopRatedPageMovie> {
  @override
  void initState() {
    super.initState();
   Future.microtask(
        () => context.read<TopRatedMovieBloc>().add(const GetDataMovieBloc()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Movies'),backgroundColor: Color.fromARGB(255, 1, 6, 69),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedMovieBloc, MovieStateManagementBloc>
        (
          builder: (context, state) {
            if (state is LoadingDataMovie) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedDataMovie) {
              final result = state.result;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = result[index];
                  return MovieCard(movie);
                },
                itemCount: result.length,
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
}
