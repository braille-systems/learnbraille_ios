import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration:  BoxDecoration(
          color: Colors.orangeAccent, //new Color.fromRGBO(255, 0, 0, 0.0),
          borderRadius:  BorderRadius.circular(10)),
      child: ExpansionTile(
        onExpansionChanged: (expanded) {
          setState(() {
            if (expanded) {
              myColor = Colors.orangeAccent;
            } else {
              myColor = Colors.white;
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
        backgroundColor: CupertinoColors.tertiarySystemBackground,
        children: <Widget>[widget.child],
      ),
    );
  }
}
