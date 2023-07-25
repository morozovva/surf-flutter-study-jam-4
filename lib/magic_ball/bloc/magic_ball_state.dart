part of 'magic_ball_bloc.dart';

@immutable
//class mainly for fetching and other non-active staff
abstract class MagicBallState {}

//class for client-action staff, i didnt have time to use
abstract class MagicBallActionState extends MagicBallState {}

//just initial state
class MagicBallInitial extends MagicBallState {}

//reading loading state
class MagicBallFetchingLoadingState extends MagicBallState {}

//if errror occures, it will be here
class MagicBallFetchingErrorState extends MagicBallState {}

//in case of success and we have reading!
class MagicBallFetchingSuccessfulState extends MagicBallState {
  //reading that we got
  final Reading reading;
  MagicBallFetchingSuccessfulState({
    required this.reading,
  });
}
