import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/models/app_names.dart';

@immutable
class SettingsScreen extends NavigationScreen {
  const SettingsScreen({
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        currentPage: this,
        title: ScreenNames.getName(ScreenType.Settings),
      ),
      child: SafeArea(
        child: Center(child: Text('settings')),
      ),
    );
  }
}
