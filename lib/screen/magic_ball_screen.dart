import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/magic_ball/widget/magic_ball_widget.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //array of magic ball and some spacing (arrayed to not duplicate)
    var items = [
      const MagicBall(),
      const SizedBox(
        height: 30,
        width: 30,
      ),
    ];

//information text on the bottom of tthe page
    var infoText = const Text(
      "Tap on the ball or shake your device to get an ultimate answer from magic ball!",
      style: TextStyle(
        backgroundColor: Colors.black87,
        fontSize: 18,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                //checking device orientation
                //horisontal
                if (constraints.maxWidth > constraints.maxHeight) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...items,
                      Expanded(
                        child: infoText,
                      )
                    ],
                  );
                } else {
                  //vertical
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [...items, infoText],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
