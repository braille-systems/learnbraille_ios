import 'package:test/test.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';

void main() {
  test('Test symbols', () {
    Symbol symbol = Symbol.defaultSymbol();

    expect(symbol.dotsToString(), symbol.char + ": точк");
    expect(symbol.char, 'No');
  });
}
