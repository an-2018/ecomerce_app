abstract class GenericApi<T, V> {
  Future<T> fetchOne(String param) async {
    return Future.value();
  }

  Future<V> fetchList({String? search}) async {
    return Future.value();
  }
}
