class BookModel {
  final num id;
  final num price;
  final num rate;
  final String title;
  final String imageUrl;
  final String author;
  final String description;

  BookModel({
    required this.id,
    required this.price,
    required this.rate,
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.description,
  });

  factory BookModel.fromJson(Map<String, dynamic> data) {
    return BookModel(
      id: data['id'],
      price: data['price'],
      title: data['title'],
      imageUrl: data['imageUrl'],
      description: data['description'],
      rate: data['rate'],
      author: data['author'],
    );
  }
}

class ProductResponse {
  final List<BookModel> response;

  ProductResponse({required this.response});
  factory ProductResponse.fromJson(List<dynamic> data) {
    return ProductResponse(
      response: data.map((item) => BookModel.fromJson(item)).toList(),
    );
  }
}
