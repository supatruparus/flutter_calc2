import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});
