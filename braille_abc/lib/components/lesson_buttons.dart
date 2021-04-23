import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';


import 'package:braille_abc/style.dart';


enum lessonButtonType {
  backward,
  forward,
}

class BackForthButton extends StatelessWidget {
  final lessonButtonType type;
  final Widget screen;


  const BackForthButton({Key key, this.type, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _angle = 0;
    if(type == lessonButtonType.backward){
      _angle = pi;
    }
    return Transform.rotate(angle: _angle, child:
      ElevatedButton(
        style: AppDecorations.nextButton,
        onPressed: () => null,
        child: Icon(
          AppIcon.getIcon(AppIcons.ContinueButton),
          size: ScreenParams.width(10, context),
          color: AppColors.sideIcon,
          semanticLabel: SemanticNames.getName(SemanticsType.Continue),
        ),
      ),
    );
  }
}

/*
class BackForthButton extends OnPressButton {
  BackForthButton(ScreenType screenType, Symbol symbol, SectionType sectionName, {this.screen})
      : super(screenType: screenType, sectionName: sectionName, symbol: null);

  final Widget screen;

  @override
  void pressContinueButton(BuildContext context) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => screen
        ),
      );
    }
  @override
  void pressHelpButton(BuildContext context) {}
}*/
