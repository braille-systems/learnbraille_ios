import 'app_names.dart';

class Practice {
  static List<SectionType> _pool = [];

  static SectionType _search(String groupName){
    return SectionNames.stringOfSectionsMap.keys.firstWhere((k) => SectionNames.stringOfSectionsMap[k] == groupName, orElse: () => null);
  }

  static void addSymbolGroup(String groupName) {
    _pool.add(_search(groupName));
  }
  static void removeSymbolGroup(String groupName) {
    _pool.remove(_search(groupName));
  }
  static List<SectionType> getPool() {
    return _pool;
  }
  static void updatePool() {
    _pool.clear();
  }
}