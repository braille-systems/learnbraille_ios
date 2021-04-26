import 'package:test/test.dart';
import 'package:braille_abc/style.dart';

void main() {
  test('Test AppDecorations has navigationButton', () {
    var style = AppDecorations.navigationButton;
    expect(style, isNot(null));
  });

  test('Test AppDecorations has menuButton', () {
    var style = AppDecorations.menuButton;
    expect(style, isNot(null));
  });

  test('Test AppDecorations has changeDirButton', () {
    var style = AppDecorations.changeDirButton;
    expect(style, isNot(null));
  });

  test('Test AppDecorations has hintButton', () {
    var style = AppDecorations.hintButton;
    expect(style, isNot(null));
  });

  test('Test AppDecorations has nextButton', () {
    var style = AppDecorations.nextButton;
    expect(style, isNot(null));
  });

  test('Test AppDecorations has expansionSection', () {
    var style = AppDecorations.expansionSection;
    expect(style, isNot(null));
  });

  test('Test AppDecorations has letterWidget', () {
    var style = AppDecorations.letterWidget;
    expect(style, isNot(null));
  });

  test('Test AppDecorations has studyItem', () {
    var style = AppDecorations.studyItem;
    expect(style, isNot(null));
  });
}
