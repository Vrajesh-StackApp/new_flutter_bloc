import 'package:equatable/equatable.dart';

abstract class StreamTickerState extends Equatable{
  const StreamTickerState();

  @override
  List<Object?> get props => [];
}

class TickerInitial extends StreamTickerState{}

class TickerTickSuccess extends StreamTickerState{
  const TickerTickSuccess({required this.count});

  final int count;

  @override
  List<Object?> get props => [count];
}

class TickerComplete extends StreamTickerState{
  const TickerComplete();
}