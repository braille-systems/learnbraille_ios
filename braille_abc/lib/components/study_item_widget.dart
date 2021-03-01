import 'package:flutter/cupertino.dart';
import 'package:braille_abc/screens/letter_screen.dart';

import 'bottom_bar_widget.dart';
class StudyItem extends StatelessWidget {
  const StudyItem({
    Key key,
    @required this.str,
  }) : super(key: key);

  final String str;

  // final String russianAlphabet = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: CupertinoColors.inactiveGray, width: 0.5)),
          shape: BoxShape.rectangle
          // shape: BoxShape.circle,
          ),
      child: CupertinoButton(
        color: CupertinoColors.white,
        disabledColor: CupertinoColors.white,
        child: Text(str, style: TextStyle(color: CupertinoColors.black)),
        onPressed: () {
         scakey.currentState.displayTapBar(false);
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => LetterScreen(
                  // TODO: заменить эту строку на выбор заголовка
                  titleSymbol: "Русский алфавит",
                  symbol: str[0]),
            ),
          );
        },
      ),
    );
    //
  }

// TODO: мб в бущуем написать парсер для строк
// String parse()
// {
//   List<String> lstOfItems = str.split(":");
//
//
//
// }

}
