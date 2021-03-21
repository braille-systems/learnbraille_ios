import 'package:braille_abc/models/enums_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LetterWidget extends StatelessWidget {
  const LetterWidget({
    Key key,
    @required this.title,
    @required this.symbol
  }) : super(key: key);

  final SectionType title;
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
              Flexible(
                flex: 1,
                child: Center(
                    child: AutoSizeText(
                  StringOfSectionsMap[title],
                  style: const TextStyle(fontSize: 30.0, color: CupertinoColors.black, fontWeight: FontWeight.bold),
                  maxLines: 1,
                )),
              ),
              Flexible(
                  flex: 2,
                  child: AutoSizeText(
                    symbol,
                    style: const TextStyle(fontSize: 110, color: CupertinoColors.black, fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ))
            ],
          )),
        ),
        disabledColor: CupertinoColors.white,
        color: CupertinoColors.activeOrange,
        onPressed: null);
  }
}
