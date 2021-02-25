import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/models/menu_button.dart';
import 'package:braille_abc/shared/screen_params.dart';

class MenuButtonWidget extends StatefulWidget {
  const MenuButtonWidget({
    Key key,
    @required this.menuButton,
    @required this.screen,
  }) : super(key: key);

  final MenuButton menuButton;
  final Widget screen;

  @override
  _MenuButtonWidget createState() => _MenuButtonWidget();
}

class _MenuButtonWidget extends State<MenuButtonWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
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
        print(widget.screen);
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => widget.screen,

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
