import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:flutter/cupertino.dart';

class DefaultParams{
  static final update = ValueNotifier(true);

  static void toDefaultParams(){
    Practice.updatePool();
    update.value = (!update.value);
    for(var i = 0; i < AppModel.sections.length; i++){
      AppModel.sections[i].expansionTile.value = GlobalKey();
    }
  }
}
