// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, constant_identifier_names, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_even.dart';
import 'package:rextor_movie/presentation/bloc/series/series_popular_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_state_management.dart';
import 'package:rextor_movie/presentation/widgets/series_card.dart';
import 'package:flutter/material.dart';

class PopularSeriesPage extends StatefulWidget {
  static const initial_route = '/SeriesPopular_Page';
  const PopularSeriesPage({Key? key}) : super(key: key);

  @override
  State<PopularSeriesPage> createState() => _PopularSeriesPageState();
}

class _PopularSeriesPageState extends State<PopularSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
    context.read<seriesPopularBloc>().add(const GetDataSeries()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 0, 3, 71),
        title: const Text('series Popular'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<seriesPopularBloc, SeriesStateManagement>(
          builder: (context, state) {
            if (state is LoadingDataSeries) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedDataSeries) {
              final result = state.result;
              print('Berhasil');
              return ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    final series = result[index];
                    return SeriesCard(series);
                  },
                  
                
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text('state.message'),
              );
            }
          },
        ),
      ),
    );
  }
}
