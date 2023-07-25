import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/magic_ball/widget/magic_ball_widget.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = [
      MagicBall(),
      SizedBox(
        height: 20,
        width: 20,
      ),
    ];

    var infoText = Text(
      "Tap on the ball or shake your device to get an ultimate answer from your destiny!",
      style: TextStyle(
        backgroundColor: Colors.deepPurple,
        fontSize: 18,
        // fontWeight: FontWeight.bold,
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
