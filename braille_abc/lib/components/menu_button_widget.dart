import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/models/menu_button.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:decorated_icon/decorated_icon.dart';

import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/style.dart';

class MenuButtonWidget extends StatefulWidget {
  const MenuButtonWidget({
    Key key,
    @required this.menuButton,
    @required this.index,
    this.homeScreen,
  }) : super(key: key);

  final MenuButton menuButton;
  final HomeScreen homeScreen;
  final int index;

  @override
  _MenuButtonWidget createState() => _MenuButtonWidget();
}

class _MenuButtonWidget extends State<MenuButtonWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.menuButton.name,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          textStyle: TextStyle(
            color: Colors.white,
            shadows: <Shadow>[
              Styles.buildButtonShadow(),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
        ),
        onPressed: () {
          scakey.currentState.onItemTapped(widget.index);
          Practice.updatePool();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AutoSizeText(
              widget.menuButton.name,
              style: TextStyle(
                fontSize: 30,
              ),
              maxLines: 1,
            ),
            SizedBox(
              height: ScreenParams.height(4, context),
            ),
            DecoratedIcon(
              widget.menuButton.icon,
              color: Colors.white,
              size: 100,
              shadows: <Shadow>[
                Styles.buildButtonShadow(),

              ],
            ),
          ],
        ),
      ),
    );

  }
}
