import 'package:flutter/cupertino.dart';
import 'package:braille_abc/shared/screen_params.dart';

class LetterWidget extends StatelessWidget {
  const LetterWidget({Key key, @required this.title, @required this.symbol})
      : super(key: key);

  final String title;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Container(
          width: ScreenParams.width(70, context),
          height: ScreenParams.height(30, context),
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            border: Border.all(color: CupertinoColors.black, width: 7.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: ScreenParams.height(3, context),
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 30.0,
                    color: CupertinoColors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                symbol,
                style: const TextStyle(
                    fontSize: 110,
                    color: CupertinoColors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ),
        disabledColor: CupertinoColors.white,
        color: CupertinoColors.activeOrange,
        onPressed: null);
  }
}
