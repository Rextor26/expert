// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';

import '../../bloc/search_page_bloc.dart';
import '../../bloc/search_page_event.dart';
import '../../bloc/search_page_state_management.dart';

class SearchPageMovie extends StatelessWidget {
  static const initial_route = 'search_movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 1, 6, 69),
        title: Text('Search Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             TextField(
              onChanged: (query) {
                context.read<SearchMovieBloc>().add(QueryInput(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search title movie',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
          
            ),
           BlocBuilder<SearchMovieBloc, SearchStateMovie>(
              builder: (context, state) {
                if (state is SearchMovieLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchMovieHasData) {
                  final result = state.result;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = result[index];
                        return MovieCard(movie);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else if (state is SearchMovieError) {
                  return Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
