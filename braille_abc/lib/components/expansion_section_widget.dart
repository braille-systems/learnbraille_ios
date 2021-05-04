import 'package:braille_abc/shared/default_params.dart';
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
    this.index,
  }) : super(key: key);

  final IconData sectionIcon;
  final Color color;
  final String sectionName;
  final Widget child;
  final int index;

  @override
  _ExpansionSection createState() => _ExpansionSection();
}

class _ExpansionSection extends State<ExpansionSection> {
  Color myColor = AppColors.second;
  ExpansionTile expTile;
  bool up;
  GlobalKey newKey;

  @override
  Widget build(BuildContext context) {
    if(expTile == null || up != DefaultParams.update.value){
      up = DefaultParams.update.value;
      myColor = AppColors.second;
      newKey = GlobalKey();
    }
    expTile = ExpansionTile(
      key: newKey,
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
      title: ExcludeSemantics(
        child: Text(
          widget.sectionName,
          style: TextStyle(fontSize:Sizes.lineSectionFontSize, color: myColor),
        ),
      ),
      backgroundColor: AppColors.expandBackground,
      initiallyExpanded: false,
      children: <Widget>[widget.child],
    );
    return Semantics(
      button: false,
      label: widget.sectionName + ". " + SemanticNames.getName(SemanticsType.ExpandableList),
      hint: SemanticNames.getName(SemanticsType.TapToOpen),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          decoration: AppDecorations.expansionSection,
          child: expTile,
        ),
    );
  }
}
