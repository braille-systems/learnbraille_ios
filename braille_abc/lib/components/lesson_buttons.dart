import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/app_saves.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:braille_abc/screens/after_study_screen.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/screens/letter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:braille_abc/style.dart';
import 'package:braille_abc/models/lesson_model.dart';

import 'package:braille_abc/components/help_widgets.dart';

enum lessonButtonType {
  backward,
  forward,
}

class BackForthButton extends StatelessWidget {
  final lessonButtonType type;
  final Symbol symbol;
  final ValueNotifier isTapped;

  const BackForthButton({Key key, @required this.type, @required this.symbol, @required this.isTapped}) : super(key: key);

  bool isForward() {
    return type == lessonButtonType.forward;
  }

  bool isBackward() {
    return type == lessonButtonType.backward;
  }

  @override
  Widget build(BuildContext context) {
    bool navigate = false;
    double _angle = 0;
    if (type == lessonButtonType.backward) {
      _angle = pi;
    }
    return Transform.rotate(
      angle: _angle,
      child: ElevatedButton(
        style: AppDecorations.nextButton,
        onPressed: () async {
          if (isForward()) {
            if(isTapped != null) {
              if (!isTapped.value) {
                isTapped.value = !isTapped.value;
                return;
              }
            }
              if (StudyModel.currentLessonType == lessonType.practice) {
                if (LetterInfo.of(context).color == AppColors.symbolContainer) {
                  bool isCorrect = PracticeResults.checkAnswer(symbol.getDotsInfo());
                  LetterInfo.of(context).setColor(isCorrect);
                }
                else {
                  if (LetterInfo.of(context).color == AppColors.correctAnswer) {
                    await Saves.saveLessonProgress();
                    PracticeResults.dotDefault();
                    navigate = StudyModel.incLessonPartIndex();
                  }
                  else{
                    LetterInfo.of(context).setDefaultColor();
                  }
                }
              } else {
                await Saves.saveLessonProgress();
                navigate = StudyModel.incLessonPartIndex();
              }
            await Saves.loadLessonProgress();
          } else if (isBackward()) {
            if(!StudyModel.isAfterStudy) {
              navigate = StudyModel.decLessonPartIndex();
            } else {
              navigate = true;
              StudyModel.isAfterStudy = false;
            }
          }
          if (navigate) {
            await Navigator.of(context).push(
              LessonRoute(child: StudyModel.curLessonPart.build(context), isForward: isForward()),
            );
          } else if (StudyModel.isFinalStep()) {
            StudyModel.isAfterStudy = true;
            await Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => AfterStudyScreen(
                  previousPage: AppModel.navigationScreens[navigation.StudyScreen],
                  helpPage:  Help(
                    helpName: HelpSections.EndLessonsScreen,
                  ),
                  lessonNumber: StudyModel.curLesson.number,
                  lessonName: StudyModel.curLesson.name,
                ),
              ),
            );
          }
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

Column buildBackForthButton(BuildContext context, lessonButtonType type, Symbol symbol, ValueNotifier isTapped) {
  return Column(
    children: [
      symbol == null
          ? AppDecorations.getBackFortButtonPaddingTextScreen(context)
          : AppDecorations.getBackFortButtonPaddingLetterScreen(context),
      SizedBox(
        height: ScreenParams.height(Sizes.getBackFortButtonSize().height, context),
        width: ScreenParams.width(Sizes.getBackFortButtonSize().width, context),
        child: Semantics(
          label: type == lessonButtonType.backward
              ? SemanticNames.getName(SemanticsType.BackForthButton)
              : SemanticNames.getName(SemanticsType.Continue),
          button: true,
          child: ExcludeSemantics(
            child: BackForthButton(
              type: type,
              symbol: symbol,
              isTapped: isTapped,
            ),
          ),
        ),
      ),
    ],
  );
}

class LessonRoute extends CupertinoPageRoute {
  LessonRoute({@required this.child, @required this.isForward}) : super(builder: (BuildContext context) => child);

  final Widget child;
  final bool isForward;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: (isForward) ? Routes.nextScreen : Routes.previousScreen,
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
