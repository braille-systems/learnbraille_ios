class Practice {
  static final List<String> _pool = [];

  static void addSymbolGroup(String groupName) {
    _pool.add(groupName);
  }
  static void removeSymbolGroup(String groupName) {
    _pool.remove(groupName);
  }
  static List<String> getPool() {
    return _pool;
  }
  static void updatePool() {
    _pool.clear();
  }
}