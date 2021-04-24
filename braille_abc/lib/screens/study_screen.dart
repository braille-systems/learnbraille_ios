import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/components/lesson_buttons.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/style.dart';
import 'package:flutter_html/flutter_html.dart';
/*
@immutable
class LessonsScreen extends SectionScreen {
  const LessonsScreen(
    this.lessonComponent, {
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  final LessonComponents lessonComponent;

  @override
  Widget build(BuildContext context) {
    return lessonComponent.build(context);
  }
}*/

@immutable
class LessonsScreenSections extends NavigationScreen {
  const LessonsScreenSections({
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
          title: ScreenNames.getName(ScreenType.Study),
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
                    for (int i = 0; i < StudyModel.lessons.length; i++)
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        child: LessonSectionWidget(
                          lesson: StudyModel.lessons[i],
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
class TextInfoScreen extends NavigationScreen {
  const TextInfoScreen(this.text, {
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  final String text;

  @override
  Widget build(BuildContext context) {
    return nonSwipeable(
      context,
      CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title: ScreenNames.getName(ScreenType.Study),
        ),
        child: SafeArea(
          child:  Container(
            height: ScreenParams.heightIOS14(100, context),
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                      height: ScreenParams.width(90, context),
                    ),
                    SizedBox(
                      height: ScreenParams.width(60, context),
                      width: ScreenParams.width(15, context),
                      child: BackForthButton(type: lessonButtonType.backward),
                    ),
                  ],
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Html(
                          data: text,
                          defaultTextStyle: TextStyle(fontSize: 30),
                        ))),
                Column(
                  children: [
                    SizedBox(
                      height: ScreenParams.width(90, context),
                    ),
                    SizedBox(
                      height: ScreenParams.width(60, context),
                      width: ScreenParams.width(15, context),
                      child: BackForthButton(type: lessonButtonType.forward),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LessonSectionWidget extends StatelessWidget {
  const LessonSectionWidget({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    print( lesson.lessonComponents[0].text);
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Semantics(
        /*label: SectionNames.getName(widget.practiceButton.sectionType) +
    ((checkBox)
        ? SemanticNames.getName(SemanticsType.Selected)
        : SemanticNames.getName(SemanticsType.NotSelected)),
              */
        child: ExcludeSemantics(
          child: ListTile(
            minVerticalPadding: 0,
            onTap: () {
              Timer(Duration(milliseconds: 10), () {
                scakey.currentState.displayTapBar(false);
              });
              Navigator.of(context).push(
                CupertinoPageRoute(
                    builder: (context) =>
                          lesson.lessonComponents[0].build(context),
                ), );
            },
            leading: Icon(
              AppIcon.getIcon(AppIcons.EnableLessonSection),
              color: AppColors.first,
              size: Sizes.lineSectionIconSize,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: ExcludeSemantics(
                child: AutoSizeText(
                  lesson.number.toString() + ". " + lesson.name,
                  style: TextStyle(
                      fontSize: Sizes.lineSectionFontSize, color: AppColors.symbolText, fontWeight: FontWeight.w400),
                  maxLines: 2,
                ),
              ),
            ),
            trailing: Icon(AppIcon.getIcon(AppIcons.ContinueButton), color: AppColors.first),
          ),
        ),
      ),
    );
  }
}
