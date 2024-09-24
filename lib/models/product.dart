class Product {
  final int productId;
  final String productTitle;
  final String productImage;
  final int productPrice;
  final String productAbout;
  final String ?productSpecifications;

  Product({required this.productId, required this.productTitle,
    required this.productImage, required this.productAbout,
    required this.productPrice, this.productSpecifications
  });
}
