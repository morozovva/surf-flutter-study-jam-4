part of 'magic_ball_bloc.dart';

@immutable
abstract class MagicBallEvent {}

//event where we fetch data
class MagicBallFetchEvent extends MagicBallEvent {}
