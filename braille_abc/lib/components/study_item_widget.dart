import 'package:flutter/cupertino.dart';
import 'package:braille_abc/screens/letter_screen.dart';
import 'bottom_bar_widget.dart';

class StudyItem extends StatelessWidget {
  const StudyItem({
    Key key,
    @required this.symbolData,
    @required this.titleSymbol,
  }) : super(key: key);

  final String titleSymbol;
  final String symbolData;

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
          ),
      child: CupertinoButton(
        color: CupertinoColors.white,
        disabledColor: CupertinoColors.white,
        child: Text(symbolData, style: TextStyle(color: CupertinoColors.black)),
        onPressed: () {
          scakey.currentState.displayTapBar(false);
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => LetterScreen(
                  titleSymbol: titleSymbol,
                  symbol: getSymbol()),
            ),
          );
        },
      ),
    );
  }

// TODO: make a parser
  String getSymbol()  {
    List<String> lstOfItems = symbolData.split(":");
    return lstOfItems[0];
  }

}
