class CartItem {
  final String name;
  final String description;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}
