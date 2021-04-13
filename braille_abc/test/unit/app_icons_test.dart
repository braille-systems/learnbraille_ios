import 'package:test/test.dart';
import 'package:braille_abc/models/app_icons.dart';

void main() {
  test('Test AppIcons has values for all icons', () {
    for (var app_icon in AppIcons.values) {
      var icd = AppIcon.getIcon(app_icon);
      expect(icd, AppIcon.AppIconsMap[app_icon]);
    }
  });
}
