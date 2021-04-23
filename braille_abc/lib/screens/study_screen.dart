import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/style.dart';

@immutable
class LessonsScreen extends SectionScreen {
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
          title: ScreenNames.getName(ScreenType.Study),
        ),
        child: SafeArea(
          child: Center(child: Text('Раздел в разработке...')),
        ),
      ),
    );
  }
}

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
            onTap: () => null,
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
