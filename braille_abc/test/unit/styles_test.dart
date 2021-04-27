import 'package:test/test.dart';
import 'package:braille_abc/style.dart';

void main() {
  test('Test Styles has ButtonShadow', () {
    var style = Styles.buildButtonShadow();
    expect(style, isNot(null));
  });

  test('Test Styles has Stroke', () {
    var style = Styles.buildStroke(0.05);
    expect(style, isNot(null));
    expect(style.length, 4);
  });

  test('Test Styles has helpTextStyle', () {
    var style = Styles.helpTextStyle();
    expect(style, isNot(null));
  });
}
