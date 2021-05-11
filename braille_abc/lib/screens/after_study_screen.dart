import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/components/lesson_buttons.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/style.dart';

class AfterStudyScreen extends SectionScreen {
  const AfterStudyScreen({
    Key key,
    Screen helpPage,
    Screen previousPage,
    this.lessonNumber,
    this.lessonName,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  final int lessonNumber;
  final String lessonName;

  @override
  Widget build(BuildContext context) {
    return nonSwipeable(
      context,
      CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title: ScreenNames.getName(ScreenType.EndOfLesson) + ' ' + lessonNumber.toString(),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ScreenParams.height(5, context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MessageBox(
                    lessonNumber: lessonNumber,
                    lessonName: lessonName,
                  ),
                ],
              ),
              SizedBox(
                height: ScreenParams.height(6, context),
              ),
              Container(
                margin: EdgeInsets.only(right: ScreenParams.width(10, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenParams.height(Sizes.getBackFortButtonSize().height, context),
                      width: ScreenParams.width(Sizes.getBackFortButtonSize().width, context),
                      child: Semantics(
                        label: SemanticNames.getName(SemanticsType.BackForthButton),
                        button: true,
                        child: ExcludeSemantics(
                          child: BackForthButton(
                            type: lessonButtonType.backward,
                            symbol: null,
                          ),
                        ),
                      ),
                    ),
                    BackButtonAfterStudy(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageBox extends StatefulWidget {
  const MessageBox({
    Key key,
    @required this.lessonName,
    @required this.lessonNumber,
  }) : super(key: key);

  final int lessonNumber;
  final String lessonName;

  @override
  _MessageBox createState() => _MessageBox(lessonNumber, lessonName);
}

class _MessageBox extends State<MessageBox> {
  _MessageBox(int lessonNumber, String lessonName) {
    textInBox = StudyModel.isFinalLesson()
        ? AfterStudyText.textAfterCourse(lessonNumber, lessonName)
        : AfterStudyText.textAfterLesson(lessonNumber, lessonName);
  }

  String textInBox;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: textInBox,
      button: false,
      child: ExcludeSemantics(
        child: Container(
          width: ScreenParams.width(80, context),
          height: ScreenParams.height(40, context),
          decoration: AppDecorations.letterWidget(AppColors.symbolContainer),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: AutoSizeText(
                textInBox,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.afterStudyTextSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackButtonAfterStudy extends StatefulWidget {
  @override
  _BackButtonAfterStudy createState() => _BackButtonAfterStudy();
}

class _BackButtonAfterStudy extends State<BackButtonAfterStudy> {
  void backToMainMenu() {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => AppModel.navigationScreens[navigation.StudyScreen]),
        (Route<dynamic> route) => false);
    scakey.currentState.onItemTapped(0);
    scakey.currentState.displayTapBar(true);
  }

  void toTheNextLesson() {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => AppModel.navigationScreens[navigation.StudyScreen]),
        (Route<dynamic> route) => false);
    int nextLessonIndex = StudyModel.currentLessonIndex + 1;
    StudyModel.currentLessonIndex = nextLessonIndex;
    StudyModel.rebootLessons();
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => StudyModel.getLessonByIndex(nextLessonIndex).lessonComponent[0].build(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isFinalLesson = StudyModel.isFinalLesson();

    return Semantics(
      label: isFinalLesson
          ? AfterStudyText.getButtonName(AfterStudy.AfterCourse)
          : AfterStudyText.getButtonName(AfterStudy.AfterLesson),
      button: true,
      child: ExcludeSemantics(
        child: CupertinoButton(
          onPressed: isFinalLesson ? backToMainMenu : toTheNextLesson,
          color: AppColors.first,
          borderRadius: BorderRadius.circular(Sizes.borderRadiusSize),
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: ScreenParams.width(65, context),
            height: ScreenParams.height(30, context),
            child: isFinalLesson ? buildAfterCourseText(context) : buildAfterLessonText(context),
          ),
        ),
      ),
    );
  }
}

Widget buildAfterLessonText(BuildContext context) {
  return Card(
    elevation: 0,
    color: AppColors.first,
    child: Center(
      child: ListTile(
        title: AutoSizeText(
          AfterStudyText.getButtonName(AfterStudy.AfterLesson),
          style: afterStudyButtonTextStyle(),
        ),
        trailing: Icon(
          AppIcon.getIcon(AppIcons.ContinueButton),
          size: ScreenParams.width(10, context),
          color: AppColors.sideIcon,
        ),
      ),
    ),
  );
}

Widget buildAfterCourseText(BuildContext context) {
  return Center(
    child: AutoSizeText(
      AfterStudyText.getButtonName(AfterStudy.AfterCourse),
      style: afterStudyButtonTextStyle(),
      textAlign: TextAlign.center,
    ),
  );
}

TextStyle afterStudyButtonTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.second,
    fontSize: Sizes.afterStudyTextSize,
    shadows: <Shadow>[
      Styles.buildButtonShadow(),
      for (var stroke in Styles.buildStroke(0.25)) stroke,
    ],
  );
}
