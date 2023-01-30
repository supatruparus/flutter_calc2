import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shadowProvider = StateProvider<BoxShadow>((ref) {
  return BoxShadow(
      color: Colors.black.withOpacity(0.40), offset: const Offset(-8, 4), blurRadius: 10);
});
