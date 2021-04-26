import 'package:braille_abc/models/practice_model.dart';
import 'package:flutter/cupertino.dart';

class DefaultParams{
  static ValueNotifier<bool> update = ValueNotifier(true);

  static void toDefaultParams(){
    Practice.updatePool();
    update.value = (!update.value);
  }
}
