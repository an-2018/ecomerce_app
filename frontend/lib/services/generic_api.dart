abstract class GenericApi<T> {
  Future<T> fetchOne(String param) async {
    return Future.value();
  }

  Future<List<T>> fetchList({String? search}) async {
    return Future.value();
  }
}
