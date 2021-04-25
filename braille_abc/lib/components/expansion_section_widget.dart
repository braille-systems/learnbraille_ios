import 'package:braille_abc/components/expansion_tile.dart';
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
    this.expansionTile,
  }) : super(key: key);

  final IconData sectionIcon;
  final Color color;
  final String sectionName;
  final Widget child;
  final GlobalKey<UserExpansionTileState> expansionTile;

  @override
  _ExpansionSection createState() => _ExpansionSection();
}

class _ExpansionSection extends State<ExpansionSection> {
  Color myColor = AppColors.second;

  @override
  Widget build(BuildContext context) {
    UserExpansionTile expTile = UserExpansionTile(
      key: widget.expansionTile,
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
    );
    //expansionTile.currentState.collapse();
    return Semantics(
        button: false,
        hint: SemanticNames.getName(SemanticsType.ExpandableList) + SemanticNames.getName(SemanticsType.TapToOpen),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          decoration: AppDecorations.expansionSection,
          child: expTile,
        ));
  }
}
