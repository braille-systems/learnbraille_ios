import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/menu_button.dart';
import 'package:flutter_tutorial/shared/screen_params.dart';

class MenuButtonWidget extends StatefulWidget {
  const MenuButtonWidget({
    Key key,
    @required this.menuButton,
  }) : super(key: key);

  final MenuButton menuButton;

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
      onPressed: () {},
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
