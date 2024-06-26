class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  /// Constructor
  CartItemModel({
    required this.productId,
     this.title="",
     this.price=0.0,
    this.image,
    required this.quantity,
     this.variationId=" ",
    this.brandName,
    this.selectedVariation,
  });

  /// Empty CartItem
  static CartItemModel empty() {
    return CartItemModel(
      productId: '',
      quantity: 0,
    );
  }

  /// Convert CartItem to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }

   factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price']?.toDouble(),
      image: json['image'],
      quantity: json['quantity'],
      variationId: json['variationId'],
      brandName: json['brandName'],
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, String>.from(json['selectedVariation'])
          : null,
    );
  }
}
