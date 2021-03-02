import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class ChangeModeWidget extends StatelessWidget {
  ChangeModeWidget({
    Key key,
  }) : super(key: key);

  TextDirection dir = TextDirection.ltr;

  TextDirection getDir() {
    return dir;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.fromLTRB(0, ScreenParams.width(10, context), 0, 0),
      width: ScreenParams.width(50, context),
      transform: Matrix4.rotationZ(math.pi / 2),
      child: CupertinoButton(
        child: Icon(
          CupertinoIcons.arrow_up_arrow_down,
          color: CupertinoColors.white,
          size: 35,
          semanticLabel: "Изменить режим",
        ),
        disabledColor: CupertinoColors.black,
        color: CupertinoColors.black,
        onPressed: () {
          if (dir == TextDirection.ltr)
            dir = TextDirection.rtl;
          else if (dir == TextDirection.rtl) dir = TextDirection.rtl;
        },
      ),
    );
  }
}
