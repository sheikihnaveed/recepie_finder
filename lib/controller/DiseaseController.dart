import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/DiseaseItem.dart';

class DiseaseController extends GetxController {
  final isLoading = true.obs;
  final morningList = <DiseaseItem>[].obs;
  final afternoonList = <DiseaseItem>[].obs;
  final eveningList = <DiseaseItem>[].obs;
  final nightList = <DiseaseItem>[].obs;
  var docIds = <String>[].obs;
  final doctorName = ''.obs;
  final doctorImageUrl = ''.obs;

  @override
  void onInit() {
    fetchAllDocIds();
    super.onInit();
  }

  void fetchAllDocIds() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('disease_diets')
        .get();

    final ids = snapshot.docs.map((doc) => doc.id).toList();
    docIds.value = ids;
  }

  void fetchDietForDisease(String diseaseId) async {
    final doc = await FirebaseFirestore.instance
        .collection("disease_diets")
        .doc(diseaseId)
        .get();

    if (doc.exists) {
      final data = doc.data()?['data'];
      if (data == null) {
        print("No 'data' field found!");
        return;
      }
      doctorName(data["doctorName"]);
      doctorImageUrl(data["drImageUrl"]);
      final schedule = data['schedule'];
      print("Morning Schedule: ${schedule['Morning']}");


      morningList.value = _parseDietList(schedule['Morning']);
      afternoonList.value = _parseDietList(schedule['Afternoon']);
      eveningList.value = _parseDietList(schedule['Evening']);
      nightList.value = _parseDietList(schedule['Night']);
      isLoading.value = false;
    } else {
      print("Document not found!");
    }
  }

  List<DiseaseItem> _parseDietList(dynamic list) {
    if (list is List) {
      return list.map((e) => DiseaseItem.fromMap(Map<String, dynamic>.from(e))).toList();
    }
    return [];
  }
}
