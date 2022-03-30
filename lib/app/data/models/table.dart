class TableModel {
  TableModel({
    this.tableNumber,
    this.isEmpty = true,
  });
  final int? tableNumber;
  final bool isEmpty;

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        tableNumber: json['tableNumber'],
        isEmpty: json['isEmpty'],
      );

  Map<String, dynamic> toJson() => {
        "tableNumber": tableNumber,
        "isEmpty": isEmpty,
      };
}
