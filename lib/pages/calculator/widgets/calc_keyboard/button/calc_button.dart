import 'package:flutter/material.dart';
import '../../../presentation/style.dart';
import 'style.dart' as styles;
import 'anim_button.dart';

class CalculButton extends StatelessWidget {
  const CalculButton({
    Key? key,
    this.value = '',
    this.size,
    this.style = styles.squareButton,
    this.animDuration = 100,
required this.onPressed,
    this.child,
  }) : super(key: key);
  final String value;
  final int animDuration;
  final Function() onPressed;
  final Widget? child;
  final double fontSize = 32;
  final BoxDecoration? style;
  final double? size;



  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        width:size,
        height: size,
        child: AnimButton(
          style: style,
          onTap: (){
            onPressed();
          },

          child: Center(
            child:  child ??
                Text(
                  value,
                  style: buttonsText,
                ),
          ),
        ),
      ),
    );
  }
}

