import 'package:flutter/cupertino.dart';
import 'dart:math' as math;
class ChangeModeWidget extends StatelessWidget
{
  const ChangeModeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.rotationZ(math.pi / 2),
      child: const CupertinoButton(
          child: Icon(
            CupertinoIcons.arrow_up_arrow_down,
            color: CupertinoColors.white,
            size: 35,
            semanticLabel: "Изменить режим",
          ),
          disabledColor: CupertinoColors.black,
          color: CupertinoColors.black,
          onPressed: null),
    );
  }

}