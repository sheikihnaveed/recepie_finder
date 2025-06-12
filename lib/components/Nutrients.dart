import 'package:flutter/material.dart';
import 'package:recipe_finder/components/progress.dart';
import 'package:recipe_finder/models/getNutrients.dart';

class Nutrients extends StatelessWidget {
  final List<Nutrient>? onlineData;
  final List<String>? offlineData;
  final bool isOffline;

  const Nutrients({
    super.key,
    this.onlineData,
    this.offlineData,
    required this.isOffline,
  });

  @override
  Widget build(BuildContext context) {
    final items = isOffline ? offlineData ?? [] : onlineData ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nutritions:',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins-Regular",
          ),
        ),
        const SizedBox(height: 8),
        items.isEmpty
            ? const loading()
            : SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  child: Card(
                    child: ListTile(
                      title: Text(
                        isOffline
                            ? items[index] as String
                            : (items[index] as Nutrient).name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins-Regular",
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Text(
                        isOffline
                            ? ""
                            : '${(items[index] as Nutrient).amount} ${(items[index] as Nutrient).unit}',
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontFamily: "Poppins-Regular",
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
