import 'package:flutter/cupertino.dart';

WillPopScope nonSwipeable(BuildContext context, CupertinoPageScaffold page) {
  return  WillPopScope(
    //forbidden swipe* in iOS(my ThemeData(platform: TargetPlatform.iOS,)
    onWillPop: () async {
      if (Navigator.of(context).userGestureInProgress) {
        return false;
      } else {
        return true;
      }
    },
    child: page,
  );
}