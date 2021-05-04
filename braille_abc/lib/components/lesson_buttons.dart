import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:braille_abc/style.dart';
import 'package:braille_abc/models/lesson_model.dart';

enum lessonButtonType {
  backward,
  forward,
}

class BackForthButton extends StatelessWidget {
  final lessonButtonType type;
  final Symbol symbol;

  const BackForthButton({Key key, @required this.type, @required this.symbol}) : super(key: key);

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
        onPressed: () {
          if (isForward()) {
            if (StudyModel.currentLessonType == lessonType.practice) {
              if (PracticeResults.checkAnswer(symbol.getDotsInfo())) {
                navigate = StudyModel.incLessonPartIndex();
              }
            } else {
              navigate = StudyModel.incLessonPartIndex();
            }
          } else if (isBackward()) {
            navigate = StudyModel.decLessonPartIndex();
          }
          if (navigate) {
            Navigator.of(context).push(
               LessonRoute(child: StudyModel.curLessonPart.build(context), isForward: isForward()),
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

Column buildBackForthButton(BuildContext context, lessonButtonType type, Symbol symbol) {
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
            ),
          ),
        ),
      ),
    ],
  );
}

class LessonRoute extends CupertinoPageRoute{
  LessonRoute({@required this.child, @required this.isForward}):
    super(builder: (BuildContext context) => child);

  final Widget child;
  final bool isForward;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
    return SlideTransition(
      position: Tween<Offset>(
        begin: (isForward) ? Routes.nextScreen: Routes.previousScreen,
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
