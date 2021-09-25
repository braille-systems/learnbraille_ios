import 'package:test/test.dart';
import 'package:braille_abc/models/app_icons.dart';

void main() {
  test('Test AppIcons has values for all icons', () {
    for (var appIcon in AppIcons.values) {
      var icd = AppIcon.getIcon(appIcon);
      expect(icd, AppIcon.AppIconsMap[appIcon]);
    }
  });
}
