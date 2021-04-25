import 'package:braille_abc/screens/letter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/style.dart';



@immutable
class LetterWidget extends StatelessWidget {
  const LetterWidget({Key key, @required this.title, @required this.symbol}) : super(key: key);

  final SectionType title;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 0),
      disabledColor: AppColors.symbolContainer,
      color: AppColors.first,
      onPressed: null,
      child: Container(
        width: ScreenParams.width(70, context),
        height: ScreenParams.height(30, context),
        decoration: AppDecorations.letterWidget(LetterInfo.of(context).color),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: AutoSizeText(
                  SectionNames.getName(title),
                  style: const TextStyle(fontSize: 35.0, color: AppColors.symbolText, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: AutoSizeText(
                symbol,
                style: const TextStyle(fontSize: 110, color: AppColors.symbolText, fontWeight: FontWeight.bold),
                maxLines: 3,
                wrapWords: false,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
