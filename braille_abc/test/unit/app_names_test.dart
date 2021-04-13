import 'package:test/test.dart';
import 'package:braille_abc/models/app_names.dart';

void main() {
  test('Test SectionNames has values for all sections', () {
    for (var sec_type in SectionType.values) {
      var secn = SectionNames.getName(sec_type);
      expect(secn, SectionNames.stringOfSectionsMap[sec_type]);
    }
  });

  test('Test ScreenNames has values for all sections', () {
    for (var scr_type in ScreenType.values) {
      var scrn = ScreenNames.getName(scr_type);
      expect(scrn, ScreenNames.stringOfScreensMap[scr_type]);
    }
  });
}
