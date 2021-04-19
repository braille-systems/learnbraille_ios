import 'package:braille_abc/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/models/app_names.dart';

@immutable
class ExpansionSection extends StatefulWidget {
  const ExpansionSection({
    Key key,
    this.sectionIcon = CupertinoIcons.add,
    this.sectionName,
    this.child,
    this.color = AppColors.second,
  }) : super(key: key);

  final IconData sectionIcon;
  final Color color;
  final String sectionName;
  final Widget child;

  @override
  _ExpansionSection createState() => _ExpansionSection();
}

class _ExpansionSection extends State<ExpansionSection> {
  Color myColor = AppColors.second;

  @override
  Widget build(BuildContext context) {
    return Semantics(
        button: false,
        hint: SemanticNames.getName(SemanticsType.ExpandableList) + SemanticNames.getName(SemanticsType.TapToOpen),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          decoration: AppDecorations.expansionSection,
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
              size: Sizes.lineSectionIconSize,
              color: myColor,
            ),
            title: Text(
              widget.sectionName,
              style: TextStyle(fontSize:Sizes.lineSectionFontSize, color: myColor),
            ),
            backgroundColor: AppColors.expandBackground,
            children: <Widget>[widget.child],
          ),
        ));
  }
}
