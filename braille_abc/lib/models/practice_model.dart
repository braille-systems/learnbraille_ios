import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Practice {
  static final List<SectionType> _pool = [];

  static void addSymbolGroup(SectionType sectionType) {
    _pool.add(sectionType);
  }
  static void removeSymbolGroup(SectionType sectionType) {
    _pool.remove(sectionType);
  }
  static List<SectionType> getPool() {
    return _pool;
  }
  static void updatePool() {
    _pool.clear();
  }
}