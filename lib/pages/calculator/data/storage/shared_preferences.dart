// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:arch_test/pages/calculator/data/storage/button_params_model.dart';
import 'package:arch_test/pages/calculator/data/storage/storage_interface.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension GetIndex on NeumorphicBoxShape {
  int getIndex() {
    int? boxShapeIndex;
    switch (this) {
      case NeumorphicBoxShape.circle():
        boxShapeIndex = 0;
        break;
      case NeumorphicBoxShape.rect():
        boxShapeIndex = 1;
        break;
      default:
        boxShapeIndex = 0;
    }
    return boxShapeIndex;
  }
}
// final SharedPrefProvider = Provider<SharedPreferences?>((ref) {
//   return null;
// });



 class SharedPrefThemeStorage implements ThemeStorage {
   SharedPrefThemeStorage(){
     SharedPreferences.getInstance().then((value) => sharedPref = value);
   }
  late final SharedPreferences sharedPref;
  static const String _PRIMARY_COLOR = 'primaryColor';
  static const String _BOX_SHAPE = 'boxShape';
  static const String _DEPTH = 'depth';
  static const String _BGCOLOR = 'backgroundColor';
  static const String _SHAPE = 'buttonShape';
  static const String _INTENSITY = 'intensity';
  static const String _SURFACE_INTENSITY = 'surface_intensity';

  static Future<Color> getBackgroundColor() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Color color = Color(sp.getInt(_BGCOLOR) ?? MyColors.darkGrey__darker.value);
    return color;
  }
  static Future<Color> getPrimaryColor() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    int intColor = sp.getInt(_PRIMARY_COLOR) ?? -1;
    // print('getted color: $intColor');
    if (intColor == -1) {
      throw Error();
    } else {
      return Color(intColor);
    }
  }
  _saveIntensity(double value)async{
    bool isSaved = await sharedPref.setDouble(_INTENSITY, value);
    if(isSaved){
      print('intencity saved: $value');
    }
  }
  double? _getIntensity() {
    return sharedPref.getDouble(_INTENSITY);
  }
  _saveSurfaceIntensity(double value)async{
    bool isSaved = await sharedPref.setDouble(_SURFACE_INTENSITY, value);
    if(isSaved) print('surfaceIntencity saved: $value');
  }
  double _getSurfaceIntensity() {
    final double? value =  sharedPref.getDouble(_SURFACE_INTENSITY);
    if(value==null){
      print("can't get value surfaceIntencity");
      return 0.2;
    } else{
      return value;
    }
  }


  static savePrimaryColor(Color color) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(_PRIMARY_COLOR, color.value);
  }

  static saveButtonShape(NeumorphicShape shape) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(_SHAPE, shape.index);
  }

  static saveBoxShape(NeumorphicBoxShape boxShape) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    int boxShapeIndex = boxShape.getIndex();
    sp.setInt(_BOX_SHAPE, boxShapeIndex);
  }

  static Future<NeumorphicBoxShape> getBoxShape() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    int index = sp.getInt(_BOX_SHAPE) ?? -1;
    switch (index) {
      case 0:
        return const NeumorphicBoxShape.circle();
      case 1:
        return const NeumorphicBoxShape.rect();
      default:
        return const NeumorphicBoxShape.circle();
    }
  }

  static Future<Shape> getButtonShape() async {
    final sp = await SharedPreferences.getInstance();
    final value = sp.getInt(_SHAPE);
    if (value != null) {
      switch (value) {
        case 0:
          return Shape.convex;
        case 1:
          return Shape.concave;
        case 2:
          return Shape.flat;
        default:
          return Shape.convex;
      }
    } else {
      return Shape.convex;
    }
  }

  _getButtonsDepth(){
    final double? value =  sharedPref.getDouble(_DEPTH);
    if(value==null){
      print("can't get value depth");
      return 3;
    } else{
      return value;
    }
  }

  static saveButtonsDepth(double depth) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setDouble(_DEPTH, depth);
  }


  @override
  Future<CalcThemeParams> loadTheme() async {
    Color primaryColor = await getPrimaryColor();
    Color backgroundColor = await getBackgroundColor();
    NeumorphicBoxShape boxShape = await getBoxShape();
    Shape buttonShape = await getButtonShape();
    double depth = await _getButtonsDepth();
    double intensity = _getIntensity() ?? 0.2;
    double surfaceIntensity =  _getSurfaceIntensity();

    return CalcThemeParams(
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        boxShape: boxShape,
        intencity: intensity,
        surfaceIntencity:surfaceIntensity,
        buttonDepth: depth,
        buttonShape: buttonShape);
  }

  @override
  Future<bool> saveTheme(CalcThemeParams params) async{
    if(params.primaryColor!=null) savePrimaryColor(params.primaryColor!);
    if(params.boxShape!= null) saveBoxShape(params.boxShape!);
    if(params.buttonShape!=null){
      if(params.buttonShape.runtimeType == NeumorphicShape){
        final shape = params.buttonShape as NeumorphicShape;
        saveButtonShape(shape);
      }
    }
    if(params.intencity!=null){
      _saveIntensity(params.intencity!);

    }
    if(params.buttonDepth!= null)saveButtonsDepth(params.buttonDepth!);
    if(params.surfaceIntencity!=null)_saveSurfaceIntensity(params.surfaceIntencity!);

    return true;
  }
}
