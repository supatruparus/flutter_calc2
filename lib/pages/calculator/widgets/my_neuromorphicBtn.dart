// ignore: file_names
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyNeuromorphicButton extends StatelessWidget {
  const MyNeuromorphicButton({
    Key? key,
    this.child,
    required this.onPressed,
  }) : super(key: key);
  final Widget? child;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeumorphicButton(

          // pressed: isPressed,
          // minDistance: 0.3,
          onPressed: onPressed,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          // alignment: Alignment.center,
          // height: buttonSize, width: buttonSize,
          style: const NeumorphicStyle(
            // shadowDarkColorEmboss: Colors.red,
            // shadowLightColorEmboss: Colors.green,
            boxShape: NeumorphicBoxShape.circle(),
            lightSource: LightSource.topRight,
            intensity: 0.3,
            shape: NeumorphicShape.concave,
            // depth: -30,
            // surfaceIntensity: 1,
            // shadowDarkColor: Colors.black,
            // shadowLightColor: Colors.white70,
            color: Color.fromRGBO(136, 136, 136, 1),
          ),
          child: Center(
            child: FittedBox(
              child: child,
            ),
          )),
    );
  }
}
