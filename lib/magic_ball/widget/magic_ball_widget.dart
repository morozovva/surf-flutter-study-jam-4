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
    //shake management
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
      onTap: () =>
          magicBallBloc.add(MagicBallFetchEvent()), //we tap => we fetch
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/ball.png',
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<MagicBallBloc, MagicBallState>(
              bloc: magicBallBloc,
              listenWhen: (previous, current) =>
                  current is MagicBallActionState,
              buildWhen: (previous, current) =>
                  current is! MagicBallActionState,
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.runtimeType) {
                  //if loading show gif of loading
                  case MagicBallFetchingLoadingState:
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(100.0),
                        child: Image.asset(
                          'assets/images/loading.gif',
                        ),
                      ),
                    );
                  //error case shows text info
                  case MagicBallFetchingErrorState:
                    return const Text(
                      "Oh, it's too hard sorry:(",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    );
                  //if success we show reading to client
                  case MagicBallFetchingSuccessfulState:
                    final successState =
                        state as MagicBallFetchingSuccessfulState;
                    return Text(
                      successState.reading.reading,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    );
                }
                //default textt when entering app
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
          ),
        ],
      ),
    );
  }
}
