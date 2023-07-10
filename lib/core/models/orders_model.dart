class OrdersModel {
  final int productId;
  final int quantity;
  final String orderStatus;
  final int price;

  OrdersModel(
      {required this.productId,
      required this.quantity,
      required this.orderStatus,
      required this.price});
}
