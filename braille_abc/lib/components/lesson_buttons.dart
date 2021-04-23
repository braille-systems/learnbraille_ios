import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:braille_abc/screens/study_screen.dart';
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

  const BackForthButton({Key key,  @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _angle = 0;
    if (type == lessonButtonType.backward) {
      _angle = pi;
    }
    return Transform.rotate(
      angle: _angle,
      child: ElevatedButton(
        style: AppDecorations.nextButton,
        onPressed: () {
          if (type == lessonButtonType.backward && StudyModel.currentLessonPart > 0) {
            StudyModel.currentLessonPart--;
          } else if (type == lessonButtonType.forward &&
              StudyModel.currentLessonPart < StudyModel.lessons.length - 1) {
            StudyModel.currentLessonPart++;
          };
          Navigator.of(context).push(
            CupertinoPageRoute(
                builder: (context) => LessonsScreen(
                  StudyModel.lessons[StudyModel.currentLesson].lessonComponents[StudyModel.currentLessonPart],
                  helpPage: null,
                  previousPage: AppModel.navigationScreens[navigation.StudyScreen],
                )),
          );
        },
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
