class Coffee {
  final String title;
  final String image;
  final String subTitle;
  final String description;
  int quantity;
  final bool isFav;
  final String price;

  Coffee({
    required this.title,
    required this.image,
    required this.subTitle,
    required this.description,
    required this.quantity,
    required this.isFav,
    required this.price,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) => Coffee(
        title: json["title"],
        image: json["image"],
        subTitle: json["subTitle"],
        description: json["description"],
        quantity: json["quantity"],
        isFav: json["isFav"],
        price: json["price"],
      );
}
