import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/controller/DiseaseController.dart';
import 'package:recipe_finder/models/DiseaseItem.dart';
import 'package:recipe_finder/utilities/colors.dart';

class DiseaseDetails extends StatelessWidget {
  final controller = Get.put(DiseaseController());
  String title;
  DiseaseDetails(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "$title Disease Plan".capitalize.toString(),
      )),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      NetworkImage(controller.doctorImageUrl.value),
                ),
                title: const Text("Recommended by"),
                subtitle: Text(
                    "Dr. ${controller.doctorName}".capitalize.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins-Regular")),
              ),
              Expanded(
                child: ListView(
                  children: [
                    buildMealCard("Morning", controller.morningList),
                    buildMealCard("Afternoon", controller.afternoonList),
                    buildMealCard("Evening", controller.eveningList),
                    buildMealCard("Night", controller.nightList),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget buildMealCard(String title, List<DiseaseItem> items) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins-Regular")),
            const SizedBox(height: 8),
            if (items.isEmpty)
              const Text("No items available",
                  style: TextStyle(
                      color: Colors.grey, fontFamily: "Poppins-Regular"))
            else
              ...items.map((item) => Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Card(
                      color: CColors.softGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              Text(
                                "Time: ${item.time}.",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Poppins-Regular"),
                              ),
                              Text(
                                "Indigents: ${item.item.capitalize.toString()}.",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Poppins-Regular"),
                              ),
                              Text(
                                "Quantity: ${item.quantity}.",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Poppins-Regular"),
                              ),
                              if (item.includes != null)
                                Text(
                                  "Includes: ${item.includes}.",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: "Poppins-Regular"),
                                ),
                            ]),
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
