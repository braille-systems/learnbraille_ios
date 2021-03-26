import 'package:braille_abc/models/section_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/components/expansion_section_widget.dart';

class MyExpandableList extends StatefulWidget {
  const MyExpandableList({
    Key key,
    this.model,
  }) : super(key: key);
  final List<SectionModel> model;

  @override
  _MyExpandableListState createState() => _MyExpandableListState();
}

class _MyExpandableListState extends State<MyExpandableList> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Card(
          color: CupertinoColors.tertiarySystemBackground,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int i = 0; i < widget.model.length; i++)
                ExpansionSection(
                  sectionIcon: widget.model[i].icon,
                  sectionName: widget.model[i].name,
                  child: widget.model[i].expandedList,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
