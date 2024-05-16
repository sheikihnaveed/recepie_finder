
import 'dart:convert';

Getnutrients getnutrientsFromJson(String str) => Getnutrients.fromJson(json.decode(str));

String getnutrientsToJson(Getnutrients data) => json.encode(data.toJson());

class Getnutrients {
  final List<Nutrient> nutrients;

  Getnutrients({
    required this.nutrients,
  });

  factory Getnutrients.fromJson(Map<String, dynamic> json) => Getnutrients(
    nutrients: List<Nutrient>.from(json["nutrients"].map((x) => Nutrient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "nutrients": List<dynamic>.from(nutrients.map((x) => x.toJson())),
  };
}

class Nutrient {
  final String name;
  final double amount;
  final String unit;
  final double percentOfDailyNeeds;

  Nutrient({
    required this.name,
    required this.amount,
    required this.unit,
    required this.percentOfDailyNeeds,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
    name: json["name"],
    amount: json["amount"]?.toDouble(),
    unit: json["unit"],
    percentOfDailyNeeds: json["percentOfDailyNeeds"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount,
    "unit": unit,
    "percentOfDailyNeeds": percentOfDailyNeeds,
  };
}
