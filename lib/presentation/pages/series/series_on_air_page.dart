// ignore_for_file: avoid_print, library_private_types_in_public_api, prefer_const_constructors, constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rextor_movie/presentation/bloc/series/series_even.dart';
import 'package:rextor_movie/presentation/bloc/series/series_state_management.dart';
import 'package:rextor_movie/presentation/widgets/series_card.dart';
import 'package:flutter/material.dart';

import '../../bloc/series/series_on_air.dart';

class SeriesOnAirPage extends StatefulWidget {
  static const initial_route = '/on-the-air';
  const SeriesOnAirPage({Key? key}) : super(key: key);
  @override
  _SeriesOnAirState createState() => _SeriesOnAirState();
}

class _SeriesOnAirState extends State<SeriesOnAirPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
    context.read<SeriesOnAirBloc>().add(const GetDataSeries()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 3, 71),
        title: const Text('Series on AirThe Air'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<SeriesOnAirBloc, SeriesStateManagement>(
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
                child: Text('')
              );
            }
          },
        ),
      ),
    );
  }
}
