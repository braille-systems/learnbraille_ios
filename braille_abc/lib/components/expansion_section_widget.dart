import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/style.dart';

@immutable
class ExpansionSection extends StatefulWidget {
  const ExpansionSection({
    Key key,
    this.sectionIcon = CupertinoIcons.add,
    this.sectionName,
    this.child,
    this.color = CupertinoColors.white,
  }) : super(key: key);

  final IconData sectionIcon;
  final Color color;
  final String sectionName;
  final Widget child;

  @override
  _ExpansionSection createState() => _ExpansionSection();
}

class _ExpansionSection extends State<ExpansionSection> {
  Color myColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration:  AppDecorations.expansionSection,
      child: ExpansionTile(
        onExpansionChanged: (expanded) {
          setState(() {
            if (expanded) {
              myColor = AppColors.first;
            } else {
              myColor = AppColors.second;
            }
          });
        },
        leading: Icon(
          widget.sectionIcon,
          size: 35,
          color: myColor,
        ),
        title: Text(
          widget.sectionName,
          style: TextStyle(fontSize: 23, color: myColor),
        ),
        backgroundColor: AppColors.expandBackground,
        children: <Widget>[widget.child],
      ),
    );
  }
}
