part of 'magic_ball_bloc.dart';

@immutable
abstract class MagicBallState {}

abstract class MagicBallActionState extends MagicBallState {}

class MagicBallInitial extends MagicBallState {}

class MagicBallFetchingLoadingState extends MagicBallState {}

class MagicBallFetchingErrorState extends MagicBallState {}

class MagicBallFetchingSuccessfulState extends MagicBallState {
  final Reading reading;
  MagicBallFetchingSuccessfulState({
    required this.reading,
  });
}
