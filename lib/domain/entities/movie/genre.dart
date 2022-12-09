// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final int id;
  final String name;
  Genre({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
