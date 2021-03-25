import 'app_names.dart';

class Practice {
  static List<SectionType> _pool = [];

  static void addSymbolGroup(String groupName) {
    SectionType result;
    for(var i in SectionNames.stringOfSectionsMap.entries){
      if(groupName == i.value){
        result = i.key;
        break;
      }
    }
    _pool.add(result);
  }
  static void removeSymbolGroup(String groupName) {
    SectionType result;
    for(var i in SectionNames.stringOfSectionsMap.entries){
      if(groupName == i.value){
        result = i.key;
        break;
      }
    }
    _pool.remove(result);
  }
  static List<SectionType> getPool() {
    return _pool;
  }
  static void updatePool() {
    _pool.clear();
  }
}