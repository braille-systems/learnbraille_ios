import 'package:braille_abc/models/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'expansion_section_widget.dart';

class MyExpandableList extends StatefulWidget {
  @override
  _MyExpandableListState createState() => _MyExpandableListState();
}

class _MyExpandableListState extends State<MyExpandableList> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 0,
              height: 65,
            ),
            for (int i = 0; i < AppModel.sections.length; i++)
              ExpansionSection(
                sectionIcon: AppModel.sections[i].icon,
                sectionName: AppModel.sections[i].name,
                child: AppModel.sections[i].expandedList,
              ),
          ],
        ),
      ),
    );
  }
}
