import 'package:test/test.dart';
import 'package:braille_abc/components/body_widget.dart';

void main() {
  test('Test Body creation with zero', () {
    Body body = Body(0);
    expect(body.index, 0);
  });

  test('Test Body creation with null', () {
    Body body = Body(null);
    expect(body.index, null);
  });

  test('Test Body creation with small integer index', () {
    Body body = Body(8);
    expect(body.index, 8);
  });

  test('Test Body creation with large integer index', () {
    Body body = Body(35069825782657802);
    expect(body.index, 35069825782657802);
  });

  test('Test Body creation with small negative integer index', () {
    Body body = Body(-5);
    expect(body.index, -5);
  });

  test('Test Body creation with large negative integer index', () {
    Body body = Body(-3577995626725572472);
    expect(body.index, -3577995626725572472);
  });
}
