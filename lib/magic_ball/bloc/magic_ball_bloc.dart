import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/magic_ball/model/reading.dart';
import 'package:surf_practice_magic_ball/magic_ball/repo/reading_repo.dart';

part 'magic_ball_event.dart';
part 'magic_ball_state.dart';

class MagicBallBloc extends Bloc<MagicBallEvent, MagicBallState> {
  MagicBallBloc() : super(MagicBallInitial()) {
    on<MagicBallFetchEvent>(magicBallFetchEvent);
  }

  //fetching reading event(what after what after what)
  FutureOr<void> magicBallFetchEvent(
      MagicBallFetchEvent event, Emitter<MagicBallState> emit) async {
    try {
      emit(MagicBallFetchingLoadingState());
      Reading reading = await ReadingRepo.fetchReading();
      emit(MagicBallFetchingSuccessfulState(reading: reading));
      if (reading.reading == "") {
        emit(MagicBallFetchingErrorState());
      }
    } on Error {
      print("x");
    }
  }
}
