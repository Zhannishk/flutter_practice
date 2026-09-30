import 'models.dart';

sealed class ShelfState {}

class Empty extends ShelfState {}

class Ready extends ShelfState {
  final List<Book> books;

  Ready(this.books);
}

class Broken extends ShelfState {
  final String message;

  Broken(this.message);
}


String describe(ShelfState state) {
  return switch (state) {
    Empty() => 'Shelf is empty',
    Ready(books: var books) =>
      'Shelf has ${books.length} books',
    Broken(message: var message) => message,
  };
}

({int count, double avgPages}) statsOf(List<Book> books) {
  final count = books.length;

  final total = books.fold<int>(
    0,
    (sum, book) => sum + book.pages,
  );

  return (
    count: count,
    avgPages: count == 0 ? 0.0 : total / count,
  );
}
