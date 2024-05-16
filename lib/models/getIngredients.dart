
import 'dart:convert';

GetIngredients getIngredientsFromJson(String str) => GetIngredients.fromJson(json.decode(str));

String getIngredientsToJson(GetIngredients data) => json.encode(data.toJson());

class GetIngredients {
  final List<Ingredient> ingredients;

  GetIngredients({
    required this.ingredients,
  });

  factory GetIngredients.fromJson(Map<String, dynamic> json) => GetIngredients(
    ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
  };
}

class Ingredient {
  final Amount amount;
  final String image;
  final String name;

  Ingredient({
    required this.amount,
    required this.image,
    required this.name,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    amount: Amount.fromJson(json["amount"]),
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount.toJson(),
    "image": image,
    "name": name,
  };
}

class Amount {
  final Us us;

  Amount({
    required this.us,
  });

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
    us: Us.fromJson(json["us"]),
  );

  Map<String, dynamic> toJson() => {
    "us": us.toJson(),
  };
}

class Us {
  final String unit;
  final double value;

  Us({
    required this.unit,
    required this.value,
  });

  factory Us.fromJson(Map<String, dynamic> json) => Us(
    unit: json["unit"],
    value: json["value"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "unit": unit,
    "value": value,
  };
}
