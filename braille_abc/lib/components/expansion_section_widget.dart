import 'package:braille_abc/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionSection extends StatefulWidget {
  ExpansionSection({
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration:  BoxDecoration(
          color: AppColors.first, //new Color.fromRGBO(255, 0, 0, 0.0),
          borderRadius:  BorderRadius.circular(10)),
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
        backgroundColor: AppColors.background,
        children: <Widget>[widget.child],
      ),
    );
  }
}
