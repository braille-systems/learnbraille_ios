import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:flutter/cupertino.dart';

class StudyScreen extends NavigationScreen {
  const StudyScreen({
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        currentPage: this,
        title: "Обучение",
      ),
      child: SafeArea(
        child: Center(child: Text('Study')),
      ),
    );
  }
}
