import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_finder/controller/DiseaseController.dart';
import 'package:recipe_finder/views/disease/diseaseDetail.dart';

class Disease extends StatelessWidget {
  final controller = Get.put(DiseaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Disease Diet")),
      body: Obx(() {
        if (controller.docIds.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.docIds.length,
          itemBuilder: (context, index) {
            final id = controller.docIds[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(
                  id.capitalize.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: "Poppins-Regular",
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  print("Selected ID: $id");
                  controller.fetchDietForDisease(id);
                  Get.to(() => DiseaseDetails(id));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
