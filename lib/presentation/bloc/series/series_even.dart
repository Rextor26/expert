
import 'package:equatable/equatable.dart';



abstract class SeriesEvent extends Equatable {
  const SeriesEvent();
}

class GetDataSeries extends SeriesEvent {
  const GetDataSeries();

  @override
  List<Object> get props => [];
}

class GetDataSeriesWithId extends SeriesEvent {
  final int id;
  const GetDataSeriesWithId(this.id);

  @override
  List<Object> get props => [id];
}
