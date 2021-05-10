import 'package:braille_abc/models/about_model.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:braille_abc/style.dart';

class AboutScreen extends SectionScreen {
  const AboutScreen({
    Key key,
    Screen helpPage,
    Screen previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return nonSwipeable(
        context,
        CupertinoPageScaffold(
          navigationBar: NavigationBar(
            currentPage: this,
            title: ScreenNames.getName(ScreenType.About),
          ),
          child: Align(
            alignment: Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, 0.15),
            child: MergeSemantics(
              child: SizedBox(
                width: ScreenParams.width(90, context),
                child: Html(
                  data: AboutModel.data.toString(),
                  onLinkTap: (String url) async {
                    await launch(url);
                  },
                  renderNewlines: true,
                  defaultTextStyle: Styles.aboutTextStyle(),
                ),
              ),
            ),
          ),
        ));
  }
}
