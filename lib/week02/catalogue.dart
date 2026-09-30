import 'models.dart';

class Library {
  final List<LibraryItem> items = [];

  void add(LibraryItem item) {
    items.add(item);
  }

  Book? findByTitle(String title) {
    for (final item in items) {
      if (item is Book && item.title == title) {
        return item;
      }
    }
    return null;
  }

  String countryOf(String title) {
    return findByTitle(title)?.author.country ?? 'unknown';
  }

  late final DateTime openedAt;

  void open() {
    openedAt = DateTime.now();
  }

  String? _cachedReport;

  String report() {
    return _cachedReport ??= 'Library contains ${items.length} items';
  }


  List<String> get allTitles =>
    items.map((item) => item.title).toList();


  List<Book> get recentBooks =>
    items.whereType<Book>().where((book) => book.year > 2010).toList();


  double get averagePages {
    final books = items.whereType<Book>().toList();

    // fold works with an empty list, unlike reduce.
    return books.isEmpty
        ? 0
        : books.fold<int>(0, (sum, book) => sum + book.pages) /
            books.length;
  }


Map<String, int> get booksByAuthor =>
    items.whereType<Book>().fold<Map<String, int>>(
      {},
      (result, book) {
        result[book.author.name] =
            (result[book.author.name] ?? 0) + 1;
        return result;
      },
    );

Set<String> get authors =>
    items.whereType<Book>()
        .map((book) => book.author.name)
        .toSet();

Set<Genre> get genres =>
    items.whereType<Book>()
        .map((book) => book.genre)
        .toSet();

List<String> get displayList => [
  'CATALOGUE',
  for (final book in items.whereType<Book>())
    '${book.title} (${book.year})',
  ...authors,
  if (items.whereType<Book>().any((book) => book.pages == 0))
    '(incomplete data)',
];



}


