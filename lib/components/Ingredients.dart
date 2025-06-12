import 'package:flutter/material.dart';
import 'package:recipe_finder/components/progress.dart';

class Ingredients extends StatelessWidget {
  final List<dynamic>? onlineData;
  final List<String>? offlineData;
  final bool isOffline;

  const Ingredients({
    super.key,
    required this.onlineData,
    required this.offlineData,
    required this.isOffline,
  });

  @override
  Widget build(BuildContext context) {
    final ingredients = isOffline ? offlineData : onlineData;

    if (ingredients == null || ingredients.isEmpty) {
      return const loading();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Ingredients:',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins-Regular"),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  child: Card(
                    child: ListTile(
                      title: Text(
                        isOffline
                            ? ingredients[index]
                            : ingredients[index].name.toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins-Regular",
                            fontSize: 14),
                      ),
                      subtitle: isOffline
                          ? null
                          : Text(
                        '${ingredients[index].amount.us.value} - ${ingredients[index].amount.us.unit}',
                        style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontFamily: "Poppins-Regular"),
                      ),
                      onTap: () {
                        // Handle tap
                      },
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
