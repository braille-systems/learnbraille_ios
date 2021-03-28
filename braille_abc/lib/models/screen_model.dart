import 'package:flutter/cupertino.dart';

@immutable
abstract class Screen extends StatelessWidget {
  const Screen({
    Key key,
    this.hasNavigationBar,
    this.helpPage,
    this.previousPage,
  }) : super(key: key);

  final bool hasNavigationBar;

  final Screen helpPage;
  final Screen previousPage;
}

@immutable
abstract class NavigationScreen extends Screen {
  const NavigationScreen({
    Key key,
    final Screen helpPage,
    final Screen previousPage,
  }) : super(key: key, hasNavigationBar: true, helpPage: helpPage, previousPage: previousPage);
}

@immutable
abstract class SectionScreen extends Screen {
  const SectionScreen({
    Key key,
    final Screen helpPage,
    final Screen previousPage,
  }) : super(key: key, hasNavigationBar: false, helpPage: helpPage, previousPage: previousPage);
}
