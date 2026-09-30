
import 'lib/week02/models.dart';

void main() {
  final book = Book.fromJson({
    'title': 'Clean Code',
    'year': 2008,
    'pages': 464,
    'author': 'Martin',
    'country': 'USA',
    'genre': 'craft',
  });
  print(book);
  print(book.isLong);
  print(book.copyWith(pages: 300));
}
