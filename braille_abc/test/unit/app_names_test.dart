import 'package:test/test.dart';
import 'package:braille_abc/models/app_names.dart';

void main() {
  test('Test SectionNames has values for all sections', () {
    for (var secType in SectionType.values) {
      var secn = SectionNames.getName(secType);
      expect(secn, SectionNames.stringOfSectionsMap[secType]);
    }
  });

  test('Test ScreenNames has values for all sections', () {
    for (var scrType in ScreenType.values) {
      var scrn = ScreenNames.getName(scrType);
      expect(scrn, ScreenNames.stringOfScreensMap[scrType]);
    }
  });
}
