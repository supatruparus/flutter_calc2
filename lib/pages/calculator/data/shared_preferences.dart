// ignore_for_file: non_constant_identifier_names

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  static const String _PRIMARY_COLOR = 'primaryColor';
  static const String _BOX_SHAPE = 'boxShape';
  static const String _DEPTH = 'depth';
  static Future<Color> getPrimaryColor() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    int intColor = sp.getInt(_PRIMARY_COLOR) ?? -1;

    // print('getted color: $intColor');
    return Color(intColor);
  }

  static savePrimaryColor(Color color) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(_PRIMARY_COLOR, color.value);
    // print('color saved: ${color.value}');
  }

  static saveBoxSape(NeumorphicBoxShape boxShape) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    int boxShapeIndex = boxShape == NeumorphicBoxShape.circle() ? 0 : 1;

    sp.setInt(_BOX_SHAPE, boxShapeIndex);
  }

  static Future<NeumorphicBoxShape> getBoxShape() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    int index = sp.getInt(_BOX_SHAPE) ?? -1;
    switch (index) {
      case 0:
        return NeumorphicBoxShape.circle();
        break;
      case 1:
        return NeumorphicBoxShape.rect();
      default:
        return NeumorphicBoxShape.circle();
    }
  }

  static saveButtonsDepth(double depth) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setDouble(_DEPTH, depth);
  }
}
