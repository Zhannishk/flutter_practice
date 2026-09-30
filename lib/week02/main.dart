import 'data.dart';
import 'models.dart';
import 'catalogue.dart';
import 'shelf_state.dart';

void main() {
  final library = Library();

  for (final data in rawBooks) {
    library.add(Book.fromJson(data));
  }

  library.open();

  print(library.report());
  print(library.allTitles);
  print(library.recentBooks);
  print(library.averagePages);
  print(library.booksByAuthor);
  print(library.authors);
  print(library.genres);
  print(library.displayList);
  print(library.countryOf('Clean Code'));

  final books = library.items.whereType<Book>().toList();

  final stats = statsOf(books);
  print('Count: ${stats.count}');
  print('Average pages: ${stats.avgPages}');

  print(describe(Empty()));
  print(describe(Ready(books)));
  print(describe(Broken('Something went wrong')));
}
