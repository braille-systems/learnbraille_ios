import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:decorated_icon/decorated_icon.dart';

import 'package:braille_abc/screens/home_screen.dart';
import 'package:braille_abc/models/menu_button.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/style.dart';

@immutable
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
        style: AppDecorations.menuButton,
        onPressed: () {
          scakey.currentState.onItemTapped(widget.index);
          Practice.updatePool();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ExcludeSemantics(
              child: AutoSizeText(
                widget.menuButton.name,
                style: TextStyle(
                  fontSize: 30,
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: ScreenParams.height(4, context),
            ),
            ExcludeSemantics(
              child: DecoratedIcon(
                widget.menuButton.icon,
                color: AppColors.second,
                size: 100,
                shadows: <Shadow>[
                  Styles.buildButtonShadow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
