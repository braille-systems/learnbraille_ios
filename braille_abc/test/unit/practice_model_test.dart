import 'package:test/test.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/practice_model.dart';

void main() {
  test('Test Practice class adding groups', () {
    Practice.addSymbolGroup(SectionType.ArithmeticSymbols);
    var pool = Practice.getPool();
    expect(pool[0], SectionType.ArithmeticSymbols);
    Practice.updatePool();
  });

  test('Test Practice class removing groups', () {
    Practice.addSymbolGroup(SectionType.ArithmeticSymbols);
    Practice.removeSymbolGroup(SectionType.ArithmeticSymbols);
    var pool = Practice.getPool();
    expect(pool.length, 0);
  });

  test('Test Practice class reseting groups', () {
    Practice.addSymbolGroup(SectionType.ArithmeticSymbols);
    Practice.updatePool();
    var pool = Practice.getPool();
    expect(pool.length, 0);
  });
}
