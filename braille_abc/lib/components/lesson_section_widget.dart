import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/lesson_model.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/style.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';

class LessonSectionWidget extends StatelessWidget {
  const LessonSectionWidget({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
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
              StudyModel.rebootLessons();
              StudyModel.currentLessonIndex = lesson.number-1;
              Timer(Duration(milliseconds: 10), () {
                scakey.currentState.displayTapBar(false);
              });
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => lesson.lessonComponent[0].build(context),
                ),
              );
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
