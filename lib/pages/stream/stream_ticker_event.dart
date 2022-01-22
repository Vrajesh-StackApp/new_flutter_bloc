import 'package:equatable/equatable.dart';

abstract class StreamTickerEvent extends Equatable{
  const StreamTickerEvent();

  @override
  List<Object?> get props => [];
}

class TickerStarted extends StreamTickerEvent{
  const TickerStarted();
}

class _TickerTicked extends StreamTickerEvent{
  const _TickerTicked(this.tick);

  final int tick;

  @override
  List<Object?> get props => [tick];
}