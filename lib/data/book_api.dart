import 'book.dart';

abstract class BookApi {
  Future<List<Book>> list();
  Future<Book> view(int id);
  Future<bool> remove(int id);
}

class BookApiImpl implements BookApi {
  @override
  Future<List<Book>> list() async {
    // имитация запроса к серверу
    return Future.delayed(const Duration(seconds: 1), () {
      return Request.get(); // берём локальные данные из book.dart
    });
  }

  @override
  Future<Book> view(int id) async {
    // имитация загрузки одной книги
    return Future.delayed(const Duration(seconds: 1), () {
      final result = Request.get(id);
      if (result.isEmpty) throw Exception('Book not found');
      return result.first;
    });
  }

  @override
  Future<bool> remove(int id) async {
    // имитация удаления книги
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}
