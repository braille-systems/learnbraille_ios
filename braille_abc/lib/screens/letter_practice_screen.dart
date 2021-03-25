import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:flutter/cupertino.dart';

class LetterPracticeScreen extends SectionScreen {
  const LetterPracticeScreen({
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        currentPage: this,
        title: "Практика",
      ),
      //TODO add LetterPracticeScreen widget
      child: SafeArea(
        child: Center(child: Text('practice')),
      ),
    );
  }
}
