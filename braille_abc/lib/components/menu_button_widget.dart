import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/models/menu_button.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/components/body_widget.dart';

class MenuButtonWidget extends StatefulWidget {
  const MenuButtonWidget({
    Key key,
    @required this.menuButton,
    @required this.index, this.homeScreen,
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
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      textColor: Colors.white,
      color: Colors.orange[300],
      onPressed: () {
        TabData.current_index=widget.index;
        widget.homeScreen.setIndex(widget.index);
      Navigator.of(context).push(

        CupertinoPageRoute(
          builder: (context) => Body(widget.index),

        ),
      );
    },
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.menuButton.name,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: ScreenParams.height(4, context),
          ),
          Icon(
            widget.menuButton.icon,
            color: Colors.white,
            size: 100,
          ),
        ],
      ),
    );
  }
}
