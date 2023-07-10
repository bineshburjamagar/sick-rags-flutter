class CartModel {
  final String docId;
  final int productId;
  final int quantity;
  final int price;

  CartModel(
      {required this.docId,
      required this.productId,
      required this.quantity,
      required this.price});

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "productId": productId,
        "quantity": quantity,
        "price": price,
      };
}
