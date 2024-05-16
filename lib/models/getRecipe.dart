
import 'dart:convert';

List<GetRecipe> getRecipeFromJson(String str) => List<GetRecipe>.from(json.decode(str).map((x) => GetRecipe.fromJson(x)));

String getRecipeToJson(List<GetRecipe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetRecipe {
  final int id;
  final String image;
  final String title;

  GetRecipe({
    required this.id,
    required this.image,
    required this.title,
  });

  factory GetRecipe.fromJson(Map<String, dynamic> json) => GetRecipe(
    id: json["id"],
    image: json["image"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
  };
}
