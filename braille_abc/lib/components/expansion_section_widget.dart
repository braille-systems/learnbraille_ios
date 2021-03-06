import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionSection extends StatefulWidget {
  const ExpansionSection({
    Key key,
    this.sectionIcon,
    this.sectionName,
    this.child,
  }) : super(key: key);

  final IconData sectionIcon;
  final String sectionName;
  final Widget child;

  @override
  _ExpansionSection createState() => _ExpansionSection();
}

class _ExpansionSection extends State<ExpansionSection> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(
        widget.sectionIcon,
        size: 35,
        color: Colors.orangeAccent,
      ),
      title: Text(
        widget.sectionName,
        style: TextStyle(fontSize: 23),
      ),
      children: <Widget>[widget.child],
    );
  }
}
