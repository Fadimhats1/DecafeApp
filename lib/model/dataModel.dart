class Menu {
  int id;
  String name;
  int categoryId;
  int price;
  String description;
  bool isAvailable;
  String image;
  DateTime createdAt;
  DateTime UpdatedAt;

  Menu({
    required this.id,
    required this.name,
    required this.price,
    required this.UpdatedAt,
    required this.categoryId,
    required this.createdAt,
    required this.description,
    required this.image,
    required this.isAvailable,
  });
}

class OrderMenu {
  int menuId;
  String name;
  String description;
  int price;
  String image;
  int qty;
  String? notes;
  OrderMenu({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.menuId,
    required this.qty,
    this.notes,
  });

  Map<String, dynamic> toJson() => {
        "menu_id": this.menuId,
        "qty": this.qty,
        "notes": this.notes,
      };
}

class Order {
  bool isDinein;
  List<Map<String, dynamic>> listOrder;
  Order({required this.isDinein, required this.listOrder});

  Map<String, dynamic> toJson() => {
        "is_dine_in": this.isDinein,
        "orders": this.listOrder,
      };
}
