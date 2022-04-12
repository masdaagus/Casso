import 'order.dart';

class DeletedOrder {
  DeletedOrder({
    this.order,
    this.deletedAt,
    this.deleteReason,
  });
  final String? deleteReason;
  final String? deletedAt;
  final Order? order;

  factory DeletedOrder.fromJson(Map<String, dynamic> json) => DeletedOrder(
        order: Order.fromJson(json["order"]),
        deletedAt: json["deletedAt"],
        deleteReason: json["deleteReason"],
      );

  Map<String, dynamic> toJson() => {
        "order": order!.toJson(),
        "deletedAt": deletedAt,
        "deleteReason": deleteReason,
      };
}
