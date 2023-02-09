import 'package:flutter/material.dart';

class PlayPauseButtonAnim extends StatefulWidget {
  ///Create Animated Button Play -- Pause

  const PlayPauseButtonAnim({Key? key,this.onPlay, this.onPause,this.size, this.animDuration = 200}) : super(key: key);
  final int animDuration;
  final Function? onPlay;
  final Function? onPause;
  final double? size;

  @override
  State<PlayPauseButtonAnim> createState() => _PlayPauseButtonAnimState();

}

class _PlayPauseButtonAnimState extends State<PlayPauseButtonAnim>  with SingleTickerProviderStateMixin{
  late AnimationController animController;
  late Animation<double> animation;
  @override
  void initState() {
    animController = AnimationController(vsync: this,
        duration:  Duration(milliseconds: widget.animDuration)
    );

    animation = Tween<double>(begin: 0, end: 1).animate(animController);
    super.initState();

  }
  @override
  void dispose() {
    animController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onTap: (){
          if(animController.value == 0){
            animController.forward();
            widget.onPlay?.call();
          }
          if(animController.value == 1){
            animController.reverse(from: animController.value);
            widget.onPause?.call();
          }
        },
        child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: animation, size: widget.size,));
  }
}

