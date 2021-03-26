import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'struct_symbol.dart';
import 'list_symbols.dart';
import 'package:braille_abc/style.dart';

class SymbolWidget extends StatefulWidget {
  final double width;
  final double height;
  final String char;
  final SectionType dictSection;
  final bool isTapped;
  final TextDirection Function() textDir;

  SymbolWidget(
      {Key key,
      @required this.textDir,
      @required this.char,
      @required this.dictSection,
      @required this.isTapped,
      @required this.width,
      @required this.height})
      : super(key: key) {
    createState();
  }

  @override
  _SymbolState createState() => _SymbolState(char: char, dictSection: dictSection);
}

class _SymbolState extends State<SymbolWidget> {
  Symbol symbol;

  _SymbolState({String char, SectionType dictSection}) {
    symbol = Search.element(char, dictSection);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        textDirection: widget.textDir(),
        children: <Widget>[
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.first,
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              textDirection: widget.textDir(),
              spacing: 0,
              direction: Axis.vertical,
              runSpacing: 30,
              children: symbol.dots
                  .map((item) => Semantics(
                        label: SemanticNames.getName(SemanticsType.Dot) +
                            item.outputData +
                            (item.press
                                ? SemanticNames.getName(SemanticsType.Painted)
                                : SemanticNames.getName(SemanticsType.NotPainted)),
                        button: false,
                        child: ElevatedButton(
                          onPressed: () {
                            if (widget.isTapped) {
                              setState(() {
                                item.p = (item.press ? AppColors.dotPress : AppColors.dotPress);
                                item.onP = (item.press ? AppColors.dotPress : AppColors.dotPress);
                                item.press = !item.press;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: item.p,
                            onPrimary: item.onP,
                            shape: CircleBorder(),
                            side: BorderSide(width: 10, color: AppColors.dotBoarder),
                            padding: EdgeInsets.all(20),
                          ),
                          child: Text(item.outputData,
                              textDirection: TextDirection.ltr, style: TextStyle(fontSize: 0.3 * widget.width)),
                        ),
                      ))
                  .toList(growable: false),
            ),
          ),
        ],
    );
  }
}
