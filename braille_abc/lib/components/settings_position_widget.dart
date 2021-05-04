import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/settings_position.dart';
import 'package:braille_abc/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPosition extends StatefulWidget {
  final SettingPosition settingPosition;

  const SettingsPosition({Key key, @required this.settingPosition});

  @override
  _SettingsPosition createState() => _SettingsPosition();
}

class _SettingsPosition extends State<SettingsPosition> {
  bool checkBox = false;

  void onChange(bool val) {
    setState(() {
      checkBox = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    SettingInfo settingInfo = SettingsNames.getName(widget.settingPosition.settingType);

    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Semantics(
        label: settingInfo.settingName +
            " ." +
            ((checkBox)
                ? SemanticNames.getName(SemanticsType.Selected)
                : SemanticNames.getName(SemanticsType.NotSelected)),
        hint: settingInfo.settingDescription,
        child: ExcludeSemantics(
          child: ListTile(
            title: ExcludeSemantics(
              child: AutoSizeText(
                settingInfo.settingName,
                style: TextStyle(
                  fontSize: Sizes.settingNameFontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            subtitle: ExcludeSemantics(
              child: AutoSizeText(
                settingInfo.settingDescription,
                style: TextStyle(
                  fontSize: Sizes.settingDescriptionFontSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            trailing: CupertinoSwitch(
              value: checkBox,
              onChanged: (bool val) {
                onChange(val);
              },
              activeColor: AppColors.first,
            ),
            onTap: () {
              onChange(!checkBox);
            },
          ),
        ),
      ),
    );
  }
}
