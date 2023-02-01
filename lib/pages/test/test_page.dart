import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:parent_scale/main.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade500,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: NeumorphicButton(
                    minDistance: 0,
                    onPressed: () {},
                    style: const NeumorphicStyle(
                        border: NeumorphicBorder(isEnabled: true),
                        shape: NeumorphicShape.concave,
                        depth: 20,
                        boxShape: NeumorphicBoxShape.circle()),
                    child: const ParentScale(widthScale: 0.7, heightScale: 0.7, child: icon()),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class icon extends StatelessWidget {
  const icon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.close,
      color: Colors.black,
    );
  }
}
