import 'package:flutter/material.dart';
import 'package:recipe_finder/models/getAnalyzedInstructions.dart';

class Instructions extends StatelessWidget {
  final List<GetAnalyzedInstructions>? onlineData;
  final List<String>? offlineData;
  final bool isOffline;

  const Instructions({
    super.key,
    this.onlineData,
    this.offlineData,
    required this.isOffline,
  });

  @override
  Widget build(BuildContext context) {
    final steps = isOffline
        ? offlineData ?? []
        : (onlineData != null && onlineData!.isNotEmpty
        ? onlineData![0].steps
        : []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Instructions to Prepare:',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins-Regular",
          ),
        ),
        const SizedBox(height: 8),
        steps.isEmpty
            ? const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Currently no instructions found",
              style: TextStyle(fontFamily: "Poppins-Regular"),
            ),
          ),
        )
            : ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: steps.length,
          itemBuilder: (context, index) {
            final stepText = isOffline
                ? steps[index]
                : steps[index].step;
            final stepNumber = isOffline
                ? 'Step - ${index + 1}'
                : 'Step - ${steps[index].number}';

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: ListTile(
                    title: Text(
                      stepNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: "Poppins-Regular",
                      ),
                    ),
                    subtitle: Text(
                      stepText,
                      style: const TextStyle(
                        fontFamily: "Poppins-Regular",
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
