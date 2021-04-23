import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/style.dart';

enum lessonButtonType{
  backward,
  forward,
}

class BackForthButton extends StatelessWidget {
  final lessonButtonType type;
  final Widget screen;

  const BackForthButton({Key key, this.type, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppDecorations.nextButton,
      onPressed: () => null,
      child: Icon(
        AppIcon.getIcon(AppIcons.ContinueButton),
        size: ScreenParams.width(10, context),
        color: AppColors.sideIcon,
        semanticLabel: SemanticNames.getName(SemanticsType.Continue),
      ),
    );
  }
}