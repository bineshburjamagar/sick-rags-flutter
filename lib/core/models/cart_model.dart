class CartModelMeta {
  final String userId;
  final List<CartModel> cartList;

  CartModelMeta({
    required this.userId,
    required this.cartList,
  });

  factory CartModelMeta.fromJson(Map<String, dynamic> json) => CartModelMeta(
        userId: json["userId"],
        cartList: List.from(
          json["products"].map(
            (e) => CartModel(
              productId: e["productId"],
              quantity: e["quantity"],
              price: e["price"],
            ),
          ),
        ),
      );
}

class CartModel {
  final int productId;
  final int quantity;
  final int price;

  CartModel(
      {required this.productId, required this.quantity, required this.price});

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "price": price,
      };
}
