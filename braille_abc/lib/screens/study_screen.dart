import 'package:braille_abc/components/lesson_buttons.dart';
import 'package:braille_abc/components/lesson_section_widget.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class LessonsNum {
  static int parentNum;
  static int num;
}

@immutable
class LessonsScreen extends NavigationScreen {
  const LessonsScreen({
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);


  @override
  Widget build(BuildContext context) {
    return nonSwipeable(
      context,
      CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title:  ScreenNames.getName(ScreenType.StudyList),
        ),
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenParams.height(4, context),
              ),
              Container(
                height: ScreenParams.heightIOS14(80, context),
                child: ListView(
                  children: <Widget>[
                    for (int i = 0; i < StudyModel.lessonsNum; i++)
                      Semantics(
                        label: SemanticNames.getName(SemanticsType.NumberLessonInStudy) +
                            StudyModel.getLessonByIndex(i).number.toString() +
                            ". " +
                            SemanticNames.getName(SemanticsType.ThemeOfLessonInStudy) +
                            StudyModel.getLessonByIndex(i).name,
                        child: ExcludeSemantics(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            child: LessonSectionWidget(
                              lesson: StudyModel.getLessonByIndex(i),
                            ),
                          ),
                        ),
                      ),
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

@immutable
class TextLessonScreen extends SectionScreen {
  const TextLessonScreen(
    this.text, {
    Key key,
        this.title,
    Screen helpPage,
    Screen previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return nonSwipeable(
      context,
      CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title: ScreenNames.getName(ScreenType.Lesson) + " " + title,
        ),
        child: SafeArea(
          child: Container(
            height: ScreenParams.heightIOS14(100, context),
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildBackForthButton(context, lessonButtonType.backward, null),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Html(
                      data: text,
                      defaultTextStyle: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                buildBackForthButton(context, lessonButtonType.forward, null)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
