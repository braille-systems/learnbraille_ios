import 'package:braille_abc/components/expansion_tile.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:flutter/cupertino.dart';

class DefaultParams{
  static final update = ValueNotifier(true);

  static void toDefaultParams(){
    Practice.updatePool();
    update.value = true;
    for(var i = 0; i < AppModel.sections.length; i++){
      if(AppModel.sections[i].expansionTile.currentState != null){
        AppModel.sections[i].expansionTile.currentState.collapse();
      }
    }
  }
}
