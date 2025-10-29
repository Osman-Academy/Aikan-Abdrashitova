const books = [
  {"id": 1, "title": "Book1", "description": "", "price": 14.5},
  {"id": 2, "title": "Book2", "description": "Some descr", "price": 12.5},
  {
    "id": 3,
    "title": "Physics",
    "description": "The elementary physics",
    "price": 22.8,
  },
];

class Book {
  int id;
  String title;
  String? description;
  double price;

  Book({
    required this.id,
    required this.title,
    required this.price,
    this.description,
  });

  factory Book.fromJson(Map<String, dynamic> data) {
    return Book(
      id: data["id"],
      title: data["title"],
      description: data["description"],
      price: data["price"],
    );
  }
}

class Request {
  static List<Book> get([int? id]) {
    if (id != null) {
      var list = books.where((element) => element["id"] == id);
      if (list.isEmpty) return [];
      return [Book.fromJson(list.first)];
    }
    return books.map((e) => Book.fromJson(e)).toList();
  }
}
