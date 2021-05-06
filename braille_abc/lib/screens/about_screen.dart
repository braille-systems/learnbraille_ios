import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/non_swipeable.dart';

class AboutScreen extends SectionScreen {
  const AboutScreen({
    Key key,
    Screen helpPage,
    Screen previousPage,
  }) : super (key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return nonSwipeable(
      context,
      CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title: ScreenNames.getName(ScreenType.About),
        ),
        child: Align(
          alignment: Alignment.center,
          child: AutoSizeText(
            "О нас!",
          ),
        ),
      )
    );
  }
}
