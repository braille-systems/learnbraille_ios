import 'package:flutter/cupertino.dart';

abstract class Screen extends StatelessWidget {
  const Screen({
    Key key,
    this.hasNavigationBar,
    this.helpPage,
    this.previousPage,
    this.nextPage,
  }) : super(key: key);

  final bool hasNavigationBar;

  final Widget helpPage;
  final Widget previousPage;
  final Widget nextPage;
}