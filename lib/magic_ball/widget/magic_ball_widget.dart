import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/magic_ball/bloc/magic_ball_bloc.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  final MagicBallBloc magicBallBloc = MagicBallBloc();

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        magicBallBloc.add(MagicBallFetchEvent());
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => magicBallBloc.add(MagicBallFetchEvent()),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/ball.png',
          ),
          BlocConsumer<MagicBallBloc, MagicBallState>(
            bloc: magicBallBloc,
            listenWhen: (previous, current) => current is MagicBallActionState,
            buildWhen: (previous, current) => current is! MagicBallActionState,
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.runtimeType) {
                case MagicBallFetchingLoadingState:
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: Image.asset(
                      'assets/images/loading.gif',
                    ),
                  ));
                case MagicBallFetchingErrorState:
                  return const Text(
                    "Oh, it's too hard sorry:(",
                    style: TextStyle(
                      // backgroundColor: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  );
                case MagicBallFetchingSuccessfulState:
                  final successState =
                      state as MagicBallFetchingSuccessfulState;
                  return Text(
                    successState.reading.reading,
                    style: const TextStyle(
                      // backgroundColor: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  );
              }
              return const Text(
                "Ask me anything!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }
}
