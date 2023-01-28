import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shadowProvider = StateProvider<BoxShadow>((ref) {

  return BoxShadow(color:Colors.black.withOpacity(0.40), offset: Offset(-8, 4), blurRadius: 10 );

});
