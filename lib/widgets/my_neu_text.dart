
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeuText extends StatelessWidget {
  const NeuText(this.text,{Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return NeumorphicText(text, );
  }
}
