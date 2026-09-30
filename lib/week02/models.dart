class Author {
  final String name;
  final String? country;

const Author({
  required this.name,
  this.country
});

  @override
  String toString() {
    return 'Author: $name, Country: ${country ?? "unknown "}';
  }
}

enum Genre{
  craft('Craft'),
  theory('Theory'),
  unknown('Unknown');

  final String label;

  const Genre(this.label);

  static Genre fromString(String? raw){
    return switch (raw) {
      'craft' => Genre.craft,
      'theory' => Genre.theory,
      _ => Genre.unknown,
    };
  }
}

class Book {
  final String title;
  final int year;
  final int pages;
  final Author author;
  final Genre genre;
  final String? description;

  const Book({
    required this.title,
    required this.year,
    required this.pages,
    required this.author,
    required this.genre,
    this.description,
  });

bool get isLong => pages > 400;
factory Book.fromJson(Map<String, dynamic> json) {
  return Book(
    title: json['title'] as String? ?? 'Untitled',
    year: json['year'] as int? ?? 0,
    pages: json['pages'] as int? ?? 0,
    author: Author(
      name: json['author'] as String? ?? 'Unknown',
      country: json['country'] as String?,
      ),
    genre: Genre.fromString(json['genre'] as String?),
    description: json['description'] as String?,
  );
}

Book copyWith({
  String? title,
  int? year,
  int? pages,
  Author? author,
  Genre? genre,
  String? description,
}) {
  return Book(
    title: title ?? this.title,
    year: year ?? this.year,
    pages: pages ?? this.pages,
    author: author ?? this.author,
    genre: genre ?? this.genre,
    description: description ?? this.description,
  );
}

@override
String toString() {
  return '$title ($year), $pages pages, '
      'by ${author.name}, ${genre.label}';
}

}

const book = Book(
    title: 'Clean code',
    year: 2008,
    pages: 464,
    author: Author(name:  'Martin', country: 'USA'),
    genre: Genre.craft,
  ); 
