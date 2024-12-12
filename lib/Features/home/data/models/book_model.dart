class BookModel {
  final String id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final double price;
  final String category;
  final double rating;
  final int totalReviews;
  final bool hasDiscount;
  final double discountValue;
  final int pages;
  final String library;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.rating,
    required this.totalReviews,
    required this.hasDiscount,
    required this.discountValue,
    required this.pages,
    required this.library,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      category: json['category'],
      rating: json['rating'],
      totalReviews: json['totalReviews'],
      hasDiscount: json['hasDiscount'],
      discountValue: json['discountValue'],
      pages: json['pages'],
      library: json['library'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'category': category,
      'rating': rating,
      'totalReviews': totalReviews,
      'hasDiscount': hasDiscount,
      'discountValue': discountValue,
      'pages': pages,
      'library': library,
    };
  }
}
