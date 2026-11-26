class ProductModel {
  final int id;
  final int price;
  final String name;
  final String imageUrl;
  final String description;

  ProductModel({
    required this.id,
    required this.price,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  factory ProductModel.fJ(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      price: json["price"],
      name: json["name"],
      imageUrl: json["imageUrl"],
      description: json["description"],
    );
  }
}

class ProductResponse {
  final List<ProductModel> pList;

  ProductResponse({required this.pList});

  factory ProductResponse.fJ(Map<String, dynamic> data) {
    return ProductResponse(
      pList: (data["response"] as List).map((item) {
        return ProductModel.fJ(item);
      }).toList(),
    );
  }
}
